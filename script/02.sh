#!/bin/bash

read -p "user to delete: " USER
read -p "also delete $USER homefolder? (y/n): " DELHOME
echo "unloging and deleting $USER..."

if [ -z "$(pgrep -u $USER)" ]; then
	echo "..."
else
	while read PROC; do
		sudo kill -9 $PROC
	done < $(pgrep -u $USER)
fi
sudo userdel $USER
if [ $DELHOME = "y" ]; then
sudo rm -rf /home/$USER
fi
