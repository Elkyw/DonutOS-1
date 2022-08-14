#!/bin/bash

# LeafOS
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

clear

#boot statement

echo "$(tput setaf 2)_    ____ ____ ____ ____ ____ "
echo "$(tput setaf 2)|    |___ |__| |___ |  | [__  "
echo "$(tput setaf 2)|___ |___ |  | |    |__| ___] "

echo; echo "$(tput setaf 2)Welcome to LeafOS!"

#translates input, displays output
function cmpio {

  if [ "$1" == "" ];
  then
    return 0
  elif [ "$1" == "update" ];
  then
    ./os/nodeupd.sh
  elif [ "$1" == "run" ];
  then
    runfunc
  elif [ "$1" == "devrun" ];
  then
    devrunfunc
  elif [ "$1" == "help" ];
  then
    cat data/help.txt; echo
  else
    echo "command \"$1\" not found"
  fi
}

#functions for commands

function runfunc {
  cat data/applist.txt; echo
  read -p ">" appin
  ./"apps/$appin.sh"
}

function devrunfunc {
  ls devapps
  read -p ">" appin
  ./"devapps/$appin.sh"
}

#main function
function main {

  while true
  do
    currentDate=`date +"%T"`
    read -p "$(tput setaf 2)leafos$(tput setaf 7):$(tput setaf 4)$currentDate$(tput setaf 7)\$ " input
    cmpio "$input"
  done

}

main