#!/bin/bash

######~METADATA~############
#proj = qdGit
#git = github.com
#author = glennlopez
#filename = push.sh
#version = 0.1
#debug = 0
############################

# Check network then store script version to variables
wget --spider --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh

if [ "$?" == 0 ]; then

	# store local version to variable
	awk '{ if ($1 ~ /#version/) print local $3}' push.sh > tmp
	loc_ver=$(<tmp)

	# store remote version to variable
	curl --silent -q -k https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh | awk '{ if ($1 ~ /#version/) print local $3}' > tmp
	rem_ver=$(<tmp)
else
	loc_ver=$(FAILED TO FETCH)
	rem_ver=$(FAILED TO FETCH)
fi


##########################
# FUNCTIONS
##########################

# Auto update script if outdated
function auto_update(){
	# don't update unless connection is established
	wget --spider --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh
	if [ "$?" == 0 ]; then

		# compare versions
		if [[ $loc_ver < $rem_ver ]]; then
			echo
			rm -f push.sh
			wget --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh
			echo "Script was updated from: v"$loc_ver "to" "v"$rem_ver
			echo
		fi

		# post update routine
		chmod +x push.sh
		rm -f tmp

	else
		echo 'Skipping update: Cannot establish connection to remote git repository.'
	fi
}

# Any key interaction
function pause(){
   read -sn 1 -p "Press any key to continue..."
}



##########################
# MAIN ROUTINE
##########################

# Run without autoupdate
if [ "$1" = -noupdate ]; then
	echo 'no updates'

elif [ "$1" = -ver ]; then
	echo 'Local version: '$loc_ver
	echo 'Remote version: '$rem_ver

# Force an update
elif [ "$1" = -update ]; then
	rm -f push.sh
	wget --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh
	chmod +x push.sh
	echo "Script forced to update!"
	echo

# Default task
else
	auto_update
fi
