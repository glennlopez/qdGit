#!/bin/bash
#test
##########################
# FUNCTIONS
##########################

# progress bar
pBar(){
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

function pause(){
   read -sn 1 -p "Press any key to continue..."
}

##########################
# FIX FILE PERMISSIONS
##########################

# core update routine
	rm -f push.py
	wget https://raw.githubusercontent.com/glennlopez/qdGit/development/push.py
	echo
	rm -f pull.py
	wget https://raw.githubusercontent.com/glennlopez/qdGit/development/pull.py

# filename collection routine
	ls *.sh | cat >> files.qdg
	ls *.py | cat >> files.qdg

	sed ':a;N;$!ba;s/\n/ /g' files.qdg > files_1.qdg

# permission setup routine
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
	echo
	sleep 1
	pause
	clear



##########################
# INITIAL SETUP
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