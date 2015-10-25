---
title: "CodeBook"
output: html_document
date: "Sunday, October 25, 2015"
---

## Project Description
Human Activity Recognition Data was collected from Samsung Galaxy S smartphones. Participants performed a range of activities while wearing the phone.

##Study design and data processing

###Collection of the raw data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

##Creating the tidy datafile

###Guide to create the tidy data file
The 'run_analysis.R' program will run through all of the necessary steps to produce a clearly labelled tidy data set. Executing the program will run through the following steps:  

1. Download the raw data  
2. Combine the training data sets and test data sets  
3. Select only the mean and standard deviation measurements  
4. Aggregate all of the data to one master data set  
5. Label the activities  
6. Summarise the data to show mean average of measurements by subject and activity  
7. Assign readable column names to the data set  
8. Output the final data set as 'UCI HAR Data.txt'

##Variables in 'UCI HAR Data.txt'
 'data.frame':    180 obs. of  69 variables:  

  *  Subject                                  : int  1 1 1 1 1 1 2 2 2 2   
  *  Set                                      : Factor w/ 2 levels "Test","Train": 2 2 2 2 2 2 1 1 1 1   
  *  Activity_Lbl                             : Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4   
  *  Time_Body_Acc_Std.dv_X                   : num  -0.928 -0.977 -0.996 -0.284 0.03   
  *  Time_Body_Acc_Std.dv_Y                   : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319   
  *  Time_Body_Acc_Std.dv_Z                   : num  -0.826 -0.94 -0.98 -0.26 -0.23   
  *  Time_Gravity_Acc_Std.dv_X                : num  -0.897 -0.968 -0.994 -0.977 -0.951   
  *  Time_Gravity_Acc_Std.dv_Y                : num  -0.908 -0.936 -0.981 -0.971 -0.937   
  *  Time_Gravity_Acc_Std.dv_Z                : num  -0.852 -0.949 -0.976 -0.948 -0.896   
  *  Time_Body_Acc_Jerk_Std.dv_X              : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123   
  *  Time_Body_Acc_Jerk_Std.dv_Y              : num  -0.924 -0.981 -0.986 0.067 -0.102   
  *  Time_Body_Acc_Jerk_Std.dv_Z              : num  -0.955 -0.988 -0.992 -0.503 -0.346   
  *  Time_Body_Gyro_Std.dv_X                  : num  -0.874 -0.977 -0.987 -0.474 -0.458   
  *  Time_Body_Gyro_Std.dv_Y                  : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263   
  *  Time_Body_Gyro_Std.dv_Z                  : num  -0.908 -0.941 -0.981 -0.344 -0.125   
  *  Time_Body_Gyro_Jerk_Std.dv_X             : num  -0.919 -0.992 -0.993 -0.207 -0.487   
  *  Time_Body_Gyro_Jerk_Std.dv_Y             : num  -0.968 -0.99 -0.995 -0.304 -0.239   
  *  Time_Body_Gyro_Jerk_Std.dv_Z             : num  -0.958 -0.988 -0.992 -0.404 -0.269   
  *  Time_Body_Acc_Magnitude_Std.dv           : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199   
  *  Time_Gravity_Acc_Magnitude_Std.dv        : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199   
  *  Time_Body_Acc_Jerk_Magnitude_Std.dv      : num  -0.9282 -0.9841 -0.9931 -0.0745 -0.0258   
  *  Time_Body_Gyro_Magnitude_Std.dv          : num  -0.819 -0.935 -0.979 -0.187 -0.226   
  *  Time_Body_Gyro_Jerk_Magnitude_Std.dv     : num  -0.936 -0.988 -0.995 -0.325 -0.307   
  *  Freq_Body_Acc_Std.dv_X                   : num  -0.9244 -0.9764 -0.996 -0.3191 0.0243   
  *  Freq_Body_Acc_Std.dv_Y                   : num  -0.834 -0.917 -0.972 0.056 -0.113   
  *  Freq_Body_Acc_Std.dv_Z                   : num  -0.813 -0.934 -0.978 -0.28 -0.298   
  *  Freq_Body_Acc_Jerk_Std.dv_X              : num  -0.9642 -0.9875 -0.9951 -0.1336 -0.0863   
  *  Freq_Body_Acc_Jerk_Std.dv_Y              : num  -0.932 -0.983 -0.987 0.107 -0.135   
  *  Freq_Body_Acc_Jerk_Std.dv_Z              : num  -0.961 -0.988 -0.992 -0.535 -0.402   
  *  Freq_Body_Gyro_Std.dv_X                  : num  -0.882 -0.978 -0.987 -0.517 -0.495   
  *  Freq_Body_Gyro_Std.dv_Y                  : num  -0.9512 -0.9623 -0.9871 -0.0335 -0.1814   
  *  Freq_Body_Gyro_Std.dv_Z                  : num  -0.917 -0.944 -0.982 -0.437 -0.238   
  *  Freq_Body_Acc_Magnitude_Std.dv           : num  -0.798 -0.928 -0.982 -0.398 -0.187   
  *  Freq_Body_Body_Acc_Jerk_Magnitude_Std.dv : num  -0.922 -0.982 -0.993 -0.103 -0.104   
  *  Freq_Body_Body_Gyro_Magnitude_Std.dv     : num  -0.824 -0.932 -0.978 -0.321 -0.398   
  *  Freq_Body_Body_Gyro_Jerk_Magnitude_Std.dv: num  -0.933 -0.987 -0.995 -0.382 -0.392   
  *  Time_Body_Acc_Mean_X                     : num  0.222 0.261 0.279 0.277 0.289   
  *  Time_Body_Acc_Mean_Y                     : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992   
  *  Time_Body_Acc_Mean_Z                     : num  -0.113 -0.105 -0.111 -0.111 -0.108   
  *  Time_Gravity_Acc_Mean_X                  : num  -0.249 0.832 0.943 0.935 0.932   
  *  Time_Gravity_Acc_Mean_Y                  : num  0.706 0.204 -0.273 -0.282 -0.267   
  *  Time_Gravity_Acc_Mean_Z                  : num  0.4458 0.332 0.0135 -0.0681 -0.0621   
  *  Time_Body_Acc_Jerk_Mean_X                : num  0.0811 0.0775 0.0754 0.074 0.0542   
  *  Time_Body_Acc_Jerk_Mean_Y                : num  0.003838 -0.000619 0.007976 0.028272 0.02965   
  *  Time_Body_Acc_Jerk_Mean_Z                : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097   
  *  Time_Body_Gyro_Mean_X                    : num  -0.0166 -0.0454 -0.024 -0.0418 -0.0351   
  *  Time_Body_Gyro_Mean_Y                    : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909   
  *  Time_Body_Gyro_Mean_Z                    : num  0.1487 0.0629 0.0748 0.0849 0.0901   
  *  Time_Body_Gyro_Jerk_Mean_X               : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074   
  *  Time_Body_Gyro_Jerk_Mean_Y               : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044   
  *  Time_Body_Gyro_Jerk_Mean_Z               : num  -0.0741 -0.0467 -0.049 -0.0461 -0.027   
  *  Time_Body_Acc_Magnitude_Mean             : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272   
  *  Time_Gravity_Acc_Magnitude_Mean          : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272   
  *  Time_Body_Acc_Jerk_Magnitude_Mean        : num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894   
  *  Time_Body_Gyro_Magnitude_Mean            : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757   
  *  Time_Body_Gyro_Jerk_Magnitude_Mean       : num  -0.963 -0.992 -0.995 -0.299 -0.295   
  *  Freq_Body_Acc_Mean_X                     : num  -0.9391 -0.9796 -0.9952 -0.2028 0.0382   
  *  Freq_Body_Acc_Mean_Y                     : num  -0.86707 -0.94408 -0.97707 0.08971 0.00155   
  *  Freq_Body_Acc_Mean_Z                     : num  -0.883 -0.959 -0.985 -0.332 -0.226   
  *  Freq_Body_Acc_Jerk_Mean_X                : num  -0.9571 -0.9866 -0.9946 -0.1705 -0.0277   
  *  Freq_Body_Acc_Jerk_Mean_Y                : num  -0.9225 -0.9816 -0.9854 -0.0352 -0.1287   
  *  Freq_Body_Acc_Jerk_Mean_Z                : num  -0.948 -0.986 -0.991 -0.469 -0.288   
  *  Freq_Body_Gyro_Mean_X                    : num  -0.85 -0.976 -0.986 -0.339 -0.352   
  *  Freq_Body_Gyro_Mean_Y                    : num  -0.9522 -0.9758 -0.989 -0.1031 -0.0557   
  *  Freq_Body_Gyro_Mean_Z                    : num  -0.9093 -0.9513 -0.9808 -0.2559 -0.0319   
  *  Freq_Body_Acc_Magnitude_Mean             : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966   
  *  Freq_Body_Body_Acc_Jerk_Magnitude_Mean   : num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262   
  *  Freq_Body_Body_Gyro_Magnitude_Mean       : num  -0.862 -0.958 -0.985 -0.199 -0.186   
  *  Freq_Body_Body_Gyro_Jerk_Magnitude_Mean  : num  -0.942 -0.99 -0.995 -0.319 -0.282   

###Notes
For each record it is provided:  

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 66-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment. 

***