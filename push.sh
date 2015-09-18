#!/bin/bash

######~METADATA~############
#proj = qdGit
#git = github.com
#author = glennlopez
#filename = push.sh
#version = 0.8
#debug = 0
############################

# Colored text formatting
RCol='\e[0m'
Bla='\e[0;30m';     BBla='\e[1;30m';    UBla='\e[4;30m';    IBla='\e[0;90m';    BIBla='\e[1;90m';   On_Bla='\e[40m';    On_IBla='\e[0;100m';
Red='\e[0;31m';     BRed='\e[1;31m';    URed='\e[4;31m';    IRed='\e[0;91m';    BIRed='\e[1;91m';   On_Red='\e[41m';    On_IRed='\e[0;101m';
Gre='\e[0;32m';     BGre='\e[1;32m';    UGre='\e[4;32m';    IGre='\e[0;92m';    BIGre='\e[1;92m';   On_Gre='\e[42m';    On_IGre='\e[0;102m';
Yel='\e[0;33m';     BYel='\e[1;33m';    UYel='\e[4;33m';    IYel='\e[0;93m';    BIYel='\e[1;93m';   On_Yel='\e[43m';    On_IYel='\e[0;103m';
Blu='\e[0;34m';     BBlu='\e[1;34m';    UBlu='\e[4;34m';    IBlu='\e[0;94m';    BIBlu='\e[1;94m';   On_Blu='\e[44m';    On_IBlu='\e[0;104m';
Pur='\e[0;35m';     BPur='\e[1;35m';    UPur='\e[4;35m';    IPur='\e[0;95m';    BIPur='\e[1;95m';   On_Pur='\e[45m';    On_IPur='\e[0;105m';
Cya='\e[0;36m';     BCya='\e[1;36m';    UCya='\e[4;36m';    ICya='\e[0;96m';    BICya='\e[1;96m';   On_Cya='\e[46m';    On_ICya='\e[0;106m';
Whi='\e[0;37m';     BWhi='\e[1;37m';    UWhi='\e[4;37m';    IWhi='\e[0;97m';    BIWhi='\e[1;97m';   On_Whi='\e[47m';    On_IWhi='\e[0;107m';

# Error Codes:
	error503=$(echo -e "${BRed}[!]${Whi} Failed to fetch")
	error404=$(echo -e "${BRed}[!]${Whi} No network connection")

# Check network before fetching version number
wget --spider --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh

if [ "$?" == 0 ]; then

	# store local version to variable
	awk '{ if ($1 ~ /#version/) print local $3}' push.sh > tmp
	loc_ver=$(<tmp)

	# store remote version to variable
	curl --silent -q -k https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh | awk '{ if ($1 ~ /#version/) print local $3}' > tmp
	rem_ver=$(<tmp)
else
	loc_ver=$error503
	rem_ver=$error503
fi

# remove tmp file used to store version number
rm -f tmp


##########################
# FUNCTIONS
##########################

# Auto update script if outdated
function auto_update(){
	# compare versions
	if [[ $loc_ver < $rem_ver ]]; then
		rm -f push.sh
		wget --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh
		echo "Script was updated from: v"$loc_ver "to" "v"$rem_ver
		echo
	fi

	# post update routine
	chmod +x push.sh
}

# Textual header formating
function txtHeader(){
	echo -e "${BWhi}Github Update Script v"$loc_ver ${Whi}
	echo -e "-------------------------------"
}

# Push changes to repo
function push(){
	clear
	txtHeader
	echo 'blah'


}

function pause(){
   read -sn 1 -p "Press any key to continue..."
}




##########################
# SCRIPT ROUTINE
##########################

# Don't run script unless connection is established
wget --spider --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh
if [ "$?" == 0 ]; then
	# Run without autoupdate
	if [ "$1" = -noupdate ]; then
		echo 'no updates'

	elif [ "$1" = -ver ]; then
		echo 'Local version: '$loc_ver
		echo 'Remote version: '$rem_ver

		# Force an update
	elif [ "$1" = -update ]; then
		rm -f push.sh
		wget --quiet https://raw.githubusercontent.com/glennlopez/qdGit/development/push.sh
		chmod +x push.sh
		echo "Script forced to update!"

		# Default task
	else
		push
		auto_update
	fi
else
	echo $error404
fi
