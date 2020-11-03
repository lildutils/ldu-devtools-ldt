#!/bin/bash

echo "===== Deploy - WWW ====="
echo "INF: starting..."

backupFolder=/home/backup/www/$(date +"%Y%m%d%H%M%S")
frontendFolder=/home/tmp/www
wwwFolder=/var/www/html

echo "INF: backup..."
mkdir $backupFolder
cp -R $wwwFolder/* -t $backupFolder

echo "INF: deploy..."
rm -rf $wwwFolder/*
cp -R $frontendFolder/* -t $wwwFolder
chmod -R 755 $wwwFolder/*

echo "INF: done!"
