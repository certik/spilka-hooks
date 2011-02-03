#! /usr/bin/env python
import subprocess
import cgitb, cgi
import json

cgitb.enable()

print "Content-type: text/plain"
print

form = cgi.FieldStorage() 
payload = name = form.getvalue('payload')

gitInfo = json.loads(payload)

file_changed = ""
author = ""
commit_message = ""

for f in gitInfo['commits'][0]['added']:
	file_changed += "'" + f + "' "
for f in gitInfo['commits'][0]['removed']:
	file_changed += "'" + f + "' "
for f in gitInfo['commits'][0]['modified']:
	file_changed += "'" + f + "' "

author = "'" + gitInfo['commits'][0]['author']['name'] + "'"
commit_message = "'" + gitInfo['commits'][0]['message'] + "'"

cmd = 'sudo /bin/su git -c "/bin/sh update-femhub-repo.sh"'
print "Running update script."
p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE,
	stderr=subprocess.STDOUT)
output = p.stdout.read()
print output

cmd = "buildbot sendchange --branch=master --master=buildbot.hpfem.org:9994 --username=" + author + " --comments=" + commit_message + " " + file_changed
print "Sending change to buildbot"
p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE,
	stderr=subprocess.STDOUT)
output = p.stdout.read()
print output
print "  Done."

