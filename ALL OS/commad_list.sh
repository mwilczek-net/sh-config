#!/bin/bash

command=$1
RESULT=0
number_re='^[0-9]+$'

function space {
	echo
	echo "------------=========------------"
	echo
}


declare -a FUNCTIONS_NAMES
declare -a FUNCTIONS_COMMANDS

FUNCTIONS_NAMES[${#FUNCTIONS_NAMES[@]}]='ant'
FUNCTIONS_COMMANDS[${#FUNCTIONS_COMMANDS[@]}]='FUNCTION.ANT'

FUNCTIONS_NAMES[${#FUNCTIONS_NAMES[@]}]='ant all'
FUNCTIONS_COMMANDS[${#FUNCTIONS_COMMANDS[@]}]='FUNCTION.ANT_ALL'

FUNCTIONS_NAMES[${#FUNCTIONS_NAMES[@]}]='ant clean all'
FUNCTIONS_COMMANDS[${#FUNCTIONS_COMMANDS[@]}]='FUNCTION.ANT_CLEAN_ALL'

FUNCTIONS_NAMES[${#FUNCTIONS_NAMES[@]}]='grunt build'
FUNCTIONS_COMMANDS[${#FUNCTIONS_COMMANDS[@]}]='FUNCTION.GRUND_BUILD'

FUNCTIONS_NAMES[${#FUNCTIONS_NAMES[@]}]='grunt build && ant all'
FUNCTIONS_COMMANDS[${#FUNCTIONS_COMMANDS[@]}]='FUNCTION.GRUND_BUILD_AND_ANT_ALL'

FUNCTIONS_NAMES[${#FUNCTIONS_NAMES[@]}]='grunt build && ant clean all'
FUNCTIONS_COMMANDS[${#FUNCTIONS_COMMANDS[@]}]='FUNCTION.GRUND_BUILD_AND_ANT_CLEAN_ALL'


function FUNCTION.ANT {
	echo "ant"
	exit $?
}

function FUNCTION.ANT_ALL {
	echo "ant all"
	exit $?
}

function FUNCTION.ANT_CLEAN_ALL {
	echo "ant clean all"
	exit $?
}

function FUNCTION.GRUND_BUILD {
	echo "grunt build"
	exit $?
}

function FUNCTION.GRUND_BUILD_AND_ANT_ALL {
	echo "grunt build && ant all"
	exit $?
}

function FUNCTION.GRUND_BUILD_AND_ANT_CLEAN_ALL {
	echo "grunt build && ant clean all"
	exit $?
}


ARRAY_LENGTH=${#FUNCTIONS_NAMES[@]}


echo
echo "Commands: "
echo
echo "   : exit"

for i in "${!FUNCTIONS_NAMES[@]}"; do
	command_name=${FUNCTIONS_NAMES[$i]}
	echo "  $i: $command_name"
done


echo
echo -n "Your choise: "
if [ -z "$command" ]; then
	read command
else
	echo $command
fi
echo

if [ -z "$command" ]; then
	echo "no command provided"
	echo "exit"
	echo
	exit 0
fi

if ! [[ $command =~ $number_re ]]; then
	echo "no valid command provided"
	echo
	exit 1
fi

if ! [ "${command}" -lt "${ARRAY_LENGTH}" ]; then
	echo "no valid command provided - to big number"
	echo
	exit 1
fi


echo ${FUNCTIONS_NAMES[$command]}
space
${FUNCTIONS_COMMANDS[$command]}
RESULT=$?


echo
exit $RESULT

