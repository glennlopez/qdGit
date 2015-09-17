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
		nohup ./update.sh > /dev/null 2>&1 &
	fi

	rm -f version.old

##########################
# FUNCTIONS
##########################

# interaction requirred
function pause(){
   read -sn 1 -p "Press any key to continue..."
}

##########################
# INITIAL SETUP ROUTINE
##########################

# permission setup routine
	#ls *.sh | cat >> files.qdg
	#ls *.py | cat >> files.qdg

	#sed ':a;N;$!ba;s/\n/ /g' files.qdg > files_1.qdg
	#chmod +x $(<files_1.qdg)

# cleanup routine
	#rm -f *.qdg


##########################
# INSTALL DEPENDENCIES
##########################

# Check to see if git is installed
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' git|grep "install ok installed")

# Install git if its not installed
	if [ "" == "$PKG_OK" ]; then
		echo "Installing missing package..."
		echo
		sudo apt-get --force-yes --yes install git
	fi

	echo "[!] Initial setup complete."
	echo
	sleep 1
	pause
	clear



##########################
# GITHUB SETUP ROUTINE
##########################

# Make git colorful
	git config --global color.ui true

# Configure username:
	echo -n "[+] Git Username: "
	read usrUname
	git config --global user.name $usrUname

# Configure email:
	echo -n "[+] Git Email: "
	read usrEmail
	git config --global user.email $usrEmail
	echo
	echo "[!] Setup complete."
	sleep 1

else
		clear
		echo 'ERROR: Failed to communicate with github repo for. Script requires a working internet connection.'
		echo
fi
