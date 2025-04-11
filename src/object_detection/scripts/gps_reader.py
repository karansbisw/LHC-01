#!/usr/bin/env python
import rospy
import serial
from sensor_msgs.msg import NavSatFix

def parse_gpgga(line):
    if "$GPGGA" not in line:
        return None, None

    try:
        parts = line.split(',')
        if len(parts) < 6:
            return None, None

        # Latitude
        lat_raw = parts[2]
        lat_dir = parts[3]
        lon_raw = parts[4]
        lon_dir = parts[5]

        if not lat_raw or not lon_raw:
            return None, None

        lat_deg = float(lat_raw[:2])
        lat_min = float(lat_raw[2:])
        lat = lat_deg + (lat_min / 60.0)
        if lat_dir == "S":
            lat = -lat

        lon_deg = float(lon_raw[:3])
        lon_min = float(lon_raw[3:])
        lon = lon_deg + (lon_min / 60.0)
        if lon_dir == "W":
            lon = -lon

        return lat, lon

    except Exception as e:
        rospy.logwarn("Failed to parse GPGGA: %s", e)
        return None, None

def gps_node():
    rospy.init_node('gps_reader_node')
    pub = rospy.Publisher('/gps/fix', NavSatFix, queue_size=10)

    port = rospy.get_param("~port", "/dev/ttyUSB0")  # Update if connected to another port
    baud = rospy.get_param("~baudrate", 9600)

    try:
        ser = serial.Serial(port, baud, timeout=1)
        rospy.loginfo("GPS serial connected on %s at %d baud", port, baud)
    except serial.SerialException:
        rospy.logerr("Could not open serial port %s", port)
        return

    rate = rospy.Rate(1)  # 1 Hz
    while not rospy.is_shutdown():
        line = ser.readline().decode('utf-8', errors='ignore')
        lat, lon = parse_gpgga(line)
        if lat and lon:
            msg = NavSatFix()
            msg.latitude = lat
            msg.longitude = lon
            msg.altitude = 0.0  # Optional
            msg.header.stamp = rospy.Time.now()
            msg.header.frame_id = "gps"
            pub.publish(msg)
            rospy.loginfo("Published GPS: lat=%.6f, lon=%.6f", lat, lon)

        rate.sleep()

if __name__ == '__main__':
    try:
        gps_node()
    except rospy.ROSInterruptException:
        pass



