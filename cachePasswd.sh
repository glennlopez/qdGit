#!/bin/bash
'''
Core script:
sets up caching users git credentials
'''

##########################
# CORE SETUP ROUTINE
##########################

# Set git to use the credential memory cache
git config --global credential.helper cache

# Configure cache timeout
echo "How long do you want to cache your credentials?"
read cacheTimeout

# Set the cache to timeout after 1 hour (setting is in seconds)
	#git config --global credential.helper cache --timeout=$cacheTimeout
