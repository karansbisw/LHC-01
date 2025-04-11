#!/usr/bin/env python3
import rospy
import speech_recognition as sr
from std_msgs.msg import String

def listen_and_publish():
    rospy.init_node('voice_input_node')
    pub = rospy.Publisher('/voice_destination', String, queue_size=10)
    recognizer = sr.Recognizer()
    mic = sr.Microphone()

    rospy.loginfo("Voice input node is ready. Say a destination...")

    with mic as source:
        recognizer.adjust_for_ambient_noise(source)
        while not rospy.is_shutdown():
            try:
                rospy.loginfo("Listening...")
                audio = recognizer.listen(source, timeout=5)
                destination = recognizer.recognize_google(audio)
                rospy.loginfo(f"Recognized: {destination}")
                pub.publish(destination)
            except sr.WaitTimeoutError:
                rospy.logwarn("Timeout: No speech detected.")
            except sr.UnknownValueError:
                rospy.logwarn("Could not understand the audio.")
            except sr.RequestError as e:
                rospy.logerr("API error: {0}".format(e))

if __name__ == '__main__':
    listen_and_publish()
