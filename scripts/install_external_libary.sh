#!/bin/bash
mkdir -p library/ansible-aur/
wget -N -P library/ansible-aur/  https://raw.githubusercontent.com/pigmonkey/ansible-aur/master/aur &&
  chmod u+x library/ansible-aur/aur
