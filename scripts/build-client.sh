#!/bin/bash

client_folder="$(dirname $(pwd))/client"
client_static_folder="$(dirname $(pwd))/static"
client_backup_file_name="client-app.zip"
client_backup_file="$client_static_folder/$client_backup_file_name"

if ! command -v "zip" &> /dev/null
	then echo "zip can not be foud. please run 'sudo apt-get install zip'"
	exit
fi

if [ -f "$client_backup_file" ]
	then rm "$client_backup_file"
fi

cd "$client_folder" && ENV_CONFIGURATION=${ENV_CONFIGURATION} npm run build:prod

cd "$client_static_folder" && zip -r "$client_backup_file_name" "$client_static_folder"
