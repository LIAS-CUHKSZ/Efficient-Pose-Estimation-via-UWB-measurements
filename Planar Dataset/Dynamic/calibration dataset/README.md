# Calibration Dataset

For 3 tags, we measured each tag with 8 anchors for calibration. And for each tag, motion capture data and UWB data were collected.

### Settings

##### Coordinates of UWB anchors in the global reference frame

|          | $X^{\mathcal{G}}(m)$ | $Y^{\mathcal{G}}(m)$ | $Z^{\mathcal{G}}(m)$ |
| -------- | -------------------- | -------------------- | -------------------- |
| Anchor 0 | -3.42                | 3.005                | 1.044                |
| Anchor 1 | 0.002                | 3.011                | 1.045                |
| Anchor 2 | 3.606                | 2.979                | 1.046                |
| Anchor 3 | 3.601                | -0.001               | 1.042                |
| Anchor 4 | 3.567                | -3.009               | 1.044                |
| Anchor 5 | -0.007               | -2.965               | 1.044                |
| Anchor 6 | -3.467               | -2.959               | 1.045                |
| Anchor 7 | -3.486               | -0.01                | 1.046                |

### Data format

#### Motion capture data

There are 8 columns of motion capture data. The first column is time,  columns 2-4 are the coordinates of corresponding tag in the global reference frame, and columns 5-8 are the  are quaternions.

| time | $X^{\mathcal{G}}(m)$ | $Y^{\mathcal{G}}(m)$ | $Z^{\mathcal{G}}(m)$ | $q_w$ | $q_\bf{x}$ | $q_\bf{y}$ | $q_\bf{z}$ |
| :--: | :------------------: | :------------------: | :------------------: | :---: | :--------: | :--------: | :--------: |

#### UWB data

There are 25 columns of UWB data. The first column is time,  columns 2-25 are the UWB range measurements, and  its correspondence between anchor and tag is as follows. 

| time | a0-t0 | a0-t1 | a0-t2 | a1-t0 | a1-t1 | a1-t2 | a2-t0 | a2-t1 | a2-t2 | a3-t0 | a3-t1 | a3-t2 | a4-t0 | a4-t1 | a4-t2 | a5-t0 | a5-t1 | a5-t2 | a6-t0 | a6-t1 | a6-t2 | a7-t0 | a7-t1 | a7-t2 |
| :--: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |

We do not use all of these 24 columns of data, and for each set of data, we only use the data corresponding to the tag.
