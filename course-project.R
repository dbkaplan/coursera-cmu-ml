library(caret)

# Set a consistent seed
set.seed(123)

#import testing and training datasets
training <- read.csv("pml-training.csv")
testing <- read.csv("pml-testing.csv")

#create a smaller data set -- to save time -- that uses overy other record
training_a <- training[1:nrow(training) %% 2 == 0,]

#set up control to use 10 k-fold cross validation
train_control <- trainControl(method="cv", number=10)

#train a model using all predictors that do not have sparse data.
#The model will be built using random forest
modFit <- train(classe ~ roll_belt + pitch_belt + yaw_belt + total_accel_belt +
                 gyros_belt_x + gyros_belt_y + gyros_belt_z + accel_belt_x +
                 accel_belt_y + accel_belt_z + magnet_belt_x + magnet_belt_y +
                 magnet_belt_z + roll_arm + pitch_arm + yaw_arm + total_accel_arm +
                 gyros_arm_x + gyros_arm_y + gyros_arm_z + accel_arm_x + accel_arm_y +
                 accel_arm_z + magnet_arm_x + magnet_arm_y + magnet_arm_z + roll_dumbbell +
                 pitch_dumbbell + yaw_dumbbell + total_accel_dumbbell + gyros_dumbbell_x +
                 gyros_dumbbell_y + gyros_dumbbell_z + accel_dumbbell_x + accel_dumbbell_y +
                 accel_dumbbell_z + magnet_dumbbell_x + magnet_dumbbell_y + magnet_dumbbell_z +
                 roll_forearm + pitch_forearm + yaw_forearm + total_accel_forearm +
                 gyros_forearm_x + gyros_forearm_y + gyros_forearm_z + accel_forearm_x +
                 accel_forearm_y + accel_forearm_z + magnet_forearm_x + magnet_forearm_y +
                 magnet_forearm_z, method="rf", trControl=train_control, data=training_a, prox=TRUE)

#display model stats
print(modFit)
#Display confusion matrix using absolute values
print(modFit$finalModel)
#display confusion matrix using percentages
confusionMatrix(modFit)
#Plot the most important variables
varImpPlot(modFit$finalModel)

#print the most important variables ordered descending
imp <- varImp(modFit$finalModel)
print(imp[with(imp,order(-Overall)),,drop=FALSE])

#Predict the testing set
testPred <- predict(modFit, testing)
