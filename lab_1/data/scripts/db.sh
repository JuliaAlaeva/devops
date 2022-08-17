#!/bin/bash

function validateStringInput() {
	if [[ $1 =~ [^A-za-z] ]]; then
		echo "Input should contain only lattin letters"
		exit 0
	fi
}

function saveToDb() {
	echo $1, $2
}

function createDbBackup {
	echo “No backup file found”
}

function restoreDb {

}

function findUserInDB {

}

function printDb {

}

function help {
	echo "usage: ./db.sh <command> [--inverse]

	These are common commands used in various situations:

	add              Create a new user entity to the db
	backup           Create a db backup file
	restore          Restore a db from a backup file
	find             Search user by username
	list             Print all users in db
	help             See available command list"
}

case $1 in
	add)
		read -p "Please, enter your username (only lattin letters): " username
			validateStringInput $username
		read -p "Please, enter your role (only lattin letters): " $role
			validateStringInput $role
		saveToDb $username, $role ;;
	backup)
	 createDbBackup ;;
	restore)
		restoreDb ;;
	find)
		findUserInDB ;;
	list)
		printDb ;;
	help)
		help ;;
	*)
		echo "Unrecognized argument" ;;
esac
