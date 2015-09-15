<!-- https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet -->
<!-- https://stackedit.io/editor -->
<!-- http://www.emoji-cheat-sheet.com/ -->

qdGit
=================
The script will add and push all changes in one commit entry. Use it if you need to git things done quickly and don't care about the mess you leave behind.

> :paperclip: **Note:** script still in development life cycle. Don't run it without first reviewing the source files.


### How setup
Change the setup.sh permission to executable `chmod +x setup.sh`. Run a dot-slash command on `./setup.sh` to run the initial setup script.

### How to use
Place the 3 scripts in your project and do a dot-slash on push.py to push all changes to github or pull.py to synchronizes your local copy with your github repository.


### Script Summary

|  Name        | Description           |
| ------------- |:--------------------:|
| setup.sh   | initial setup routines |
| push.py      | add, commit, and push all changes to git repo |
| pull.py      | synchronizes your local copy with remote copy |
