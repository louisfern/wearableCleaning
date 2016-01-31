# UCI HAR Codebook
### Louis Fernandes

This codebook acts as a guide to the analysis performed on the UC Irvine "Human Activity Recognition Using Smartphones Data Set" in accordance with the requirements set out for Coursera "Getting and Cleaning Data" project two. It is taken in part from the files "features_info.txt" and "README.txt" that accompany the HAR data set. All operations were performed using R version 3.2.3. 

## Data acquisition
Data were downloaded from the Coursera website at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), but were originally taken from the UCI database at [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The archived data were unzipped into their native directory structure.

Names for categories of features were extracted from "features.txt". Names for activites were extracted from "activity_labels.txt". The "train" ("test") data set was loaded in from "/train/X_train.txt" ("/test/X_train.txt"), and the features loaded in previously were used as column names. Activity labels for the training set were loaded in from "/train/y_train.txt" ("/test/y_test.txt"). Subject identifiers were loaded in from "/train/subject_train.txt" ("/test/subject_test.txt"). The training data set, the activity labels, and the subject identifiers were all combined into a single data set for tidying.

## Data manipulation and tidying

We then reduced the size of our data set by selecting all columns that contained the phrases "mean" or "std", but not those that contained "meanFreq". We also included the "Subject" and "Training.label" columns. 

We then translated the "Training.label" column into one of the six activity categories using the "activity" table created when we loaded in "activity_labels.txt". 

Finally, we grouped the data set by subject and activity and took the mean of all measurements. As a final step, we gathered the data into a tidy data set.

## Tidy data set key

The format of the tidy data set is as follows:

[13,140 x 4]
Groups: Subject [30]
Columns:
Subject (int): The subject number. 
Activity (factor): One of the following activities: `LAYING`, `SITTING`, `STANDING`, `WALKING`, `WALKING_DOWNSTAIRS`, `WALKING_UPSTAIRS`. 
Measurement (character): The name of the measurement. The list of all original measurements and their descriptions can be found in "features_info.txt". Due to string formatting issues, the "()" and "()-" characters were dropped from the original list of features and were replaced with ".." and "..." respectively.. The following is the list of features carried over into our tidy dataset:
1. "tBodyAcc.mean...X"                   
2. "tBodyAcc.mean...Y"                   
3. "tBodyAcc.mean...Z"                   
4. "tGravityAcc.mean...X"                
5. "tGravityAcc.mean...Y"                
6. "tGravityAcc.mean...Z"                
7. "tBodyAccJerk.mean...X"               
8. "tBodyAccJerk.mean...Y"               
9. "tBodyAccJerk.mean...Z"               
10. "tBodyGyro.mean...X"                  
11. "tBodyGyro.mean...Y"                  
12. "tBodyGyro.mean...Z"                  
13. "tBodyGyroJerk.mean...X"              
14. "tBodyGyroJerk.mean...Y"              
15. "tBodyGyroJerk.mean...Z"              
16. "tBodyAccMag.mean.."                  
17. "tGravityAccMag.mean.."               
18. "tBodyAccJerkMag.mean.."              
19. "tBodyGyroMag.mean.."                 
20. "tBodyGyroJerkMag.mean.."             
21. "fBodyAcc.mean...X"                   
22. "fBodyAcc.mean...Y"                   
23. "fBodyAcc.mean...Z"                   
24. "fBodyAccJerk.mean...X"               
25. "fBodyAccJerk.mean...Y"               
26. "fBodyAccJerk.mean...Z"               
27. "fBodyGyro.mean...X"                  
28. "fBodyGyro.mean...Y"                  
29. "fBodyGyro.mean...Z"                  
30. "fBodyAccMag.mean.."                  
31. "fBodyBodyAccJerkMag.mean.."          
32. "fBodyBodyGyroMag.mean.."             
33. "fBodyBodyGyroJerkMag.mean.."         
34. "angle.tBodyAccMean.gravity."         
35. "angle.tBodyAccJerkMean..gravityMean."
36. "angle.tBodyGyroMean.gravityMean."    
37. "angle.tBodyGyroJerkMean.gravityMean."
38. "angle.X.gravityMean."                
39. "angle.Y.gravityMean."                
40. "angle.Z.gravityMean."                
41. "tBodyAcc.std...X"                    
42. "tBodyAcc.std...Y"                    
43. "tBodyAcc.std...Z"                    
44. "tGravityAcc.std...X"                 
45. "tGravityAcc.std...Y"                 
46. "tGravityAcc.std...Z"                 
47. "tBodyAccJerk.std...X"                
48. "tBodyAccJerk.std...Y"                
49. "tBodyAccJerk.std...Z"                
50. "tBodyGyro.std...X"                   
51. "tBodyGyro.std...Y"                   
52. "tBodyGyro.std...Z"                   
53. "tBodyGyroJerk.std...X"               
54. "tBodyGyroJerk.std...Y"               
55. "tBodyGyroJerk.std...Z"               
56. "tBodyAccMag.std.."                   
57. "tGravityAccMag.std.."                
58. "tBodyAccJerkMag.std.."               
59. "tBodyGyroMag.std.."                  
60. "tBodyGyroJerkMag.std.."              
61. "fBodyAcc.std...X"                    
62. "fBodyAcc.std...Y"                    
63. "fBodyAcc.std...Z"                    
64. "fBodyAccJerk.std...X"                
65. "fBodyAccJerk.std...Y"                
66. "fBodyAccJerk.std...Z"                
67. "fBodyGyro.std...X"                   
68. "fBodyGyro.std...Y"                   
69. "fBodyGyro.std...Z"                   
70. "fBodyAccMag.std.."                   
71. "fBodyBodyAccJerkMag.std.."           
72. "fBodyBodyGyroMag.std.."              
73. "fBodyBodyGyroJerkMag.std.." 
Mean (double): The mean of all recordings for a particular subject, activity, and measurement. All measurements were normalized and bounded by [-1, 1]. For units of these measurements, see "features_info.txt".

## Packages and versions

`Sys.info()`
sysname - "Windows"
release - "7 x64"
version - "build 7601, Service Pack 1"
machine - "x86-64"login 

`version`
platform       x86_64-w64-mingw32          
arch           x86_64                      
os             mingw32                     
system         x86_64, mingw32             
status                                     
major          3                           
minor          2.3                         
year           2015                        
month          12                          
day            10                          
svn rev        69752                       
language       R                           
version.string R version 3.2.3 (2015-12-10)
nickname       Wooden Christmas-Tree 

`packageVersion("dplyr")`
'0.4.3'

`packageVersion("tidyr")`
'0.4.0'