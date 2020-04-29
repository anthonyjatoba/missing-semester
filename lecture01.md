1. Create a new directory called missing under /tmp.

**Answer:** 

``` mkdir /tmp/missing ```

2. Look up the touch program. The man program is your friend.

**Answer:** 

``` man touch ```

3. Use ```touch``` to create a new file called semester in missing.

**Answer:** 

``` touch /tmp/missing/semester ```

4. Write the following into that file, one line at a time: 

```
#!/bin/sh
curl --head --silent https://missing.csail.mit.edu
```

**Answer:** 

``` echo '#!/bin/bash' > semester ```

```echo "curl --head --silent https://missing.csail.mit.edu" >> semester ```

5. Try to execute the file, i.e. type the path to the script (./semester) into your shell and press enter. Understand why it doesn’t work by consulting the output of ls (hint: look at the permission bits of the file).

**Answer:** 

```./semester```

```ls -l```

The permission string is ```-rw-r--r--```, so my user is not allowed to execute this file.

6. Run the command by explicitly starting the sh interpreter, and giving it the file semester as the first argument, i.e. sh semester. Why does this work, while ./semester didn’t?

**Answer:** calling ```sh semester```, the file ```semester``` is passed as an argument to the ```sh``` program, which will interpret this file. Even though we don't have permition to run ```semester```, we do are allowed to run ```sh```.

7. Look up the chmod program (e.g. use man chmod).

**Answer:** 

```man chmod```

8. Use chmod to make it possible to run the command ./semester rather than having to type sh semester. How does your shell know that the file is supposed to be interpreted using sh? See this page on the shebang line for more information.

**Aswer:** to give all permitions to the creator user, but only read permission to the group and other users, we use the command:

```chmod 744 semester```

As the first line in the file is ```#!/bin/sh ```, the program loader is instructed to run the file with ```/bin/sh```.

9. Use | and > to write the “last modified” date output by semester into a file called last-modified.txt in your home directory.

**Answer:** it can be done by using the pipe operator to cut the output by the ```ls``` command.

```ls -l semester | cut -c33-45 > ~/last-modified.txt```

10. Write a command that reads out your laptop battery’s power level or your desktop machine’s CPU temperature from /sys. Note: if you’re a macOS user, your OS doesn’t have sysfs, so you can skip this exercise.

**Answer:**

```cat /sys/class/power_supply/BAT0/capacity```