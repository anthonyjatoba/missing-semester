# Missing Semester

## Lecture 02 solution

### 1. Take this (short interactive regex tutorial)[https://regexone.com/]



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