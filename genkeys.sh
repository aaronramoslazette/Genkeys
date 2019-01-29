# Execute script using ./genkeys
# If you receive a "Permission denied error, try running the following command:"
#       chmod 500 ./genkeys

#!/bin/bash

echo "#########################################################################"
echo "################################# GENKEYS ################################"
echo "#########################################################################"

printf "\n"
echo -e "\e[3mA Github SSH Key Automation tool by Aaron Ramos-Lazette\e[0m"
printf "\n\nPlease enter the email associated with your Github account:\n"

read email

printf "\n\nSSH Key is about to be generated."
printf "\nWhen prompted, press ENTER to use the default settings.\n\n"

ssh-keygen -t rsa -b 4096 -C $email
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

printf "\n\nInstalling the xclip tool to assist in retrieving your new key."
printf "\nPlease enter your user credentials when prompted.\n\n"
$(sudo apt-get install xclip) #&> /dev/null/
$(xclip -sel clip < ~/.ssh/id_rsa.pub) #&> /dev/null/

printf "\n\nYour new ssh key has been added to your clipboard."
printf "\nLogin to your Github account and visit https://github.com/settings/ssh/new"
printf "and paste this new key."
printf "\nPress ENTER once this step is complete."

printf "\nYou should now be ready to clone and push to private repos."
