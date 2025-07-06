#!/bin/bash

###################
# Write a bash script named find-file.sh that accepts a filename as argument and outputs the number of matches found in the whole filesystem followed by a list of all the file paths of the matches. If no files are found, it should output `Found 0 matches`.
###################

if [ -z "$1" ]; then
echo "Usage: $0 <file name to search>"
exit 1
fi

RESULT=$(find / -type f -name "$1" 2>/dev/null)

if [[ -z "$RESULT" ]]; then
  echo "Found 0 matches"
else 
  COUNT=$(echo "$RESULT" | wc -l |xargs)
  echo "Found $COUNT matches"
  echo "$RESULT"
fi
