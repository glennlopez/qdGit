#!/bin/bash
wget --spider --quiet https://raw.githubusercontent.com/glennlopez/qdGit/core/version
if [ "$?" == 0 ]; then
	cd ..
	rm -f pull.py; rm -f push.py
	wget --quiet https://raw.githubusercontent.com/glennlopez/qdGit/core/push.py
	wget --quiet https://raw.githubusercontent.com/glennlopez/qdGit/core/pull.py
	chmod +x pull.py;chmod +x push.py

#check for proper connection
#rm pull.py and push.py
#wget pull.py and push.py from github

else
	clear
	echo 'ERROR: Cannot update. Check your network connection.'
fi
