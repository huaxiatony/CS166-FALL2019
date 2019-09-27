#!/usr/bin/env python
import subprocess
import datetime
import os

goDic="cd .git"
insertText__= "echo '[credential]'>>config"
insertText_="echo '    helper = store'>>config&&cd .."
os.system(goDic)
os.system(insertText__)
os.system(insertText_)

subprocess.call(["git", "add", "."])
subprocess.call(["git", "commit", "-m", "auto backup server snapshot " + str(datetime.datetime.now())])
subprocess.call(["git", "push"])
