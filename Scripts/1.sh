#!/bin/bash

echo "Hello World"
x=$(logname)
echo "Currently logged in as : $x"
echo "Current Shell : $SHELL"
echo "Home Directory : $HOME"
x=$(arch)
echo "Architecture : $x"
echo "Current Path : $PATH"
echo "pwd : $pwd"
echo "Logged in users : $users"
