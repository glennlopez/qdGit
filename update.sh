#!/bin/bash
wget --spider --quiet https://raw.githubusercontent.com/glennlopez/qdGit/core/version
if [ "$?" == 0 ]; then
	rm -f pull.py; rm -f push.py
	wget --quiet https://raw.githubusercontent.com/glennlopez/qdGit/core/push.py
	wget --quiet https://raw.githubusercontent.com/glennlopez/qdGit/core/pull.py
	chmod +x pull.py;chmod +x push.py
else
	clear
	echo 'ERROR: Cannot update. Check your network connection.'
fi
