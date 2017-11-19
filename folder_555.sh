#!/bin/bash
#Name   :Yuval Matityahu
#Purpose:Get list of folder name create them and fiv them 555 permission  
#        for example ./folder_555 aa bb cc
#        will create folders aa bb and cc with 555 permission
#Version 1.0
#Date : 7/12/2017

# asked user to insert list of folders name
read -p "Please Enter folder names as a list : " folder_names

for folder in $folder_names
do
 mkdir -m 555 $folder    # creat folder and give permission 555
done

