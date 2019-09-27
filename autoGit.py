#!/usr/bin/env python
import subprocess
import datetime

subprocess.call(["git", "add", "."])
subprocess.call(["git", "commit", "-m", "auto backup server snapshot " + str(datetime.datetime.now())])
subprocess.call(["git", "push"])
