#!/bin/bash

KEY="/home/localuser/.ssh/id_rsa"
OUTSIDEPORT="22" #make sure remote host has ssh running on this port

while [ 1 ]; do

echo [*] Starting tunnel ...

/usr/bin/ssh -v -Nn -o "Port=$OUTSIDEPORT" -o "PasswordAuthentication=no" -o ServerAliveInterval=15 -i $KEY  -R localhost:5022:localhost:22 remoteuser@REMOTEHOSTNAME

# After ssh dies, we sleep 10 seconds to not "DoS" anything in case of issues 
echo [*] ...
echo [*] Sleeping 10 ...
sleep 10

done