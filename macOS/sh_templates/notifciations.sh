#!/bin/sh

# In case of any problem with displaying notifications, make sure that:
# * 'Terminal' has permissions to do so.
# * Do not disturb mode, or any other silencer are off.
#
# If still notifications are not displayed, try to run the osascritp commands directly form treminal to see any errors.
#
# But, if no errors and notifications still desn't work, then:
# * Open "Script Editor" app.
# * Paste `display notification "Hello from editor" with title "Hello!"`.
# * Run it (not debug, just run).
# MacOS should ask you for permissions for "Script Editor" to display notifications. Then it should work from terminal as well.
# https://forum.latenightsw.com/t/trying-to-use-terminal-for-display-notification/5068?u=dirk
#
# Sometimes notifiaction can be broken. To fix, first restart computer.
# If it doesn't help, try to reset notification settings:
# delete "~/Library/Group Containers/group.com.apple.usernotifications/"


# Display notification
osascript -e 'display notification "Message" with title "Title" subtitle "Subtitle" sound name "Submarine"'

# Ask user for decision
osascript -e 'display dialog "Request for default decision" with title "Descion needed"' && echo "Action for Ok" || echo "Action for Cancel"
osascript -e 'display dialog "Request for configurable decision" with title "Descion needed" buttons {"Cancel", "Proceed"} default button "Proceed"' && echo "Action for Proceed" || echo "Action for Cancel"

decision=$(osascript -e 'display dialog "Request for multiple choices" with title "Descion needed" buttons {"Cancel", "Proceed", "Maybe"} default button "Proceed"')
echo "Full decision output: ${decision}. Return code: ${?}"

# Ask to pick item from list
picked_item=$(osascript -e 'choose from list {"Option 1", "Option 2", "Option 3", "Option 4", "Option 5"} with title "Pick an option" with prompt "Please pick one of the following options:" default items {"Option 2"}')
echo "Picked item: ${picked_item}"