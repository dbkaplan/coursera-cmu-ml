# Coursera CMU Course project
### David Kaplan

[Link to code](https://github.com/dbkaplan/coursera-cmu-ml/blob/master/course-project.R)

I started by reducing the predictors to the 52 columns that consistently had data, in order to make processing easier. Since there were still many predictors, I used a random forest so that the best predictors would be automatically selected and weighted. I also used 10 k-fold cross validation in order to refine the model and balance bias and variance.

When I started training, I used only a tenth of the available training data so that I could get a quick result and see whether I was on the right track. The initial accuracy of the model was 72%. Using the varImp function, I could see that the model was starting to find which predictors were better than others – the top being roll_belt, pitch_forearm, and yaw_belt.

After this initial result, I started to ramp up the number of rows used in training the model. The processing took much longer, but the accuracy improved as the number of records increased. In the end, I used ½ of the records from the training set and achieved **98.4%** accuracy with an out of sample error rate of **1.37%**.

In the end, I was able to successfully predict every test case.

I ran some final analyses in order to understand the model and indicators better:
The confusion matrix and individual class errors were:

 | A | B | C | D | E | class.error
---- | ---- | ---- | ---- | ---- | ---- | ----
A | 2783 | 6 | 1 | 0 | 0 | 0.002508961
B | 28 | 1857 | 13 | 0 | 0 | 0.021601686
C | 0 | 16 | 1683 | 12 | 0 | 0.016364699
D | 0 | 1 | 37 | 1567 | 3 | 0.025497512
E | 0 | 2 | 5 | 10 | 1787 | 0.009423503

The final mtry used for the random forest model was **27**.

I plotted the importance of the variables using varImpPlot:
![varImpPlot](https://github.com/dbkaplan/coursera-cmu-ml/blob/master/varImpPlot.png)

The importance of the variables came out to:

 | Overall
---- | ----
roll_belt            | 982.54568
pitch_forearm        | 607.53360
yaw_belt             | 552.42868
magnet_dumbbell_z    | 452.40125
pitch_belt           | 449.26560
magnet_dumbbell_y    | 447.21715
roll_forearm         | 430.85575
accel_dumbbell_y     | 242.40105
roll_dumbbell        | 191.60734
accel_forearm_x      | 188.51500
magnet_dumbbell_x    | 185.09237
magnet_belt_z        | 167.42823
accel_belt_z         | 160.85625
accel_dumbbell_z     | 154.48718
total_accel_dumbbell | 151.13397
magnet_forearm_z     | 146.29472
gyros_belt_z         | 134.09474
magnet_belt_y        | 132.97087
magnet_belt_x        | 123.79702
yaw_arm              | 120.22183
yaw_dumbbell         | 101.80799
roll_arm             | 100.62171
gyros_dumbbell_y     |  91.66530
accel_forearm_z      |  89.94988
magnet_forearm_y     |  81.64203
accel_arm_x          |  80.17869
magnet_arm_x         |  78.03526
magnet_arm_y         |  77.53759
yaw_forearm          |  73.21036
accel_dumbbell_x     |  71.17321
magnet_forearm_x     |  70.83774
magnet_arm_z         |  62.30550
pitch_arm            |  60.62469
pitch_dumbbell       |  56.24472
gyros_arm_y          |  53.86440
accel_forearm_y      |  50.78427
gyros_dumbbell_x     |  48.61862
accel_arm_y          |  48.04924
gyros_forearm_y      |  43.49565
gyros_arm_x          |  41.98822
accel_arm_z          |  39.52009
total_accel_belt     |  36.51063
total_accel_arm      |  35.12608
gyros_belt_y         |  33.27014
total_accel_forearm  |  30.03630
gyros_belt_x         |  29.35288
accel_belt_y         |  28.99525
gyros_forearm_z      |  27.66013
gyros_dumbbell_z     |  26.87439
accel_belt_x         |  25.95362
gyros_forearm_x      |  20.69154
gyros_arm_z          |  18.50295
