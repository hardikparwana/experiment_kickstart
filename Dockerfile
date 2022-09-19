FROM chenrc98/vicon_px4_ros2_bridge:version1.1

RUN apt-get update && apt-get install -y --no-install-recommends vim tmux && rm -rf /var/lib/apt/lists

RUN echo "source /opt/ros/galactic/setup.bash" >> /root/.bashrc
RUN echo "source /root/px4_ros_com_ros2/install/setup.bash" >> /root/.bashrc

RUN apt-get update && apt-get install -y libgmp3-dev

# install additional dependencies
#RUN python3 -m pip install --upgrade ortools cvxpy pandas tqdm pypoman gurobipy

RUN echo "PYTHONPATH=/root/px4_ros_com_ros2/src/robot-framework-py:${PYTHONPATH}" >> ~/.bashrc

WORKDIR "/root/px4_ros_com_ros2"
