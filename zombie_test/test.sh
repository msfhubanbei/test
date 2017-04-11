#!/bin/bash
gcc -o zombie.o -c zombie_pod.c 
gcc -o zombie zombie.o
chmod 777 zombie
./zombie
