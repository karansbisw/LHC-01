#!/usr/bin/env python
import rospy
from sensor_msgs.msg import NavSatFix

def publish_fake_gps():
    rospy.init_node('fake_gps_node')
    pub = rospy.Publisher('/gps/fix', NavSatFix, queue_size=10)
    rate = rospy.Rate(1)  # 1 Hz

    fake_lat = 22.3364  # CityU HK
    fake_lon = 114.2656

    while not rospy.is_shutdown():
        msg = NavSatFix()
        msg.latitude = fake_lat
        msg.longitude = fake_lon
        msg.altitude = 0.0
        msg.header.stamp = rospy.Time.now()
        msg.header.frame_id = "gps"
        pub.publish(msg)
        rate.sleep()

if __name__ == '__main__':
    publish_fake_gps()



