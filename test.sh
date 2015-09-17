#!/bin/bash

# Do not run the script if network cannot communicate with repo
wget --spider --quiet https://raw.githubusercontent.com/glennlopez/qdGit/core/version
if [ "$?" == 0 ]; then

##########################
# SELF UPDATE ROUTINE
##########################

	#check to see if update directory exists
	if [ ! -d "qdg_update" ]; then
		mkdir qdg_update
		cd qdg_update
		echo 0 > version
		cd ..
	fi

	cd qdg_update

	#store local version into a var
	loc_ver=$(<version)
	echo "local version: "$loc_ver

	#rename local version file for version comparison
	mv version version.old

	#download new version info
	wget --quiet https://raw.githubusercontent.com/glennlopez/qdGit/core/version

	#store remote version into a var
	rem_ver=$(<version)
	echo "remote version: "$rem_ver

	#if version.old < version then skip update routine
	if [[ $loc_ver < $rem_ver ]]; then
		echo "run the update...."
		wget --quiet https://raw.githubusercontent.com/glennlopez/qdGit/core/update.sh
		chmod +x update.sh
		nohup update.sh > /dev/null 2>&1 &
		cd ..
		exit
		#spawn a new terminal
		#run update.sh in a new terminal
	fi

	rm -f version.old

##---------PLACE OLD SCRIPTS HERE-----------------


else
		clear
		echo 'ERROR: Failed to communicate with github repo for. Script requires a working internet connection.'
		echo
fi
