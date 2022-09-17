# Calibration Dataset

In the $1^{st}$ dataset, we move the centroid of the rigid body on tag $1$, so that the motion capture system can can provide us with the true position of tag $1$ in real time. We then use the true position of tag $1$ and fixed positions of 8 anchors to calculate the true distance measurements, and use them to calibrate the bias between tag $1$ and 8 anchors.

Similarly, we collect the $2^{nd}$ and $3^{rd}$ dataset,  and use them to calibrate the bias between tag $2,3$ and 8 anchors.



### Settings

##### Coordinates of UWB anchors in the global reference frame

|          | $X^{\mathcal{G}}(m)$ | $Y^{\mathcal{G}}(m)$ | $Z^{\mathcal{G}}(m)$ |
| -------- | -------------------- | -------------------- | -------------------- |
| Anchor 0 | -3.4203              | 3.0053               | 1.0442               |
| Anchor 1 | 0.0016               | 3.0110               | 1.0446               |
| Anchor 2 | 3.6056               | 2.9795               | 1.0463               |
| Anchor 3 | 3.6011               | -0.0008              | 1.0422               |
| Anchor 4 | 3.5674               | -3.0087              | 1.0443               |
| Anchor 5 | -0.0072              | -2.9652              | 1.0444               |
| Anchor 6 | -3.4673              | -2.9587              | 1.0445               |
| Anchor 7 | -3.4858              | -0.0098              | 1.0457               |

### Data format

#### Motion capture data

There are 8 columns of motion capture data. The first column is time,  columns 2-4 are the coordinates of corresponding tag in the global reference frame, and columns 5-8 are the  are quaternions.

| time | $X^{\mathcal{G}}(m)$ | $Y^{\mathcal{G}}(m)$ | $Z^{\mathcal{G}}(m)$ | $q_w$ | $q_\bf{x}$ | $q_\bf{y}$ | $q_\bf{z}$ |
| :--: | :------------------: | :------------------: | :------------------: | :---: | :--------: | :--------: | :--------: |

#### UWB data

There are 25 columns of UWB data. The first column is time,  columns 2-25 are the UWB range measurements, and  its correspondence between anchor and tag is as follows. 

| time | a0-t0 | a0-t1 | a0-t2 | a1-t0 | a1-t1 | a1-t2 | a2-t0 | a2-t1 | a2-t2 | a3-t0 | a3-t1 | a3-t2 | a4-t0 | a4-t1 | a4-t2 | a5-t0 | a5-t1 | a5-t2 | a6-t0 | a6-t1 | a6-t2 | a7-t0 | a7-t1 | a7-t2 |
| :--: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |

We do not use all of these 24 columns of data. For the $i^{th}$ dataset, we only use the distance measurements with respect to tag  $i$.
