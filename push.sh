#!/bin/bash
source col.sh

######~METADATA~############
#proj = qdGit
#git = github.com
#author = glennlopez
#filename = push.sh
#version = 0.8
#debug = 0
############################

# Error Codes:
	error503=$(echo 'ERROR: FAILED TO FETCH')
	error404=$(echo 'ERROR: CANNOT \ESTABLISH NETWORK CONNECTION')

# Check network before fetching version number
wget --spider --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh

if [ "$?" == 0 ]; then

	# store local version to variable
	awk '{ if ($1 ~ /#version/) print local $3}' push.sh > tmp
	loc_ver=$(<tmp)

	# store remote version to variable
	curl --silent -q -k https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh | awk '{ if ($1 ~ /#version/) print local $3}' > tmp
	rem_ver=$(<tmp)
else
	loc_ver=$error503
	rem_ver=$error503
fi

# remove tmp file used to store version number
rm -f tmp


##########################
# FUNCTIONS
##########################

# Auto update script if outdated
function auto_update(){
	# compare versions
	if [[ $loc_ver < $rem_ver ]]; then
		rm -f push.sh
		wget --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh
		echo "Script was updated from: v"$loc_ver "to" "v"$rem_ver
		echo
	fi

	# post update routine
	chmod +x push.sh
}

# Push changes to repo
function push(){
	echo -e "${Blu}blue ${Red}red ${RCol}etc...."
}

# Any key interaction
function pause(){
   read -sn 1 -p "Press any key to continue..."
}



##########################
# MAIN ROUTINE
##########################

# Don't run script unless connection is established
wget --spider --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh
if [ "$?" == 0 ]; then
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

		# Default task
	else
		auto_update
		push
	fi
else
	echo $error404
fi
