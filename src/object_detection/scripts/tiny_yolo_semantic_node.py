#!/usr/bin/env python
import rospy
import cv2
import numpy as np
import tf
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from std_msgs.msg import String
import os


class YoloSemanticNode:
    def __init__(self):
        rospy.init_node('tiny_yolo_semantic_node')
        self.bridge = CvBridge()
        self.listener = tf.TransformListener()

        self.navigation_started = False
        rospy.Subscriber("/start_navigation", String, self.nav_callback)

        self.image_sub = rospy.Subscriber("/camera/color/image_raw", Image, self.image_callback)
        self.semantic_pub = rospy.Publisher("/semantic_objects", String, queue_size=10)

        self.net = cv2.dnn.readNetFromDarknet(
            '/home/karan/yolo_weights/yolov3-tiny.cfg',
            '/home/karan/yolo_weights/yolov3-tiny.weights'
        )
        self.classes = open('/home/karan/yolo_weights/coco.names').read().strip().split('\n')
        self.output_layers = self.net.getUnconnectedOutLayersNames()

        rospy.loginfo("YOLOv3-Tiny Semantic Node Ready. Waiting for navigation to start...")
        rospy.spin()

    def nav_callback(self, msg):
        if msg.data == "start":
            self.navigation_started = True
            rospy.loginfo("Navigation started. Object detection activated.")

    def image_callback(self, msg):
        if not self.navigation_started:
            return

        try:
            frame = self.bridge.imgmsg_to_cv2(msg, "bgr8")
        except Exception as e:
            rospy.logerr("CV Bridge error: %s", e)
            return

        height, width = frame.shape[:2]
        blob = cv2.dnn.blobFromImage(frame, 1/255.0, (320, 320), swapRB=True, crop=False)
        self.net.setInput(blob)
        detections = self.net.forward(self.output_layers)

        boxes, confidences, class_ids = [], [], []

        for out in detections:
            for detection in out:
                scores = detection[5:]
                class_id = np.argmax(scores)
                confidence = scores[class_id]
                if confidence > 0.4:
                    center_x = int(detection[0] * width)
                    center_y = int(detection[1] * height)
                    w = int(detection[2] * width)
                    h = int(detection[3] * height)
                    x = int(center_x - w / 2)
                    y = int(center_y - h / 2)
                    boxes.append([x, y, w, h])
                    confidences.append(float(confidence))
                    class_ids.append(class_id)

        indices = cv2.dnn.NMSBoxes(boxes, confidences, 0.4, 0.4)

        for i in indices:
            i = i[0]
            box = boxes[i]
            x, y, w, h = box
            label_text = "{}: {}%".format(self.classes[class_ids[i]], int(confidences[i] * 100))
            cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)
            cv2.putText(frame, label_text, (x, y - 5), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 1)

            try:
                self.listener.waitForTransform("/map", "/camera_link", rospy.Time(0), rospy.Duration(1.0))
                (trans, rot) = self.listener.lookupTransform("/map", "/camera_link", rospy.Time(0))
                position_str = "x: {:.2f}, y: {:.2f}, z: {:.2f}".format(trans[0], trans[1], trans[2])
                semantic_msg = "{} at {}".format(self.classes[class_ids[i]], position_str)

                self.semantic_pub.publish(semantic_msg)
                rospy.loginfo(semantic_msg)

                os.system('espeak "{}"'.format(self.classes[class_ids[i]]))

            except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
                rospy.logwarn("TF transform not available")

        cv2.imshow("YOLOv3-Tiny Detection", frame)
        cv2.waitKey(1)


if __name__ == '__main__':
    YoloSemanticNode()



