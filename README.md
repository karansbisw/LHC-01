# LHC-01Wearable Navigation Assistant for the Visually Impaired
This is the final year project for a wearable, real-time navigation system developed on the NVIDIA Jetson Nano. The system integrates voice-based guidance, obstacle detection via YOLOv3-Tiny, SLAM mapping via RTAB-Map, and outdoor navigation using GPS and Google Maps API.

🔧 Hardware Requirements
NVIDIA Jetson Nano (4GB)


Intel RealSense D455 (for RGB-D vision)


ATGM332D GPS Module (UART to USB)


Headphones (for espeak audio output)


WiFi Dongle or Ethernet (for initial setup and Google Maps routing)


Portable power bank (via micro-USB)



🧰 Software Stack
Ubuntu 18.04 LTS


ROS 1 Melodic


Python 2 & Python 3 (split for ROS compatibility and script needs)


RTAB-Map ROS for SLAM


OpenCV + YOLOv3-Tiny for object detection


Google Maps API for turn-by-turn instructions


espeak for voice feedback


JetPack SDK for driver and GPU acceleration



📂 Project Structure
catkin_ws/
├── src/
│   └── object_detection/
│       ├── scripts/
│       │   ├── gps_reader.py
│       │   ├── navigation_planner.py
│       │   └── tiny_yolo_semantic_node.py
│       ├── launch/
│       │   └── wearable_nav.launch
│       └── config/


🚀 How to Run
🔁 Terminal 1 (Start full system):
source ~/catkin_ws/devel/setup.bash
roslaunch object_detection wearable_nav.launch

This launches:
RealSense D455


RTAB-Map SLAM


YOLOv3-Tiny object detection


GPS Reader Node


Navigation Planner


Make sure your RealSense camera is connected and powered, and your GPS is connected to /dev/ttyUSB0.
🛰️ Terminal 2 (Manually start navigation planner if needed):
source ~/catkin_ws/devel/setup.bash
rosrun object_detection navigation_planner.py

This script:
Waits for GPS signal


Sends voice prompts with navigation directions


Publishes /start_navigation to begin object detection



🧪 Demo Video & Presentation
YouTube Demo (update with actual link)


Presentation Slides (update with link)



📦 Dependencies
Install dependencies:
sudo apt install espeak python3-serial ros-melodic-rtabmap-ros
pip3 install opencv-python requests


📌 Notes
GPS might not work indoors. You can use simulated data.


If camera crashes on headless boot, make sure HDMI dummy plug or X11 config is active.


You may need to set nvpmodel -m 0 and reboot to get full Jetson Nano performance.



👨‍💻 Author
Karan Singh Biswakarma
 City University of Hong Kong
 Final Year Project (2025)

📄 License
MIT License

For any issues, feel free to open an issue on the GitHub repo.