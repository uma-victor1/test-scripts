#!/bin/bash

if [ -z "$1" ]; then
echo "pass the problematic script as argument"
exit 1
fi

n=0


while true
do
stderr_file=$(mktemp)
stdout_output=$(eval "$1" 2> "$stderr_file")
if [[ "$?" -gt 0 ]]; then
stderr_output=$(cat "$stderr_file")
rm "$stderr_file" # Clean up the temp file
echo "It took $n runs to fail"
echo "Standard Output: $stdout_output"
echo "Standard Error: $stderr_output"

break
else
(( n = n+1 ))
fi
done