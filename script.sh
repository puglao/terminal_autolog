#Here is the script to record all input/output in a terminal shell for troubleshoot and study in the future
#Put it in /etc/profile.d and let /etc/profile to execute the script when launching a new tty connection

#!/bin/sh

#Create Filename with date and syetem information
LOGIN=$(whoami)'@'$(hostname)
DATETIME=$(date +%Y-%m-%d_%H%M%S)
FILENAME=$LOGIN'-'$DATETIME'.log'

#Create Destination directory path
DEST=$HOME'/autolog'

#if destination directory is not exist, create a new directory at destination path
if [ ! -d $DEST ]
then
mkdir $DEST
fi

#start a new shell and record the new shell io activity with 'script' command
#when the new shell is terminated, the script process will be terminated as well
exec script -q $DEST'/'$FILENAME