#!/bin/bash

#check to see if update directory exists
if [ ! -d "qdg_update" ]; then
	mkdir qdg_update
	cd qdg_update
	echo 0 > version
	cd ..
fi

##---------------paste this in push.py, pull.py-------
##########################
# SELF UPDATE ROUTINE
##########################
	#mkdir qdg_update
	#cd qdg_update
	#mv version version.old
	#wget version from core branch
	#if version.old <= version then skip update routine
	#else run the update routine
		#wget update.sh from core branch
		#rm -version.old
		#run update.sh in a new terminal
		#exit current script for update
	#rm version
	#mv version.old version

			#---------update.sh---------------
			#check for proper connection
			#rm pull.py and push.py
			#wget pull.py and push.py from github
			#

##---------------------------------------------------

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
	ls *.sh | cat >> files.qdg
	ls *.py | cat >> files.qdg

	sed ':a;N;$!ba;s/\n/ /g' files.qdg > files_1.qdg
	chmod +x $(<files_1.qdg)

# cleanup routine
	rm -f *.qdg


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
