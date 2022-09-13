# UWB Pose Estimation Datasets
**Efficient Planar Pose Estimation via UWB Measurements**. Haodong JIANG, Yuan SHEN, Wentao WANG, Xinghan LI, and Junfeng WU. The paper is available in [arXiv](https://www.baidu.com/). If you find the code or data in this repository useful in your research, please cite our paper:
 ```
 @article{
 }
 ```

## Introduction
This repository contains a dataset for studying the planar pose estimation via UWB range measurements. We also include the matlab code for simulations and experimenets, where we compare our **GN-ULS** estimator with earlier stuides. 

Compared to previous datasets, this dataset is tailored for the so-called **Rigid Body Localization(RBL)** problem, where multiple tags are deployed on a rigid body so that both rotation and position are coupled in range measurements. The least requirement for the planar case is two tags which are not colinear with the origin of local refernce frame and three anchors which are not colinear. In this dataset, we deploy three tags and eight anchors.

In addition, in our paper you will find:
- Review of previous works on planar **(RBL)** problem.
- Design of the **GN-ULS** estimator, which provably achieve the Cramer-Rao lower bound.
- Simulation results and dicussions.
- Experiment results and discussions.

## Repository structure

The repository is divided into following parts: Matlab code for simulations, raw planar dataset, Matlab code for experiements. 

### Matlab Code for Simulations

### Raw Planar Dataset

### Matlab Code for Experiments


## 2D

### 1. 数据格式

其中csv为原始数据未作修改，xlsx为另存数据

#### 1.1 UWB数据

​	**第1列**是序号

​	**第2列**是时间

​	**第3-26列**是8个anchor到3个sensor到的距离数据，共24列，是按照==anchor×sensor==来排列的，即第3-5列数据是anchor0到3个sensor的数据，第6-8列数据是anchor1到3个sensor的数据，以此类推

#### 1.2 动捕数据

​	**第1列**是时间

​	**第2-4列**是世界坐标系下（即动捕坐标系）**刚体质心**的位置坐标(x,y,z)

​	**第5-7列**是四元数（第一位为实部），表示动捕坐标系-->刚体坐标系的旋转, 转化成欧拉角顺序为：==’Y, X, Z'==,对应==[yaw, pitch, roll]==

### 2. 实验

#### 2.1 UWB Calibration

分别标定了3个sensor到8个anchor的误差，其中动捕给出的位置坐标就是sensor的世界坐标，即这里把质心分别移到了3个sensor上

#### 2.2 Static

8.14测了5个pose, 每个pose分别测了6个不同的yaw,共测了30组数据

8.20测了2个pose, 每个pose分别测了6个不同的yaw,共测了12组数据

#### 2.3 Dynamic

采用3个不同的速度测了3组数据

## 3D

共测了3组cali

### 1.数据格式

#### 1.1 UWB数据

​	**第1列**是时间

​	**第2-17列**是是4个sensor到4个anchor的距离数据，sensor共16列，是按照==sensor×anchor==来排列的，即第2-5列数据是sensor0到4个anchor的数据，第6-9列数据是sensor1到4个anchor的数据，以此类推

#### 1.2 动捕数据

​	**第1列**是时间

​	**第2-4列**是世界坐标系下（即动捕坐标系）**刚体质心**的位置坐标(x,y,z)

​	**第5-7列**是四元数（第一位为实部），表示动捕坐标系-->刚体坐标系的旋转

#### 1.3 IMU数据

​	**第1列**是时间

​	**第2-4列**是欧拉角，旋转顺序：==‘Z, Y, X'==，三列分别对应==[roll(X),pitch(Y),yaw(Z)]==

​	**第5-7列**是陀螺仪原始角速度[x,y,z]

​	**第8-10列**是陀螺仪滤波后角速度[x,y,z]

​	**第11-13列**是加速度计原始加速度[x,y,z]

​	**第14-16列**是加速度计滤波加速度[x,y,z]
