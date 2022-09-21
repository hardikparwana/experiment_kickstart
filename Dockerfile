FROM chenrc98/vicon_px4_ros2_bridge:version1.1

RUN apt-get update && apt-get install -y --no-install-recommends vim tmux && rm -rf /var/lib/apt/lists

RUN echo "source /opt/ros/galactic/setup.bash" >> /root/.bashrc
RUN echo "source /root/px4_ros_com_ros2/install/setup.bash" >> /root/.bashrc

RUN apt-get update && apt-get install -y libgmp3-dev

RUN apt-key adv -y --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u
RUN apt-get install -y librealsense2-dkms librealsense2-utils librealsense2-dev librealsense2-dbg
RUN apt install -y ros-galactic-diagnostic-updater
RUN apt install ros-galactic-compressed-image-transport

# install additional dependencies
#RUN python3 -m pip install --upgrade ortools cvxpy pandas tqdm pypoman gurobipy

RUN echo "PYTHONPATH=/root/px4_ros_com_ros2/src/robot-framework-py:${PYTHONPATH}" >> ~/.bashrc

WORKDIR "/root/px4_ros_com_ros2"
