#!/bin/bash

##########################
# FUNCTIONS
##########################

# progress bar
pBar() {
	echo "Starting the next step:"
	echo -ne '#####                     (33%)\r'
	sleep 0.5
	echo -ne '#############             (66%)\r'
	sleep 0.5
	echo -ne '#######################   (100%)\r'
	sleep 1
	echo -ne '\n'
}

##########################
# FIX FILE PERMISSIONS
##########################

# file name collection routine
	ls *.sh | cat >> files.qdg
	ls *.py | cat >> files.qdg
	ls *.exp | cat >> files.qdg

	sed ':a;N;$!ba;s/\n/ /g' files.qdg > files_1.qdg

# permission setup routine
	dirFiles=$(<files_1.qdg)
	chmod +x $dirFiles

# tmp file cleanup routine
	rm -f *.qdg


##########################
# INSTALL MISSING PACKAGES
##########################

# Check to see if git is installed
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' git|grep "install ok installed")

# Install git if its not installed
	if [ "" == "$PKG_OK" ]; then
		echo "Installing missing package..."
		echo
		sudo apt-get --force-yes --yes install git
	fi


##########################
# INITIAL SETUP
##########################

	echo "[!] Initial setup complete."
	sleep 1
	echo

	pBar
	clear

# Configure git user:
	# setup username
	echo -n "[+] User Name: "
	read usrUname
	git config --global user.name $usrUname

# Configure email:
	# setup email
	echo -n "[+] Email: "
	read usrEmail
	git config --global user.email $usrEmail
	echo
	echo "[!] User setup complete."
	sleep 1

	pBar
	clear
#	./genSSHkey.sh
