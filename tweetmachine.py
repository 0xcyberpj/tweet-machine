#!/usr/bin/env python3
# tweetmachine python script

import argparse
import os
import requests
from urllib.parse import urlparse, quote

def print_help():
    print("\033[32mTweet-Machine")
    print("Usage: ./tweetmachine.py [-u <twitter Id>] [-d <dir 'but not important'>]")
    exit(0)
    
print("\033[33m\t\t\t\tTweet-Machine \n  #Twittter OSINT Made Easy  \n")
print("\033[36mThis Simple Script Can be Used to Dump All the tweets and replies of the Given user [Target]")

parser = argparse.ArgumentParser()
parser.add_argument('-u', dest='username', help='Twitter ID')
parser.add_argument('-d', dest='directory', help='Directory to save output')
args = parser.parse_args()

if not args.username:
    print("username must be included")
    exit(0)
    
directory = args.directory if args.directory else args.username

os.makedirs(directory, exist_ok=True)

url = f"http://web.archive.org/web/timemap/?url=https://twitter.com/{quote(args.username)}&matchType=prefix&collapse=urlkey&output=json&fl=original,mimetype,timestamp"

response = requests.get(url, stream=True)
web_archive_lines = response.iter_lines()
web_archives = (line.decode('utf-8').split('"')[1] for line in web_archive_lines if line)

with open(os.path.join(directory, f"{args.username}.txt"), 'w') as text_file:
    with open(os.path.join(directory, f"{args.username}.webarchive"), 'w') as web_file:
        for web_archive in web_archives:
            web_file.write(f"https://web.archive.org/web/0/{web_archive}\n")
            timeline_record = urlparse(web_archive).path.split('/')[-1]
            text_file.write(timeline_record + '\n')

print("\033[31mResults saved at \033[33m{}/{}\033[m".format(directory, args.username))
print("\033[31mWebarchives Direct Link saved at \033[33m: \033[32m{}/{}.webarchive \033[m".format(directory, args.username))

with open(os.path.join(directory, f"{args.username}.webarchive"), "r") as web_file:
    head_lines = [next(web_file) for _ in range(4)]
    print(''.join(head_lines))
    
print("\033[5mFull result Location:  \033[2;34m{}/{}.txt\033[m\n".format(directory, args.username))
