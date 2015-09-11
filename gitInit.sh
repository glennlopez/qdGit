#!/bin/bash

##########################
# FIX FILE PERMISSIONS
##########################

# Make these excecutable scripts
	ls *.sh | cat >> files.qdg
	ls *.py | cat >> files.qdg

# permission setup routine
	sed ':a;N;$!ba;s/\n/ /g' files.qdg > files_1.qdg
	dirFiles=$(<files_1.qdg)
	chmod +x $dirFiles

# cleanup routine
	rm -f *.qdg


##########################
# INITIAL SETUP
##########################

# Check to see if git is installed
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' git|grep "install ok installed")

# Install git if its not installed
	if [ "" == "$PKG_OK" ]; then
		echo "Installing missing package..."
		sudo apt-get --force-yes --yes install git
	fi

	echo "[!] Initial setup complete."
	sleep 1
	echo

	# progress bar
	echo "Starting user configuration:"
	echo -ne '#####                     (33%)\r'
	sleep 0.5
	echo -ne '#############             (66%)\r'
	sleep 0.5
	echo -ne '#######################   (100%)\r'
	sleep 1
	echo -ne '\n'

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

	# progress bar
	echo "Starting SSH configuration:"
	echo -ne '#####                     (33%)\r'
	sleep 0.5
	echo -ne '#############             (66%)\r'
	sleep 0.5
	echo -ne '#######################   (100%)\r'
	sleep 1
	echo -ne '\n'

	clear


##########################
# INITIALIZE GIT
##########################

# Make a new directory: $mkdir Git
# Go to the newly created folder: $cd Git
# Initialize current directory as a git project: $git init
# Clone a repository to the local drive: ???
