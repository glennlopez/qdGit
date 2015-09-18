#!/bin/bash

######~METADATA~############
#proj = qdGit
#git = github.com
#author = glennlopez
#filename = push.sh
#version = 0.8
#debug = 0
############################

function auto_update(){
	# check network connection
	wget --spider --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh
	if [ "$?" == 0]; then

		# local script
		awk '{ if ($1 ~ /#version/) print local $3}' push.sh > tmp
		loc_ver=$(<tmp)
		mv push.sh old.push.sh

		# remote script
		#wget --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh
		#awk '{ if ($1 ~ /#version/) print local $3}' push.sh > tmp

		curl --silent -q https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh | awk '{ if ($1 ~ /#version/) print local $3}' > tmp
		rem_ver=$(<tmp)

		# compare versions
		if [[ $loc_ver < $rem_ver ]]; then
			echo
			rm -f push.sh
			wget --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh
			echo "This script was outdated!"
			echo "It's been updated from: v" $loc_ver "to" "v"$rem_ver
			echo
		else
			rm -f push.sh
			mv old.push.sh push.sh
		fi

		chmod +x push.sh
		rm -f tmp
	else
		echo 'Skipping update: Cannot establish connection to remote git repository.'
	fi
}

auto_update
