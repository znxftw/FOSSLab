#!/bin/bash
# Write a script to print out odd numbered lines from a file
FILENAME="$1"
sed -n 1~2p "$FILENAME"
