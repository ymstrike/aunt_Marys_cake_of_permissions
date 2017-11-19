#!/bin/bash
#Name   :Yuval Matityahu
#Purpose:Add $USERNAME to groups that insert as input parmetars  
#        if $USERNAME alraedy in group then notify by print message
#        if $USERNAME not exist in group then notify by print message in green color
#        with black background that $USERNAME shuld be part of this group
#        the script check that the user insert at least 4 names of group
#Version 1.0
#Date : 7/12/2017

get_count_grp()
{
for grp_name in $group_name
do
  let "count++"
done
}



find_group()
{
  command=$(cat /etc/group |grep "$grp")
  user_name=$(cat /etc/group |grep "$grp" | cut -d ":" -f4)
  if [ $USERNAME = $user_name ];then
   printf "$user_name already in group $grp\n"
  flag=1
  printf "flag = $flag\n"
  else
  #printf "user_name = $user_name\n"
  flag=0
  fi
}

add_group()
{
if [ $flag -eq 0 ];then
printf "\e[48;5;0m"   #backgroud color BLACK
printf "\e[1;32m"     #forground color GREEN
printf "Your USER '$USERNAME' will add soon to GROUP '$grp'\n"
usermod -a -G $grp $USERNAME 
printf "\e[0m"      # return to default color
fi
}


count=0
# get groups name from the user
while [ $count -ne 4 ]
do
read -p "Please enter name of groups to add (at least 4) : " group_name
get_count_grp
if [ $count -ne 4 ];then
  printf "You must enter at least 4 names of groups \n"
fi
done
flaf=0
for grp in $group_name
do
find_group
#
if [ $flag -eq 0 ];then
  add_group
fi
done


