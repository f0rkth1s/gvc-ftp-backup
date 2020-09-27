#!/bin/bash
### FTP login credentials below ###
FTPU="xxxxxxx"
FTPP="xxxxxxxxxx"
FTPS="ftp.xxxxxxxxxxx.xxxxxx.co.uk" 
NOW=$(date +"%d-%m-%Y")
### local directory to backup to ###
cd /share/media/Backups/GVC/weeklyBackups
mkdir $NOW
cd $NOW
### Login to remote server ###
### Perform a mirror of the public_html directory ###
lftp -u $FTPU,$FTPP -e "set ssl:verify-certificate no;mirror /public_html /share/media/Backups/GVC/weeklyBackups/$NOW;quit" $FTPS
cd /share/media/Backups/GVC/weeklyBackups
tar -czf $NOW.tar.gz /share/media/Backups/GVC/weeklyBackups/$NOW
rm -rf $NOW
