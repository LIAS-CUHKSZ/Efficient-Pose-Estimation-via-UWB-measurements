# Dynamic Dataset

We controlled the trolley to move at different speeds and collected fast, medium, and slow datasets. The average speed was respectively 0.49m/s, 0.23m/s and 0.11m/s.

### Settings

##### Coordinates of UWB tags in the local reference frame

|       | $X^{\mathcal{L}}(m)$ | $Y^{\mathcal{L}}(m)$ |
| ----- | -------------------- | -------------------- |
| Tag 0 | -0.06892             | -0.14229             |
| Tag 1 | -0.07504             | 0.140209             |
| Tag 2 | 0.203416             | 0.145076             |

##### Coordinates of UWB anchors in the global reference frame

|          | $X^{\mathcal{G}}(m)$ | $Y^{\mathcal{G}}(m)$ |
| -------- | -------------------- | -------------------- |
| Anchor 0 | -3.42                | 3.005                |
| Anchor 1 | 0.002                | 3.011                |
| Anchor 2 | 3.606                | 2.979                |
| Anchor 3 | 3.601                | -0.001               |
| Anchor 4 | 3.567                | -3.009               |
| Anchor 5 | -0.007               | -2.965               |
| Anchor 6 | -3.467               | -2.959               |
| Anchor 7 | -3.486               | -0.01                |

### Data format

#### Motion capture data

There are 8 columns of motion capture data. The first column is time,  columns 2-4 are the coordinates of rigid body centroid in the global reference frame, whose coordinates in the local reference frame are (0,0,0), and columns 5-8 are the  are quaternions.

| time | $X^{\mathcal{G}}(m)$ | $Y^{\mathcal{G}}(m)$ | $Z^{\mathcal{G}}(m)$ | $q_w$ | $q_\bf{x}$ | $q_\bf{y}$ | $q_\bf{z}$ |
| :--: | :------------------: | :------------------: | :------------------: | :---: | :--------: | :--------: | :--------: |

#### UWB data

There are 25 columns of UWB data. The first column is time,  columns 2-25 are the UWB range measurements, and  its correspondence between anchor and tag is as follows.

| time | a0-t0 | a0-t1 | a0-t2 | a1-t0 | a1-t1 | a1-t2 | a2-t0 | a2-t1 | a2-t2 | a3-t0 | a3-t1 | a3-t2 | a4-t0 | a4-t1 | a4-t2 | a5-t0 | a5-t1 | a5-t2 | a6-t0 | a6-t1 | a6-t2 | a7-t0 | a7-t1 |
| :--: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |

# Calibration Dataset

More information in the corresponding folder.
