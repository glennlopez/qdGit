#!/bin/bash
##########################
#version = 0.8
#debug = 0
##########################

function script_update(){
	# check network connection
	wget --spider --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh
	if [ "$?" == 0 ]; then

		# local script
		awk '{ if ($1 ~ /#version/) print local $3}' push.sh > tmp
		loc_ver=$(<tmp)
		mv push.sh old.push.sh

		# remote script
		wget --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh
		awk '{ if ($1 ~ /#version/) print local $3}' push.sh > tmp
		rem_ver=$(<tmp)

		# compare versions for update
		if [[ $loc_ver < $rem_ver ]]; then
			rm -f old.push.sh
			echo 'You were running an older version of' $0
			echo $0 'was updated to version' $rem_ver
		else
			echo 'Local version is up to date.'
			rm -f push.sh
			mv old.push.sh push.sh
		fi

		chmod +x push.sh
		rm -f tmp
	else
		echo 'Skipping update: Cannot establish connection to remote git repository.'
	fi
}

script_update
echo
echo 'script complete'
