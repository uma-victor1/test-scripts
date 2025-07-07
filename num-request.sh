#!/bin/bash

cat apache_access | awk '{print $9}' | sort | uniq -c | awk '{print $2, $1}'