
#!/bin/bash

# Set the freshly created repo to the origin and push
git init
git add .
git commit -am "first commit"
git remote add origin https://github.com/daspanel/rsyslogd-server.git
git push -u origin master

