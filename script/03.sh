#!/bin/bash
#a simple backup script

#default backup source and destination
SRC_BACKUP_DEF="/home/quentin/Documents"
DST_BACKUP_DEF="/home/quentin/backup"

#prompting user for custom backup source and destination
echo "BACKUP TOOL"
read -p "full path of the directory to backup? (default is /home/quentin/Documents): " SRC_BACKUP_SET
read -p "full path of the backup destination? (default is /home/quentin/backup): " DST_BACKUP_SET
if [ -z "$SRC_BACKUP_SET" ]; then
	SRC_BACKUP=$SRC_BACKUP_DEF
else
	SRC_BACKUP=$SRC_BACKUP_SET
fi

if [ -z "$DST_BACKUP_SET" ]; then
	DST_BACKUP=$DST_BACKUP_DEF
else
	DST_BACKUP=$DST_BACKUP_SET
fi

#create filename and make the backup
echo "creating the archive.."
NAME="$(date +%Y-%m-%d)_$(hostname)_backup.tar.bz2"
sudo tar -cjvf - ${SRC_BACKUP}/* > ${DST_BACKUP}/${NAME}
if [ -f "${DST_BACKUP}/${NAME}" ]; then
	echo "..done! :)"
else
	echo "something went wrong! :("
fi
