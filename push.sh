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
	# don't update unless connection is established
	wget --spider --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh
	if [ "$?" == 0 ]; then

		# store local version variable
		awk '{ if ($1 ~ /#version/) print local $3}' push.sh > tmp
		loc_ver=$(<tmp)

		# store remote version variable
		curl --silent -q https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh | awk '{ if ($1 ~ /#version/) print local $3}' > tmp
		rem_ver=$(<tmp)

		# compare versions
		if [[ $loc_ver < $rem_ver ]]; then
			echo
			rm -f push.sh
			wget --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh
			echo "Script was updated from: v"$loc_ver "to" "v"$rem_ver
			echo
		fi

		chmod +x push.sh
		rm -f tmp
	else
		echo 'Skipping update: Cannot establish connection to remote git repository.'
	fi
}

auto_update
