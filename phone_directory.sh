#!/bin/bash


while :
do 
clear
echo "Welcome to the Record System"
echo "1. Add a Contact"
echo "2. Search Contacts"
echo "3. Delete Contact"
echo "4. View Phone Directory"
echo "5. Quit"
read -p "Enter your choice: " usr_cmd
clear

case $usr_cmd in
1) echo "Add NEW CONTACT"
 read -p "Enter name: " name
 echo "Got that!"
 read -p "Enter Number: " number
 clear
 echo "New Contact Info: "
 echo "-> Name: $name. -> Number: $number"
 echo "$name : $number" >> recorddir.log
 echo "Saved successfully";;

2) echo "Search Records"
 read -p "Enter contact name to Search: " search_query
 echo "SEARCH RESULTS:"
 grep -i $search_query recorddir.log;;

3) echo "DELETE RECORD"
 read -p "Enter contact name to be Deleted(case-sensitive): "  delete_string
 sed -i -e "/$delete_string/d" recorddir.log
 echo "Delete Sucessful";;

4) echo "RECORD SYSTEM"
 echo ""
 cat recorddir.log;;

5)break;;
*)echo "INVALID OPTION";;
esac

read -p "Press 5 to Quit, Anything else to Return to Main Menu: " confirm_exit
if [ $confirm_exit -eq 5]
then exit;

fi
done 
