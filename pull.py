#!/usr/bin/env python
'''
This script auto updates (pulls) all changes from github to your
local host. Visit - https://help.github.com/articles/generating-ssh-keys
to setup your SSH keys..
													- github.com/glennlopez
'''
import subprocess
import os

# Colors the text
class colors:
    PURPL = '\033[95m'
    BLUE = '\033[94m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    WHITE = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

# CMD FUNCTION - for running shell scripts
def cmd(cmd):
	os.system(cmd)


##########################
# COMMANDS TO EXECUTE
##########################
cmd('clear')
print colors.BOLD + "Github Pull Script" + colors.WHITE
print colors.GREEN + "Copying files from github..." + colors.WHITE
cmd('git pull') # comment this out if this doesnt work
#cmd('git pull orgin master')		#pull changes from github
print
print colors.YELLOW + "Pull Complete: Local directory updated!!" + colors.WHITE
# end of script