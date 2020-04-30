# Lecture 02 solution

1. Read man ls and write an ls command that lists files in the following manner

* Includes all files, including hidden files
* Sizes are listed in human readable format (e.g. 454M instead of 454279954)
* Files are ordered by recency
* Output is colorized

**Answer:* *

```ls -a -s -h -t --color```

Where -a shows hidden files; -s shows the sizes of the files; -h prints sizes in a human readable format; -t sorts by time (most recent first); and --color prints in a colorized fashion.

2. Write bash functions marco and polo that do the following. Whenever you execute marco the current working directory should be saved in some manner, then when you execute polo, no matter what directory you are in, polo should cd you back to the directory where you executed marco. For ease of debugging you can write the code in a file marco.sh and (re)load the definitions to your shell by executing source marco.sh.

**Answer:** see [marco.sh](marco-polo.sh).