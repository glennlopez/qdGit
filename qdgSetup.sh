#!/bin/bash

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
