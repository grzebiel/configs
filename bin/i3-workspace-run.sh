#!/bin/bash

#usage i3-workspace-run.sh [workspace] [application]
#go to specific workspace and run application if its not run already
i3-msg workspace $1 && pidof $2 &> /dev/null || $2
