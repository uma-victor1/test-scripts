#!/bin/bash

####################
# Author: Uma Victor
# Date: 13/06/2025
#
#
# This script outputs the node health
#
#
# Version: v1
####################

set -x ## Debug mode

df -h # check disk

free -g # check memory

nproc # check resources

ps -ef | grep amazon

ps -ef | grep amazon | awk -F" " '{print $2}'
