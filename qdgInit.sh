#!/bin/bash

##########################
# FUNCTIONS
##########################

# progress bar
pBar() {
	printf "Wait: Starting the next step"
	printf -ne '###                       \r'
	sleep 0.5
	printf -ne '########                  \r'
	sleep 0.5
	printf -ne '#############             \r'
	sleep 0.5
	printf -ne '##################        \r'
	sleep 0.5
	printf -ne '#######################   \r'
	sleep 1
	printf -ne '\n'
}

##########################
# FIX FILE PERMISSIONS
##########################

# filename collection routine
	ls *.sh | cat >> files.qdg
	ls *.py | cat >> files.qdg
	ls *.exp | cat >> files.qdg

	sed ':a;N;$!ba;s/\n/ /g' files.qdg > files_1.qdg

# permission setup routine
	#dirFiles=$(<files_1.qdg)
	#chmod +x $dirFiles
		# code golfing the above cmds
		chmod +x $(<files_1.qdg)

# tmp file cleanup routine
	rm -f *.qdg


##########################
# INSTALL MISSING PACKAGES
##########################

# Check to see if git is installed
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' git|grep "install ok installed")

# Install git if its not installed
	if [ "" == "$PKG_OK" ]; then
		printf "Installing missing package..."
		printf
		sudo apt-get --force-yes --yes install git
	fi


##########################
# INITIAL SETUP
##########################

	printf "[!] Initial setup complete."
	sleep 1
	printf

	pBar
	clear

# Configure git user:
	# setup username
	printf -n "[+] User Name: "
	read usrUname
	git config --global user.name $usrUname

# Configure email:
	# setup email
	printf -n "[+] Email: "
	read usrEmail
	git config --global user.email $usrEmail
	printf
	printf "[!] User setup complete."
	sleep 1

	pBar

# Fix git orgin permission error
 #git remote set-url origin git@github.com:USERNAME/PROJECTNAME.GIT
