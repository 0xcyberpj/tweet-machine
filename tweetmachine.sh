#!/bin/bash
#Author : Dumb Script Writer Cyberpj ! 
#Basically I dont Know bash Scripting I know only how to create oneliners, I'll Update this script As soon as Possible
#`sudo apt install figlet lolcat -y 2>/dev/null 2>&1`
print_help() {
    echo -e "\e[32mTweet-Machine  - 0xcyberpj"
    echo "Usage: $0 [-u <twitter Id>] [-d <dir 'but not important'>]" 1>&2
    exit 0
}

if [[ -f $(which lolcat) ]] ; then
	echo -e "Tweet-Machine - 0xcyberpj"|lolcat 
	echo -e "\e[33mTweet-Machine  -0xcyberpj\n"|lolcat
	echo -e "\e[36mThis Simple Script Can be Used to Dump All the tweets and replies of the Given user [Target]"| lolcat
else
	echo -e "Tweet-Machine - 0xcyberpj" 
	echo -e "\e[33mTweet-Machine  -0xcyberpj\n"
	echo -e "\e[36mThis Simple Script Can be Used to Dump All the tweets and replies of the Given user [Target]"
fi
while getopts ":u:d:" o; do
    case "${o}" in
		u)
            username=${OPTARG}
            
            ;;
        d)
            directory=${OPTARG}

            ;;
        *)
            print_help
            ;;
    esac
done

    
if [ -z "${username}" ] ; then
	echo "username is must be included"
fi
if [ -z "${directory}" ]; then
	directory=${username}
fi
mkdir ${directory}
curl -# "http://web.archive.org/web/timemap/?url=https://twitter.com/$username&matchType=prefix&collapse=urlkey&output=json&fl=original,mimetype,timestamp" 2>/dev/null | cut -d '"' -f2 | tee $directory/$username.txt | while read line;do echo "https://web.archive.org/web/0/$line";done | tee  $directory/$username.webarchive | cut -d "/" -f11 >> $directory/$username.timeline

clear
echo -e "\e[33mResults saved at $directory/$username" 
echo "Webarchives Direct Link saved at : $directory/$username.webarchive" 
echo -e "\e[32mSmall Output: " 
head $directory/$username.txt 
echo -n -e "\e[37mFull result Location: $directory/$username.txt" 
echo -n -e "\e[35mThanks For using this Damn Simple Tool" 
sleep 2 
