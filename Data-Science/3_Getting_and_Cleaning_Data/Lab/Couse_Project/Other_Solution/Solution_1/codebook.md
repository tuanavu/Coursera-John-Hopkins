```{r tidy=FALSE}
Coursera CodeBook for "getting and cleaning data"

1: subject length:40 class:integer min:1 max:30
2: activityDescription class:factor length: 40
	levels:
		LAYING
		SITTING
		STANDING
		WALKING
		WALKING_DOWNSTAIRS
		WALKING UPSTAIRS
3: time-BodyAcceleration-mean-Xaxis length: 40 class: numeric min: 0.266 max: 0.28
4: time-BodyAcceleration-mean-Yaxis length: 40 class: numeric min: -0.021 max: -0.013
5: time-BodyAcceleration-mean-Zaxis length: 40 class: numeric min: -0.118 max: -0.1
6: time-BodyAcceleration-standardDeviation-Xaxis length: 40 class: numeric min: -0.992 max: -0.127
7: time-BodyAcceleration-standardDeviation-Yaxis length: 40 class: numeric min: -0.972 max: 0.121
8: time-BodyAcceleration-standardDeviation-Zaxis length: 40 class: numeric min: -0.976 max: -0.083
9: time-GravityAcceleration-mean-Xaxis length: 40 class: numeric min: 0.475 max: 0.963
10: time-GravityAcceleration-mean-Yaxis length: 40 class: numeric min: -0.18 max: 0.281
11: time-GravityAcceleration-mean-Zaxis length: 40 class: numeric min: -0.285 max: 0.239
12: time-GravityAcceleration-standardDeviation-Xaxis length: 40 class: numeric min: -0.996 max: -0.934
13: time-GravityAcceleration-standardDeviation-Yaxis length: 40 class: numeric min: -0.982 max: -0.901
14: time-GravityAcceleration-standardDeviation-Zaxis length: 40 class: numeric min: -0.974 max: -0.881
15: time-BodyAccelerationJerk-mean-Xaxis length: 40 class: numeric min: 0.057 max: 0.087
16: time-BodyAccelerationJerk-mean-Yaxis length: 40 class: numeric min: -0.003 max: 0.02
17: time-BodyAccelerationJerk-mean-Zaxis length: 40 class: numeric min: -0.02 max: 0.016
18: time-BodyAccelerationJerk-standardDeviation-Xaxis length: 40 class: numeric min: -0.994 max: -0.172
19: time-BodyAccelerationJerk-standardDeviation-Yaxis length: 40 class: numeric min: -0.987 max: 0.004
20: time-BodyAccelerationJerk-standardDeviation-Zaxis length: 40 class: numeric min: -0.991 max: -0.387
21: time-BodyGyro-mean-Xaxis length: 40 class: numeric min: -0.07 max: 0.008
22: time-BodyGyro-mean-Yaxis length: 40 class: numeric min: -0.101 max: -0.042
23: time-BodyGyro-mean-Zaxis length: 40 class: numeric min: 0.048 max: 0.116
24: time-BodyGyro-standardDeviation-Xaxis length: 40 class: numeric min: -0.988 max: -0.353
25: time-BodyGyro-standardDeviation-Yaxis length: 40 class: numeric min: -0.986 max: -0.217
26: time-BodyGyro-standardDeviation-Zaxis length: 40 class: numeric min: -0.986 max: -0.169
27: time-BodyGyroJerk-mean-Xaxis length: 40 class: numeric min: -0.114 max: -0.059
28: time-BodyGyroJerk-mean-Yaxis length: 40 class: numeric min: -0.05 max: -0.037
29: time-BodyGyroJerk-mean-Zaxis length: 40 class: numeric min: -0.064 max: -0.042
30: time-BodyGyroJerk-standardDeviation-Xaxis length: 40 class: numeric min: -0.993 max: -0.034
31: time-BodyGyroJerk-standardDeviation-Yaxis length: 40 class: numeric min: -0.993 max: -0.3
32: time-BodyGyroJerk-standardDeviation-Zaxis length: 40 class: numeric min: -0.994 max: -0.051
33: time-BodyAccelerationMagnitude-mean length: 40 class: numeric min: -0.98 max: -0.055
34: time-BodyAccelerationMagnitude-standardDeviation length: 40 class: numeric min: -0.975 max: -0.105
35: time-GravityAccelerationMagnitude-mean length: 40 class: numeric min: -0.98 max: -0.055
36: time-GravityAccelerationMagnitude-standardDeviation length: 40 class: numeric min: -0.975 max: -0.105
37: time-BodyAccelerationJerkMagnitude-mean length: 40 class: numeric min: -0.992 max: -0.154
38: time-BodyAccelerationJerkMagnitude-standardDeviation length: 40 class: numeric min: -0.991 max: -0.088
39: time-BodyGyroMagnitude-mean length: 40 class: numeric min: -0.979 max: -0.176
40: time-BodyGyroMagnitude-standardDeviation length: 40 class: numeric min: -0.98 max: -0.201
41: time-BodyGyroJerkMagnitude-mean length: 40 class: numeric min: -0.995 max: -0.203
42: time-BodyGyroJerkMagnitude-standardDeviation length: 40 class: numeric min: -0.994 max: -0.237
43: force-BodyAcceleration-mean-Xaxis length: 40 class: numeric min: -0.992 max: -0.134
44: force-BodyAcceleration-mean-Yaxis length: 40 class: numeric min: -0.975 max: 0.102
45: force-BodyAcceleration-mean-Zaxis length: 40 class: numeric min: -0.983 max: -0.273
46: force-BodyAcceleration-standardDeviation-Xaxis length: 40 class: numeric min: -0.992 max: -0.127
47: force-BodyAcceleration-standardDeviation-Yaxis length: 40 class: numeric min: -0.972 max: 0.059
48: force-BodyAcceleration-standardDeviation-Zaxis length: 40 class: numeric min: -0.974 max: -0.06
49: force-BodyAcceleration-meanFrequency-Xaxis length: 40 class: numeric min: -0.349 max: 0.008
50: force-BodyAcceleration-meanFrequency-Yaxis length: 40 class: numeric min: -0.165 max: 0.136
51: force-BodyAcceleration-meanFrequency-Zaxis length: 40 class: numeric min: -0.141 max: 0.284
52: force-BodyAccelerationJerk-mean-Xaxis length: 40 class: numeric min: -0.994 max: -0.209
53: force-BodyAccelerationJerk-mean-Yaxis length: 40 class: numeric min: -0.987 max: -0.087
54: force-BodyAccelerationJerk-mean-Zaxis length: 40 class: numeric min: -0.989 max: -0.353
55: force-BodyAccelerationJerk-standardDeviation-Xaxis length: 40 class: numeric min: -0.994 max: -0.207
56: force-BodyAccelerationJerk-standardDeviation-Yaxis length: 40 class: numeric min: -0.989 max: 0.035
57: force-BodyAccelerationJerk-standardDeviation-Zaxis length: 40 class: numeric min: -0.991 max: -0.42
58: force-BodyAccelerationJerk-meanFrequency-Xaxis length: 40 class: numeric min: -0.271 max: 0.258
59: force-BodyAccelerationJerk-meanFrequency-Yaxis length: 40 class: numeric min: -0.4 max: 0.088
60: force-BodyAccelerationJerk-meanFrequency-Zaxis length: 40 class: numeric min: -0.305 max: 0.136
61: force-BodyGyro-mean-Xaxis length: 40 class: numeric min: -0.986 max: -0.079
62: force-BodyGyro-mean-Yaxis length: 40 class: numeric min: -0.987 max: -0.249
63: force-BodyGyro-mean-Zaxis length: 40 class: numeric min: -0.986 max: -0.082
64: force-BodyGyro-standardDeviation-Xaxis length: 40 class: numeric min: -0.988 max: -0.445
65: force-BodyGyro-standardDeviation-Yaxis length: 40 class: numeric min: -0.985 max: -0.151
66: force-BodyGyro-standardDeviation-Zaxis length: 40 class: numeric min: -0.987 max: -0.226
67: force-BodyGyro-meanFrequency-Xaxis length: 40 class: numeric min: -0.307 max: 0.123
68: force-BodyGyro-meanFrequency-Yaxis length: 40 class: numeric min: -0.403 max: 0.085
69: force-BodyGyro-meanFrequency-Zaxis length: 40 class: numeric min: -0.266 max: 0.266
70: force-BodyAccelerationMagnitude-mean length: 40 class: numeric min: -0.981 max: -0.056
71: force-BodyAccelerationMagnitude-standardDeviation length: 40 class: numeric min: -0.975 max: -0.274
72: force-BodyAccelerationMagnitude-meanFrequency length: 40 class: numeric min: -0.068 max: 0.258
73: force-BodyAccelerationJerkMagnitude-mean length: 40 class: numeric min: -0.991 max: -0.076
74: force-BodyAccelerationJerkMagnitude-standardDeviation length: 40 class: numeric min: -0.991 max: -0.11
75: force-BodyAccelerationJerkMagnitude-meanFrequency length: 40 class: numeric min: -0.024 max: 0.403
76: force-BodyGyroMagnitude-mean length: 40 class: numeric min: -0.986 max: -0.156
77: force-BodyGyroMagnitude-standardDeviation length: 40 class: numeric min: -0.98 max: -0.377
78: force-BodyGyroMagnitude-meanFrequency length: 40 class: numeric min: -0.315 max: 0.286
79: force-BodyGyroJerkMagnitude-mean length: 40 class: numeric min: -0.994 max: -0.253
80: force-BodyGyroJerkMagnitude-standardDeviation length: 40 class: numeric min: -0.994 max: -0.271
81: force-BodyGyroJerkMagnitude-meanFrequency length: 40 class: numeric min: -0.008 max: 0.332
```
