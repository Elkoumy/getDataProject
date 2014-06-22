getDataProject
==============

=========================================================================
	            	Code Description
=========================================================================
The code starts with reading the data sets of train then adds the 
activity type using the cbind function and adds the subject to it 
using the cbind.
Then the code do the same with the test data sets.
Then the code appends the train and the test data sets using the
rbind function , and the result will be in the variable total.
After that, the code adds variable names to the data set, it reads
the names from the file features.txt

The code then makes the merge process to get the activity description
from the file activity_labels.
 
The code then selects the variable names that contains the strings Mean
and std, and uses the resulting vector to select from the data set

The code then melts the result and do the casting to perform the required
grouping, the result will be in the variable glData.

In the end, the code writes the result to the file meanofVariables.txt
