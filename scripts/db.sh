#!/bin/bash

db_folder="$(dirname $(pwd))/data"
db_file_name="users.db"
db_src="$db_folder/$db_file_name"
backup_extension="backup"

function validateInput() {
	if ! [[ $1 =~ ^[A-Za-z_]+$ ]]
		then echo "Input must be a Latin letters only"
		exit 0
	fi
}

function createUser() {
	read -p "Enter user name: " user_name
	validateInput $user_name

	read -p "Enter user role: " user_role
	validateInput $user_role

	echo "$user_name, $user_role" >> "$db_src"
}

function checkDbExistance() {
	if [ -f "$db_src" ]
		then
			$1
		else
			read -p "users.db does not exists. Do you want to create it? (y/n): " choise
			case "$choise" in
				y|Y)
					> "$db_src"
					$1
					exit;;
				n|N)
					exit;;
				*)
					echo "Selection not valid!"
					exit;;
			esac
	fi
}

function createBackup() {
	cp "$db_src" "$db_folder/$(date +%F_%H-%M-%S)-$db_file_name.$backup_extension"
}

function restore() {
	latest_file=$(ls -t1 "$db_folder" | sort -rn | head -n1)


	if ! [[ "$latest_file" == *"$backup_extension"* ]]
		then echo "No backup file found"
		exit 0
	fi

	checkDbExistance

	cp "$db_folder/$latest_file" "$db_src"
}

function find() {
	checkDbExistance

	read -p "Enter username: " user_name
	user_list=$(grep -w "^$user_name" "$db_src")
	if [ "$user_list" ]
		then echo "$user_list"
		else echo "User not found"
	fi
}

function list() {
	checkDbExistance

	IFS=$'\n' read -d '' -r -a lines < "$db_src"

	if [[ $1 == "inverse" ]]
		then
			for((i=${#lines[@]}-1;i>=0;i--))
				do
				echo "$i. ${lines[i]}"
			done
		else
			for((i=0;i<=${#lines[@]}-1;i++))
				do
				echo "$i. ${lines[i]}"
			done
	fi
}

function printHelp() {
	echo "Script for working with database"
	echo "options:"
	echo "add		Adds new user to the database. Accepts Latin letters only."
	echo "backup		Creates backup file in the database directiry"
	echo "restore		Takes the latest backup file and repalce database file"
	echo "find		Performs user searching by username"
	echo "list [inverse]	Prints content of database in ordered list. [inverse] ptints content in opposite order."
}

case "$1" in
	"" | help)
		printHelp
		exit;;
	add)
		checkDbExistance createUser
		exit;;
	backup)
		checkDbExistance createBackup
		exit;;
	restore)
		restore
		exit;;
	find)
		find
		exit;;
	list)
		list $2
esac
