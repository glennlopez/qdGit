<!-- https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet -->
<!-- https://stackedit.io/editor -->
<!-- http://www.emoji-cheat-sheet.com/ -->

qdGit
=================
This is a quick and dirty Git management script. Use it if you need to git things done quickly and don't care about the mess you leave behind. Somewhat reduces the time-to-market for new git users. Script not recommended during mission critical projects where bug tracking is important (like on a luner lander or any medical equipment software).

### How to use
Just run in terminal using the dot-slash expression. If you get a permission error, copy-pasta this `chmod +x gitInit.sh` into your terminal, then run it using `./gitInit.sh`.


> :paperclip: **Note:** this project is still it its development life cycle. Don't run the script without first reviewing the source files. Damages to your git repo and computer is unlikely using this script, but still... Murphy's Law.

### Script Summary

|  Name        | Description           |
| ------------- |:--------------------:|
| gitInit.sh     | initial setup for git |
| push.py      | add, commit, and push all changes to git repo |
| pull.py      | synchronizes your local copy of the git clone |
| status.py      | displays all changes made to the repo |
