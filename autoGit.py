#!/usr/bin/env python
import subprocess
import datetime
import time
import os

class newRepo:
	def __init__(self):
		dirpath = os.getcwd()
		insertText= "cd "+dirpath+"/.git&&echo '[credential]'>>config&&echo '    helper = store'>>config"
		os.system(insertText)
	def autopush(self):
		subprocess.call(["git", "add", "."])
		subprocess.call(["git", "commit", "-m", "auto course upload snapshot " + str(datetime.datetime.now())])
		subprocess.call(["git", "push"])
def main():
	repo = newRepo
	repo.autopush
if __name__ == '__main__':
    main()
