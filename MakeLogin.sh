#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <PasswordFile>"
    exit 1
fi

PassWord=""

UserName=""

AskPassword()
{
    read -p "password: "
    password=$REPLY
    
    read -p "confirm password: "
    if [[ $password != $REPLY || -z $password ]]; then
        echo "passwords did not match."
        return 1
    fi
    
    PassWord=$REPLY
    return 0
}

read -p "username: "
UserName=$REPLY
if [[ -z $UserName ]]; then
    UserName=`whoami`
fi

while true
do
    AskPassword
    if [[ $? -eq 0 ]]; then
        break
    fi
done

PassWordMD5=($(echo "$PassWord" | md5sum))
echo "$UserName $PassWordMD5" >> $1
