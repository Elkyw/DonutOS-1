#!/bin/bash

clear

function cmpio {
  if [ "$1" == "devrun" ];
  then
    ls devapps
    read -p ">" appin
    ./"devapps/$appin.*"
  elif [ "$1" == "" ];
  then
    break
  else
    ./*/$input.* || python3 apps/$input.py
    #sleep 5 # for debugging
  fi
}

#main function
function main {

  while true
  do
    tput setaf 250
    select input in nodeupd devrun 2048 nodecal nodecalc nodeterm nodetxt One_Strike_And_You\'re_Out tetris
    do
      cmpio "$input"
      clear
      tput setaf 46
      echo "Welcome to DonutOS!"; echo
      tput setaf 45
      date +"%D %T"
      break
    done
  done
}

tput setaf 46
echo "Welcome to Donut 2.4 LTS!"; echo

tput setaf 45
date +"%D %T"

main