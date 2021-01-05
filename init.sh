#!/bin/bash

echo ""
echo "PREPARING WORKSPACE..."

is_sudoer=`groups "$(id -un)" | grep -q ' sudo ' && echo 1 || echo 0`
user_id=`id -u`

if [[ $user_id == 0 ]]
then
  bash -c "./privileged_commands.sh"
  echo "Now you should run this script as unprivileged user"
else
  if [[ $is_sudoer == 1 ]]
  then
    bash -c "sudo ./privileged_commands.sh"
  else
    echo "You have not enough privileges. Run script as user with sudo privileges or root!"
  fi
  bash -c "./unprivileged_commands.sh"
fi

echo "FINISHED."