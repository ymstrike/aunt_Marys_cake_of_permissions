#!/bin/bash
#Name   :Yuval Matityahu
#Purpose:Evoke every time "chmod" command is running by the user  
#        i create alias for chmod='./do_chmod' ==> run this script
#        after the command run the user get information about
#        Filename ,Uid who run rhe command ant the Time changed the permission
#Version 1.0
#Date : 7/12/2017

# asked user to confirm to run the command
read -p "Are you shure to change the permission $1 to this file $2 (y or Y to ok) ?" ans
if [ $ans = "y" -o "Y" ];then     # if the user inse't 'y' or 'Y' the command will execute
chmod $1 $2
   # print name of file Uid ant time chnged permission
stat $2 |grep -e "File"
stat $2 |grep -e "Uid"
stat $2 |grep -e "Change"
fi
