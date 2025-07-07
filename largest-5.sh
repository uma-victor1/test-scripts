#!/bin/bash

cat apache_access | awk '{print $10}' | grep -E '^[0-9]+$' | sort -nr | head -n 5 