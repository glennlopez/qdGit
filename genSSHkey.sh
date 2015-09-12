#!/bin/bash
'
Ref:
https://help.github.com/articles/generating-ssh-keys/
'

##########################
# GENERATE SSH KEY
##########################

# Creates a new ssh key, using the provided email as a label
	echo -n "[+] Git Email: "
	read gitUname
	ssh-keygen -t rsa -b 4096 -C $gitUname
	echo

	# progress bar
	echo "Starting ssh-agent setup:"
	echo -ne '#####                     (33%)\r'
	sleep 0.5
	echo -ne '#############             (66%)\r'
	sleep 0.5
	echo -ne '#######################   (100%)\r'
	sleep 1
	echo -ne '\n'


##########################
# ADD KEY TO SSH AGENT
##########################

# start the ssh-agent in the background
	eval "$(ssh-agent -s)"
	echo
	echo "Opening gEdit..."
	echo "Do a select-all (ctrl+a) and copy (ctrl+c) the contents of the text file"
	echo
			sleep 3
			gedit ~/.ssh/id_rsa.pub file

	echo "Opening Firefox URL Shortly..."
	echo "Paste your Key into your github account."
	echo "Be sure to add a Title in your github form SSH entry"

	# PROMPT USER WHEN DONE


##########################
# TEST CONNECTION
##########################

# Attempt to ssh github
	ssh -T git@github.com
