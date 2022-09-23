FROM chenrc98/vicon_px4_ros2_bridge:version1.1

RUN apt-get update && apt-get install -y --no-install-recommends vim tmux && rm -rf /var/lib/apt/lists

RUN echo "source /opt/ros/galactic/setup.bash" >> /root/.bashrc
RUN echo "source /root/px4_ros_com_ros2/install/setup.bash" >> /root/.bashrc

RUN apt-get update && apt-get install -y libgmp3-dev

# install additional dependencies
#RUN python3 -m pip install --upgrade ortools cvxpy pandas tqdm pypoman gurobipy
RUN python3 -m pip install numpy==1.22.3 gym==0.26.0 gym-notices==0.0.8 gym-recording==0.0.1 gpytorch==1.8.1 scipy==1.8.0 scikit-learn==1.0.2 torch==1.12.1 torchmetrics==0.9.3 torchquad==0.3.0 torchvision==0.13.1 tensorboard==2.9.1 tensorboard-data-server==0.6.1 tensorboard-plugin-wit==1.8.1 PyYAML==6.0 pygame==2.1.2 pandas==1.4.3 gurobipy==9.5.1 cvxpy==1.2.0 cvxpylayers==0.1.5 Box2D==2.3.10 cartpole==0.0.1
RUN apt install ros-galactic-compressed-image-transport



#RUN echo "PYTHONPATH=/root/px4_ros_com_ros2/src/robot-framework-py:${PYTHONPATH}" >> ~/.bashrc

WORKDIR "/root/px4_ros_com_ros2"
