#!/usr/bin/env python3
import rospy
import requests
import os
from std_msgs.msg import String
from sensor_msgs.msg import NavSatFix
from math import radians, cos, sin, sqrt, atan2
import json

# === DEMO MODE ===
USE_FAKE_GPS = True
SPEAK_INTERVAL = 30  # seconds
FAKE_LAT = 22.3375
FAKE_LON = 114.2636

destination = "Hong Kong Baptist University"
GOOGLE_MAPS_API_KEY = "AIzaSyA2Vg8bNSpD_dJkpZuvlJYTAW8Xzf_7ZaA"

instructions = []
last_step_index = 0
current_lat = FAKE_LAT
current_lon = FAKE_LON

def speak(text):
    rospy.loginfo(text)
    os.system('espeak "%s"' % text)

def haversine_distance(lat1, lon1, lat2, lon2):
    R = 6371  # Earth radius in km
    dlat = radians(lat2 - lat1)
    dlon = radians(lon2 - lon1)
    a = sin(dlat/2)**2 + cos(radians(lat1)) * cos(radians(lat2)) * sin(dlon/2)**2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))
    return R * c

def fetch_route(origin_lat, origin_lon, destination):
    json_file = "/home/karan/route.json"

    if os.path.exists(json_file):
        rospy.loginfo("Loading route from JSON...")
        with open(json_file, 'r') as f:
            return json.load(f)

    rospy.loginfo("Fetching new route from Google Maps API...")
    dest_query = destination.replace(" ", "+")
    url = "https://maps.googleapis.com/maps/api/directions/json?origin={0},{1}&destination={2}&mode=walking&key={3}".format(
        origin_lat, origin_lon, dest_query, GOOGLE_MAPS_API_KEY)

    try:
        resp = requests.get(url)
        data = resp.json()
        if data['status'] != "OK":
            rospy.logerr("Google Maps API error: %s", data['status'])
            return None
        steps = data['routes'][0]['legs'][0]['steps']
        with open(json_file, 'w') as f:
            json.dump(steps, f)
        return steps
    except Exception as e:
        rospy.logerr("Failed to fetch route: %s", e)
        return None

def gps_callback(msg):
    global current_lat, current_lon
    if msg.status.status >= 0:
        current_lat = msg.latitude
        current_lon = msg.longitude

def check_position(event):
    global last_step_index
    if last_step_index < len(instructions):
        step = instructions[last_step_index]
        spoken = step['html_instructions']
        spoken = spoken.replace("<b>", "").replace("</b>", "")
        spoken = spoken.replace("<div style=\"font-size:0.9em\">", ". ").replace("</div>", "")
        speak(spoken)
        last_step_index += 1
    else:
        speak("Navigation complete.")
        rospy.signal_shutdown("Demo complete")

def start_navigation():
    global instructions
    speak("Starting demo navigation and object detection now.")
    rospy.sleep(1)
    start_pub.publish("start")  # Signal YOLO
    instructions = fetch_route(current_lat, current_lon, destination)
    if not instructions:
        speak("Route not found.")
        return
    rospy.Timer(rospy.Duration(SPEAK_INTERVAL), check_position)

if __name__ == "__main__":
    rospy.init_node("navigation_planner_demo")
    start_pub = rospy.Publisher("/start_navigation", String, queue_size=1, latch=True)

    if not USE_FAKE_GPS:
        rospy.Subscriber("/gps/fix", NavSatFix, gps_callback)
        rospy.loginfo("Waiting for real GPS fix...")
        while not rospy.is_shutdown() and (current_lat is None or current_lon is None):
            rospy.sleep(1)

    start_navigation()
    rospy.spin()



