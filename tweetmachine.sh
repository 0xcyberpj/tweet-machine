#!/bin/bash
#Author :  Cyberpj ! , R4vanan  
#Basically I dont Know bash Scripting I know only how to create oneliners, I'll Update this script As soon as Possible

print_help() {
    echo -e "\e[32m Tweet-Machine"
    echo "Usage: $0 [-u <twitter Id>] [-d <dir 'but not important'>]" 1>&2
    exit 0
}

	echo -e "\e[33m\t\t\t\t Tweet-Machine \n  #Twittter OSINT Made Easy  \n"
	echo -e "\e[36m This Simple Script Can be Used to Dump All the tweets and replies of the Given user [Target]"
	
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
	exit 0
fi
if [ -z "${directory}" ]; then
	directory=${username}
fi
mkdir ${directory}
curl -# "http://web.archive.org/web/timemap/?url=https://twitter.com/$username&matchType=prefix&collapse=urlkey&output=json&fl=original,mimetype,timestamp" 2>/dev/null | cut -d '"' -f2 | tee $directory/$username.txt | while read line;do echo "https://web.archive.org/web/0/$line";done | tee  $directory/$username.webarchive | cut -d "/" -f11 >> $directory/$username.timeline

clear
echo -e "\e[31mResults saved at \033[33m $directory/$username\033[m" 
echo -e  "\e[31mWebarchives Direct Link saved at \033[33m: \033[32m $directory/$username.webarchive \033[m" 

head $directory/$username.webarchive -n 4 
echo -n -e "\e[5mFull result Location:  \033[2;34m $directory/$username.txt\033[m\n" 


