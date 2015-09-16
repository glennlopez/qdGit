<!-- https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet -->
<!-- https://stackedit.io/editor -->
<!-- http://www.emoji-cheat-sheet.com/ -->

qdGit
=================
The script will add and push all changes in one commit entry. Use it if you need to git things done quickly and don't care about the mess you leave behind.

> :paperclip: This script only simplifies pushing and pulling to git. Initializing git from the present working directory will be added soon.

### How to use
Place qdGit.sh into your project directory, then run the script. Running qdGit.sh will place the latest pull.py and push.py into your project directory, which you can use to quickly push or pull changes by:

Running `./push.py` to push commits to your git repository \n
Running `./pull.py` to synchronize your local copy with your repo

### How setup
Type `chmod +x qdGit.sh` into terminal to change qdGit.sh's permission to be executable. Run using `./qdGit.sh` after you've changed the file permission.

### Script Summary

|  Name        | Description           |
| ------------- |:--------------------:|
| setup.sh   | initial setup routines |
| *push.py      | add, commit, and push all changes to git repo |
| *pull.py      | synchronizes your local copy with remote copy |
