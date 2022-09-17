## Bias Calibration for Static Datasets

We use the calibration datasets in 

[calibration_dataset]: ../../Planar_Dataset/Dynamic/calibration_dataset

to calibrate the distance-related bias. There are three calibration datasets, each is used to calibrate the ranging bias between one tag and all eight anchors.  

We also need to reject the outliers and conduct alignment in the calibration datasets, but we don not interpolate the UWB measurements when an outlier occur. We simply discard the outliers and do not use them for calibration.

