#!/usr/bin/env bash

# code from the lesson 3

std_path=/tmp/std.out
error_path=/tmp/error.out

# empties files
> $std_path
> $error_path

count=0

while [ true ]; do
    count=$(( count+1 ))
    ./fail_script.sh >> $std_path 2>> $error_path || break    
done

echo $(cat $std_path)
echo $(cat $error_path)

echo "it took $count trials to get an error"