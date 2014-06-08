Background
=====

I have used prefiltering using UNIX tools to filter the dataset for 1-Feb-2007 and 2-Feb-2007 data. This uses the native power of UNIX to filter a 133MB dataset into a 183kb csv file in a fraction of a second.

Of course, there are many different ways to perform this operation and each has its own pros/cons. I believe this is a better workflow that I will use in a professional work environment and hence I used this method over doing it in R using data.table or dplyr. Cheers!

Operation steps
=====

<ol>
    <li>Navigate to the prefilter folder.</li>
    <li>Unzip the dataset into the prefilter folder. This generates a file named household_power_consumption.txt</li>
    <li>Run the shell script prefilter.sh using the command **sh ./prefilter.sh** on the Unix command line. Note: make sure you have necessary permissions to execute this script.</li>
    <li>This will place a file named filtereddata.csv into the data folder. This file is then used for operations for this assignment using the R code files in the code folder.</li>
</ol>