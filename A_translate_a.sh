#!/usr/bin/bash
str="This is a Bash Shell script."
echo $str
newstr=`tr '[A-Z]' '[a-z]' <<<"$str"`
echo $newstr
