#!/bin/bash

#This script will handle your desktop setup
#The script will open a dmenu prompt and ask for your choice.

pgrep -x dmenu && exit

screen=$HOME/.screenlayout

choice=$(ls $screen | dmenu -i -p "Where are you?")

$screen/$choice

nitrogen --restore
