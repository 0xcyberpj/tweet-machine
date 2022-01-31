# Tweet-machine  `Twitter OSINT Tool`


                  The Tool , Which  Used To retrive All the tweets and Replies as well as bio of the Any Twitter User (Target)
`kutty Tool :(`
                  
 [![https://imgur.com/EDcF0de.png](https://imgur.com/EDcF0del.png)](https://imgur.com/EDcF0del.png)
 
 **So What?, Now  we can retrive all The tweets and repllies (Even if the account was suspended)**
 
installtion :

```
git clone https://github.com/0xcyberpj/tweet-machine.git && cd tweet-machine
chmod +x twettmachine.sh
sudo ./tweetmachine.sh <username> <output-directory>

Eg:
Tweet-Machine@Pj >> sudo ./tweetmachine.sh cyberpj1 /tmp 
```
 
**Total Ouput Files**

```
cyberpj1.txt  cyberpj1.txt-timeline.txt  cyberpj1.txt.webarchive

cyberpj1.txt - Contains tweets and Replies Direct link

cyberpj1.txt.webarchive - Conatins tweet Link with wayback 
This Link can be valid if Direct link show `not found`
cyberpj1.txt-timeline.txt - This File Contains the Timeline of Every tweet!
```

Result: 

[![https://imgur.com/9SU51ds.png](https://imgur.com/9SU51dsl.png)](https://imgur.com/9SU51dsl.png)

![image](https://user-images.githubusercontent.com/72292872/151848632-e56996fa-8e2d-439e-9abd-a5de8f27628f.png)

1. What can i Do with This result?

>So the user *cyberpj* deleted all his previous tweets and changed his bio 
Even after deleting all the tweets, the links are still valid as long as they are used correctly!

---

1.Open the link in the browser `if the tweet does not exists` ,Then wayback arrives.

`https://web.archive.org/web/0/<tweetlink>`
  
 **Here We go**
  
 Example :
  
 https://twitter.com/Cyberpj1/status/1298998296216604677 - (Deleted!)
  
![image](https://user-images.githubusercontent.com/72292872/151793125-893262ab-505b-4cc0-84f5-2edbbad48be3.png)
  
`http://web.archive.org/web/0/<deletedtweet>``
  
![image](https://user-images.githubusercontent.com/72292872/151793168-5a134a75-2989-4c7c-8c1f-b10855565300.png)

**Here We got some shit post which contains very old tweet ( Nearly first tweet) and First Bio He had!**

2. Even After checking in Wayback ,if the Tweet not exist

Then
 

  
