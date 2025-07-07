#!/bin/bash

cat apache_access | awk '{print $1}' | sort -u | wc -l