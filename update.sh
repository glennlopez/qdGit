#!/bin/bash
wget --spider --quiet https://raw.githubusercontent.com/glennlopez/qdGit/core/version
if [ "$?" == 0 ]; then
	echo 'run update script'
#check for proper connection
#rm pull.py and push.py
#wget pull.py and push.py from github
#
else
	clear
	echo 'ERROR: Cannot update. Check your network connection.'
fi
