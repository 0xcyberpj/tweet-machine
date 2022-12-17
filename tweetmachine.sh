#!/bin/bash
#Author : Dumb Script Writer Cyberpj ! 
#Basically I dont Know bash Scripting I know only how to create oneliners, I'll Update this script As soon as Possible
#`sudo apt install figlet lolcat -y 2>/dev/null 2>&1`
#echo -e "[+] Insalled Figlet and Lolcat"
chmod +x .
clear
print_help() {
    echo -e "\e[32mTweet-Machine  - 0xcyberpj"
    echo -e "\e[31mUsage: sudo ./tweetmachine.sh <username>  <output-directory>"
    echo -e "<username> -- if you Dont know the actual username ,you can use known Name
	           Example: Actual username is '\e[32mcyberpj1\e[31m', but you know only '\e[32mcyberpj\e[31m' 
	            '\e[36msudo ./tweetmachine.sh cyberpj /tmp\e[31m'
		   "Note: It may Make the Output Long!!""
    exit 0

}
if test "$#" -ne 2; then
    print_help

else 

echo -e "Tweet-Machine - 0xcyberpj\n"|lolcat 2>/dev/null

#echo -e "\e[33mTweet-Machine  -0xcyberpj\n"
echo -e "\e[36mThis Simple Script Can be Used to Dump All the tweets and replies of the Given user [Target]"
echo " "
username=$1
[[ -d $2 ]] && echo "no need to create!!" || mkdir $2
directory=$2
echo "Current Username : $username"
echo "Result Directory :" $directory
curl -# "http://web.archive.org/web/timemap/?url=https://twitter.com/$username&matchType=prefix&collapse=urlkey&output=json&fl=original,mimetype,timestamp" 2>/dev/null | cut -d '"' -f2 | tee $directory/$username.txt | while read line;do echo "https://web.archive.org/web/0/$line";done | tee  $directory/$username.webarchive | cut -d "/" -f11 >> $directory/$username.timeline
clear
echo Done!
echo -e "\e[33mResults saved at $directory/$username"
echo "Webarchives Direct Link saved at : $directory/$username.webarchive"
echo -e "\e[32mSmall Output: "
head $directory/$username.txt
echo -n -e "\e[37mFull result Location: $directory/$username.txt"
echo " "
echo -n -e "\e[35mThanks For using this Damn Simple Tool"
sleep 2
#echo "Example http://web.archive.org/web/<timeline>/appropriate-tweetlink"
fi
