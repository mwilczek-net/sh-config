#!/bin/bash

# Script for automating process of creating databases in MySQL

# array of commands
declare -a COMMANDS

USER_NAME=root
USER_PASSWORD=root

print_help() {
	echo 'Script for automating process of creating databases in MySQL';
	echo 'Parameters: [h]|[l]|[c|d|t|f databasename][u username][p userpassword]';
	echo;
	echo 'h - help';
	echo;
	echo 'l - list databases';
	echo 'c databasename - create database `databasename`';
	echo 'd databasename - drop database `databasename`';
	echo 't databasename - truncate (drop and create)';
	echo 'f databasename - find: SHOW DATABASES LIKE `databasename`;';
	echo;
	echo 'u username - name used as user name for myslq (default root)';
	echo 'p userpassword - password used as user password for myslq (default root)';
	echo;
	exit 1;
}

echo_all_commands() {
	for i in "${!COMMANDS[@]}"; do
		sql_command=${COMMANDS[$i]}
		echo $sql_command
	done
}


while getopts "c:d:t:f:u:p:hl" optname
do
	case "$optname" in
		"c")
			COMMANDS+=('create database `'$OPTARG'`;')
			;;
		"d")
			COMMANDS+=('drop database `'$OPTARG'`;')
			;;
		"t")
			COMMANDS+=('drop database if exists `'$OPTARG'`; create database `'$OPTARG'`;')
			;;
		"l")
			COMMANDS+=('show databases;')
			;;
		"f")
			COMMANDS+=('show databases like "'$OPTARG'";')
			;;
		"u")
			USER_NAME=$OPTARG
			;;
		"p")
			USER_PASSWORD=$OPTARG
			;;
		"h")
			print_help;
			;;
		*)
			print_help;
			;;
	esac
done

# if no commands
if [ -z "$COMMANDS" ]; then
	print_help;
fi

echo_all_commands
echo;
echo "------------=========------------"
echo;
echo_all_commands | mysql -u$USER_NAME -p$USER_PASSWORD
exit $?;


