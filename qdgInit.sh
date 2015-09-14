#!/bin/bash

##########################
# FUNCTIONS
##########################

# progress bar
pBar() {
	echo "Wait: Starting the next step"
	echo -ne '###                       \r'
	sleep 0.2
	echo -ne '########                  \r'
	sleep 0.2
	echo -ne '#############             \r'
	sleep 0.2
	echo -ne '##################        \r'
	sleep 0.2
	echo -ne '#######################   \r'
	sleep 1
	echo -ne '\n'
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
		echo "Installing missing package..."
		echo
		sudo apt-get --force-yes --yes install git
	fi

	echo "[!] Initial setup complete."
	sleep 1
	echo

	pBar
	clear



##########################
# INITIAL SETUP
##########################

# Configure username:
	echo -n "[+] Git Username: "
	read usrUname
	git config --global user.name $usrUname

# Configure email:
	echo -n "[+] Git Email: "
	read usrEmail
	git config --global user.email $usrEmail
	echo

# Configure project name
	echo "Your repo name is required for the last step. Its the last word in the url for your repo if stored in github."
	echo
	echo "For example:"
	echo "in Http://github.com/glennlopez/qdGit <-- qdGit is the repo name."
	echo
	echo -n "[+] Github Repository Name: "
	read prjName
	git remote set-url origin git@github.com:$usrUname/$prjName.git
	echo "[!] Setup complete."
	sleep 1
