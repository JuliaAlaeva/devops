#!/bin/bash

fileName=users.db
fileDir=../data
filePath=$fileDir/$fileName

function validateStringInput() {
	if [[ $1 =~ ^[A-Za-z_]+$ ]]; then
		echo "Input should contain only lattin letters"
		exit 0
	fi
}

function addUserToDb() {
	read -p "Please, enter your username (only lattin letters): " username
		validateStringInput $username
	read -p "Please, enter your role (only lattin letters): " $role
		validateStringInput $role
	echo "${username}, ${role}" | tee -a $filePath
}

function createDbBackup {
	if [[ -e $filePath ]]; then
		backupFileName=$(date +'%Y-%m-%d-%H-%M-%S')-${fileName}.backup
		cp $filePath $fileDir/$backupFileName
		echo "Backup with name ${backupFileName} has been created created."
	else
    	echo "Db file doesn't exist"
	fi
}

function restoreDb {
	latestBackupFile=$(ls $fileDir/*-$fileName.backup | tail -n 1)

	if [[ -z $latestBackupFile ]]; then
		cat $latestBackupFile > $filePath
		echo "Backup is restored"
	else
		echo "Backup file doesn't exist"
	fi
}

function findUserInDB {
	read -p "Enter username to search: " username
	result=$(grep -i username filePath)

	if [[ -z result ]]; then
		echo "User with username: ${username} was found"
	else
		echo "User with username: ${username} was not found"
	fi
}

function printDb {
	if [[ $2 == "inverse" ]]; then
      cat --number $filePath | tac
    else
      cat --number $filePath
    fi
}

function help {
	echo "Manages users in db.
	
	Syntax: db.sh <command> [--inverse]

	These are common commands used in various situations:

	add              Create a new user entity to the db
	backup           Create a db backup file
	restore          Restore a db from a backup file
	find             Search user by username
	list             Print all users in db
	help             See available command list"
}

case $1 in
	add) addUserToDb ;;
	backup) createDbBackup ;;
	restore) restoreDb ;;
	find) findUserInDB ;;
	list) printDb ;;
	help | '' | *)  help ;;
esac
