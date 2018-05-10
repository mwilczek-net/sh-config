#!/bin/bash

##
# Method extits scirpt if error. Previously logs message.
# $1 - reult that needs to be tested
# $2 - Message
##
function check-if-error {
    set +x
    if [ $1 -ne 0 ]; then
        echo ""
        echo ""
        echo "!!!!!!!!!!! ERRORR !!!!!!!!!!! ERRORR !!!!!!!!!!! ERRORR !!!!!!!!!!! ERRORR !!!!!!!!!!!"
        echo ""
        echo "${2}";
        echo ""
        echo "!!!!!!!!!!! ERRORR !!!!!!!!!!! ERRORR !!!!!!!!!!! ERRORR !!!!!!!!!!! ERRORR !!!!!!!!!!!"
        echo ""
        echo ""

        # Exit script (not only function)
        exit $1;
    fi
}

##
# Method logs if error and returns obatined status code
# $1 - reult that needs to be tested
# $2 - Message
##
function inform-if-error {
    set +x
    if [ $1 -ne 0 ]; then
        echo ""
        echo ""
        echo "!!!!!!!!!!! WARNING !!!!!!!!!!! WARNING !!!!!!!!!!! WARNING !!!!!!!!!!! WARNING !!!!!!!!!!!"
        echo ""
        echo "${2}";
        echo ""
        echo "!!!!!!!!!!! WARNING !!!!!!!!!!! WARNING !!!!!!!!!!! WARNING !!!!!!!!!!! WARNING !!!!!!!!!!!"
        echo ""
        echo ""
    fi

    # Always return given status code
    return $1;
}

###
#
# example
#
# mkdir a/b/c/d/e
# check-if-error $? "Error message"
#
###
