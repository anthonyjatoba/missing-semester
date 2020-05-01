# Missing Semester

## Lecture 02 solution

### 1. Read man ls and write an ls command that lists files in the following manner

* Includes all files, including hidden files
* Sizes are listed in human readable format (e.g. 454M instead of 454279954)
* Files are ordered by recency
* Output is colorized

**Answer:**

```ls -a -s -h -t --color```

Where ```-a``` shows hidden files; ```-s``` shows the sizes of the files; ```-h``` prints sizes in a human readable format; ```-t``` sorts by time (most recent first); and ```--color``` prints in a colorized fashion.

### 2. Write bash functions marco and polo that do the following. Whenever you execute marco the current working directory should be saved in some manner, then when you execute polo, no matter what directory you are in, polo should cd you back to the directory where you executed marco. For ease of debugging you can write the code in a file marco.sh and (re)load the definitions to your shell by executing source marco.sh.

**Answer:** see [marco.sh](marco-polo.sh).

### 3. Say you have a command that fails rarely. In order to debug it you need to capture its output but it can be time consuming to get a failure run. Write a bash script that runs the following script until it fails and captures its standard output and error streams to files and prints everything at the end. Bonus points if you can also report how many runs it took for the script to fail.

**Answer:** see [debug.sh](debug.sh)    

### 4. [...] Your task is to write a command that recursively finds all HTML files in the folder and makes a zip with them. Note that your command should work even if the files have spaces

**Answer:** creating some files

```touch file-{a..j}.html image-{1..10}.jpg 'file\ with\ spaces\ {k..z}.html'```

To create our zip with only the html files, we can use the command:

```find . -name '*.html' | xargs -d '\n' tar czf teste.tar```

### 5. (Advanced) Write a command or script to recursively find the most recently modified file in a directory. More generally, can you list all files by recency?

**Answer:**:

To get the most recent file:

```find . -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -d' ' -f2```

To list all files by recency:

 ```find . -type f -printf '%T@ %p\n' | sort -n | cut -d' ' -f2```
