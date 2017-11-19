#!/bin/bash
#Name   :Yuval Matityahu
#Purpose:Scan all files in /home and count & print number of files that owner is $USERNAME  
#        the script check if ID insert by user as a parmater eq to my ID stored in id_user
#        if it eq the script will run , else print message that the user is not alow to run
#        the script
#Version 1.0
#Date : 7/12/2017


id_user="058726811"
read -p "Enter your ID please : " id_input

if [ $id_user = $id_input ];then
count_files=0
 # fetch only files  with own file - print $3  
for line in $(ls -lap /home/$USERNAME |grep -v "total"|awk '{print $3}');
do
  own_file=$(echo $line |cut -d":" -f1)
   # if own file equal to $USERNAME then incrememt the counter of files
  if [ $own_file = $USERNAME ];then
    let "count_files++"
  fi
done
printf "Number of files belong to $USERNAME is : $count_files\n"
else
printf "Sorry , Your ID is not alow to run this scripts !\n"
fi
