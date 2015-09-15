#!/usr/bin/env python
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
# update setup routine
#cmd('rm -f setup.sh')
#cmd('wget https://raw.githubusercontent.com/glennlopez/qdGit/stable/setup.sh')
#cmd('chmod +x setup.sh')

# pull routine
cmd('clear')
print colors.BOLD + "Github Pull Script" + colors.WHITE
print colors.GREEN + "[!] " + colors.WHITE + "Synchronizing with github..."
cmd('git pull') # comment this out if this doesnt work
#cmd('git pull orgin master')		#pull changes from github
print
print colors.YELLOW + "[!] Pull complete:" + colors.WHITE + " check the logs above for more info."
# end of script
