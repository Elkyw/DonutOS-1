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


date +"%D %T"
tput cup 1 0
cat data/applist.txt
tput cup 1 0

cursor=1

#keyboard input
function key_react {
  let change=0
  read -d '' -sn 1
  test "$REPLY" = "$ESC" && {
    read -d '' -sn 1 -t1
    test "$REPLY" = "[" && {
      read -d '' -sn 1 -t1
      case $REPLY in
        
      esac
    }
  } || {
    case $REPLY in
      1) let "cursor--"; movecursor "$cursor";;
      2) let "cursor++"; movecursor "$cursor";;
      3) ./os/cmpio.sh "$cursor";;
    esac
  }
}

function key_input {
  read -d '' -sn 1
  case $REPLY in
    1) let "cursor--"; movecursor "$cursor";;
    2) let "cursor++"; movecursor "$cursor";;
    3) ./os/cmpio.sh "$cursor";;
  esac
}

function movecursor {
  tput cup $1 0
}

#main function
function main {

  while true
  do
    key_input
    clear
    tput cup 1 0
    cat data/applist.txt
    tput cup 0 0
    currentDate=`date +"%D %T"`
    echo "$currentDate"
    tput cup $cursor 0
  done

}

main
