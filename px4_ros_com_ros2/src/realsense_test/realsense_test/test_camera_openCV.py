import rclpy
from rclpy.node import Node
import numpy as np
from cv_bridge import CvBridge # Package to convert between ROS and OpenCV Images
import cv2 # OpenCV library
import threading

from std_msgs.msg import String

def main(args=None):
    rclpy.init(args=args)
    node = rclpy.create_node('minimal_publisher')

    # Spin in a separate thread
    thread = threading.Thread(target=rclpy.spin, args=(node, ), daemon=True)
    thread.start()
    rate = node.create_rate(30)

    publisher = node.create_publisher(String, 'topic', 10)
    
    msg = String()

    i = 0
    while rclpy.ok():
        msg.data = 'Hello World: %d' % i
        i += 1
        node.get_logger().info('Publishing: "%s"' % msg.data)
        publisher.publish(msg)

        rate.sleep()

    node.destroy_node()
    rclpy.shutdown()
