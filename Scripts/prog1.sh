#!/bin/bash
clear
x=$(lsb_release -a)
echo "OS Details : $x"
echo "Available Shells :" 
echo $(cat /etc/shells)
echo "Mouse settings : "
echo $(xinput --list --short)
echo "CPU Information : "
echo $(lscpu)
echo "Memory  Information :"
echo $(free -m)
echo "File system :"
echo $(sudo fdisk -l)
