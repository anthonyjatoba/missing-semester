# Missing Semester

## Lecture 04 solution

### 1. Take this [short interactive regex tutorial](https://regexone.com/)

### 2. Find:

#### a) the number of words (in /usr/share/dict/words) that contain at least three as and don’t have a 's ending. 

**Answer:**

```
cat /usr/share/dict/words
 | grep ".*a.*a.*a.*"
 | grep -v ".*'s"
 | wc -l
```

#### b) what are the three most common last two letters of those words? sed’s y command, or the tr program, may help you with case insensitivity. 

**Answer:**

```
cat /usr/share/dict/words
 | tr {{A-Z}} {{a-z}}
 | grep ".*a.*a.*a.*"
 | grep -v ".*'s"
 | sed -E 's/.*(..)/\1/'
 | sort
 | uniq -c
 | sort -nk1,1
 | tail -n5
 | awk '{print $2}'
```

#### c) How many of those two-letter combinations are there? And for a challenge: which combinations do not occur?

**Answer:**

```
cat /usr/share/dict/words
 | tr {{A-Z}} {{a-z}}
 | grep ".*a.*a.*a.*"
 | grep -v ".*'s"
 | sed -E 's/.*(..)/\1/'
 | uniq
 | wc -l
 ```

**Chalenge:** -

### 3. To do in-place substitution it is quite tempting to do something like ```sed s/REGEX/SUBSTITUTION/ input.txt > input.txt```. However this is a bad idea, why? Is this particular to sed? Use man sed to find out how to accomplish this.

**Answer:** Bash processes the redirects (```>```) first, so, by the time the ```sed``` command is executed, the file is empty, making the regex substitution not possible.

To solve this issue, one can use the ```-i``` option:

```sed -E -i 's/REGEX/SUBSTITUTION/ input.txt```

This option writes the output to a temporary file, then rename it to the original file name.

### 4. Find your average, median, and max system boot time over the last ten boots

**Answer:** using R to calculate the statistics:

```
journalctl 
 | grep 'systemd\[1\]: Startup finished in'
 | tail -n10
 | sed -E "s/.* \(userspace\) = (.*)s\.$/\1/"
 | R --slave -e 'x <- scan(file="stdin", quiet=TRUE); summary(x)'
```

### 5. Look for boot messages that are not shared between your past three reboots.

**Answer:**

```
{journalctl -b & journalctl -b -1 & journalctl -b -2}
 | sed -E "s/^.*vostro //"
 | uniq -c
 | sort -nk1,1
 | grep "\s[1-2] .*\]:.*.$"
```