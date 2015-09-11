#!/bin/bash
'''
This script should setup and initialize a git project for you.
Visit - https://help.github.com/articles/generating-ssh-keys
to setup your SSH keys..
													- github.com/glennlopez
'''


##########################
# INITIAL SETUP
##########################

# Fix file permissions :mandatory:
	#chmod +x gitInit.sh, push.py, pull.py

# Check to see if git package is installed: ???

# Install git:
	echo "[+] Installing git..."
	sudo apt-get install git
	clear
	echo "[+] Setup Complete!"

# Configure git user:
	# setup username
	echo "User Name:"
	read usrUname
	git config --global user.name $usrUname
	clear

# Configure email:
	# setup email
	echo "Email:"
	read usrEmail
	git config --global user.email $usrEmail
	clear


##########################
# INITIALIZE GIT
##########################

# Make a new directory: $mkdir Git
# Go to the newly created folder: $cd Git
# Initialize current directory as a git project: $git init
# Clone a repository to the local drive: ???
