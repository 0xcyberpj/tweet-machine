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
directory=$2
echo "Current Username : $username"
echo "Result Directory :" $directory
output="$username.txt"
yes=`curl "http://web.archive.org/web/timemap/?url=https%3A%2F%2Ftwitter.com/$username&matchType=prefix&collapse=urlkey&output=json&fl=original,mimetype" 2>/dev/null|grep twitter |cut -d '"' -f2 |tee $directory/$output`
`mkdir /tmp/temp/ 2>/dev/null`

echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '####################      (88%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'
damn=`curl "http://web.archive.org/web/timemap/?url=https://twitter.com/$username&matchType=prefix&collapse=urlkey&output=json&fl=original,mimetype,timestamp" 2>/dev/null >> "/tmp/temp/$username"`

`cat /tmp/temp/$username |cut -d "," -f3 2>/dev/null|cut -d '"' -f2 >> $directory/$output-timeline.txt`
cat $directory/$output|while read line;do echo "https://web.archive.org/web/0/$line"  >> $directory/$output.webarchive;done
clear
echo Done!
echo -e "\e[33mResults saved at $directory/$output"
echo "Webarchives Direct Link saved at : $directory/$output.webarchive"
echo -e "\e[32mSmall Output: "
head $directory/$output
echo -n -e "\e[37mFull result Location: $directory/$output"
echo " "
echo -n -e "\e[35mThanks For using this Damn Simple Tool"
sleep 12
clear
exit 0
#echo "Example http://web.archive.org/web/<timeline>/appropriate-tweetlink"
fi
