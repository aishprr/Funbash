#!/bin/bash

git config --global user.name "$1"
git config --global user.email "$2"

keys=$(ls -al ~/.ssh | grep *.pub)

# $? gives the return value of the last shell command
if [[ $? == 1 ]]; then
    #grep returns 1 if no line selected 
    echo "No public keys found"
    ssh-keygen -t rsa -b 4096 -C "$2"
elif [[ $? == 0 ]]; then
    echo "Public key found, go fetch that"
else 
    echo "Error occured"
fi


# Need to run ssh-agent and add this private key now to that list.
# and then copy into your clipboard and put in github 

#ssh-agent -s 
#ssh-add ~/.ssh/whateverkeyname
#xclip -sel clip < ~/.ssh/whateverkeyname

