# UWB Pose Estimation Datasets
**Efficient Planar Pose Estimation via UWB Measurements**. Haodong JIANG, Yuan SHEN, Wentao WANG, Xinghan LI, Xiaoqiang Ren, Biqiang MU, and Junfeng WU. The paper is going to be present at ICRA 2023 and now available in [arXiv](https://arxiv.org/abs/2209.06779). If you find the code or data in this repository useful in your research, please cite our paper:

 ```latex
@misc{jiang2022efficient,
      title={Efficient Planar Pose Estimation via UWB Measurements}, 
      author={Haodong Jiang and Wentao Wang and Yuan Shen and Xinghan Li and Xiaoqiang Ren and Biqiang Mu and Junfeng Wu},
      year={2022},
      eprint={2209.06779},
      archivePrefix={arXiv},
      primaryClass={cs.RO}
}
 ```

## Introduction
This repository contains a dataset for studying the planar pose estimation via UWB range measurements. We also include the MATLAB code for simulations and experiments, where we compare our **GN-ULS** estimator with earlier studies. 

Compared to previous datasets, this dataset is tailored for the so-called **Rigid Body Localization(RBL)** problem, where multiple tags are deployed on a rigid body so that both rotation and position are coupled in range measurements, as shown in the following figure. The least requirement for the planar case is two tags which are not co-linear with the origin of local reference frame and three anchors which are not co-linear. In this dataset, we deploy three tags and eight anchors.
<img src="Images\Planar RBL.jpg" alt="Planar Pose Estimation via Range Measurements" style="zoom:10%;" />

In addition, in our paper you will find:
- Review of previous works on planar **RBL** problem.
- Design of the **GN-ULS** estimator, which provably achieve the Cramer-Rao lower bound.
- Simulation results and discussions.
- Experiment results and discussions.

## Repository structure

The repository is divided into following parts: simulations, planar dataset, experiments. The 3D dataset is to be updated.

### Simulations

Contains MATLAB Codes for simulations.

### Planar_Dataset

Contains static and dynamic UWB datasets tailored for the planar **RBL** problem.

### Static_Experiment & Dynamic_Experiment

Contains MATLAB Codes realizing

1. calibration
2. outlier rejection and interpolation
3. alignment between motion capture and UWB measurements 
4. static pose estimation
5. dynamic pose estimation

