#!/bin/bash
'''
This script performs additional setup routines for you.
Visit - https://help.github.com/articles/generating-ssh-keys
to setup your SSH keys..
													- github.com/glennlopez
'''

##########################
# ADDITIONAL SETUP
# test
##########################

# Configure editor choice:
	echo "[+] Text Editor:"
	read usrTxtEdit
	echo "[!] (Leave blank if not sure)" #is a subtitle, change color
	git config --global core.editor $usrTxtEdit -w

# Add color to git:
	git config --global color.ui true
