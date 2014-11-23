# Read me file for run_analysis.R script being executed on UCI Har Dataset

The script run_analysis.R is to be located within a working directory containing 
the the UCI Har Datset. In order for the code to be executed within  R, the data.table
package is required to be installed on a user's computer.

The UCI Har Dataset contains information gathered by the gyroscope within a Samsung
S2 smartphone. The data that is analyzed with the the run_analysis.R script pertains 
to data that is collected involving the mean and standard deviation for variables measured
by the gyroscope.

The data is gathered by thirty subjects which are separated into two distinct groups, Test
and Train. The variable names for the Test and Train data are located within the features.txt
file. The cipher for the activities being executed is located in the activity_labels.txt file
The subject data is located within the subject_train.txt and subject_test.txt files.  The 
activity that the user is performing Y_test.txt and Y_train.txt files. The variable measurements 
are located within the X_test.txt and X_train.txt files.

## Contents of run_analysis.R

The script located within run_analysis.R performs the following tasks:

1. Reads all of the pertinent data located in the files subject_test.txt, subject_train.txt
Y_test.txt, Y_train.txt, X_test.txt, X_train.txt activity_lables.txt and features.txt. 

2. Binds the variable data from X_Train.txt and X_test.txt together to form a single dataframe.

3. Assigns variable names to the bound dataframe from the data found in features.txt

4. Creates two new data frames, extracting only variables pertaining to the mean and standard
deviation of the data respectively.

5. Binds the activity values from Y_train.txt and Y_test.txt into a single dataframe.

6. Replaces the numerical activity values with their character values as provided by the 
activity_labels.txt file

7. Binds the activity labels to the mean and standard deviation data frames.

8. Binds the mean and standard deviation data frames into a single, non tidy data frame.

9. Converts the non-tidy data frame into data table.

10. Computes the mean of each variable across all subjects and activities.

11. Returns a wide format tidy data document. 
