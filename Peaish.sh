#!/bin/bash

#Things To DO.....
#NEED TO ADD MULTITHREADING!
#Format Output Text

function ipp()
{
ip a | grep "scope" | grep -v "127.0.0.1" | grep "brd"  | grep -Po '(?<=inet) [\d.]+' | sed 's/\.[0-9]*$//' > ip.txt 
cat ip.txt
return
}

function dpipe()
{
#https://github.com/basharkey/CVE-2022-0847-dirty-pipe-checker (NOT my code but very helpful)
kernel=$1
ver1=$(echo ${kernel:-$(uname -r | cut -d '-' -f1)} | cut -d '.' -f1)
ver2=$(echo ${kernel:-$(uname -r | cut -d '-' -f1)} | cut -d '.' -f2)
ver3=$(echo ${kernel:-$(uname -r | cut -d '-' -f1)} | cut -d '.' -f3)
echo $ver1 $ver2 $ver3

if (( ${ver1:-0} < 5 )) ||
   (( ${ver1:-0} == 5 && ${ver2:-0} < 8 )) ||
   (( ${ver1:-0} == 5 && ${ver2:-0} == 10 && ${ver3:-0} == 102 )) ||
   (( ${ver1:-0} == 5 && ${ver2:-0} == 10 && ${ver3:-0} == 92 )) ||
   (( ${ver1:-0} == 5 && ${ver2:-0} == 15 && ${ver3:-0} == 25 )) ||
   (( ${ver1:-0} == 5 && ${ver2:-0} >= 16 && ${ver3:-0} >= 11 )) ||
   (( ${ver1:-0} == 5 && ${ver2:-0} > 16 ));
then
    echo Not vulnerable
else
    echo Vulnerable
fi

rm ip.txt
echo "$(tput setaf 0)$(tput setab 2)"
  echo "              ####  ##### #####        ###### ##### #   #                "
  echo "              #   # #     #   #          ##   #     #   #                "
  echo "              ####  ##### ##### ======   ##   ##### #####                "
  echo "              #     #     #   #          ##       # #   #                "
  echo "              #     ##### #   #        ###### ##### #   #                "
  echo "$(tput sgr 0)"
  exit
}

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
  echo "|                 Lean, Green, Mean Enumerateeeeeen                     | "
  echo "------------------------------------------------------------------------- "
  echo "$(tput setaf 0)$(tput setab 2)"
  echo "######################################################################### "
  echo "#./Peaish.sh -h or --help                   Display Help Text           # "
  echo "#./Peaish.sh -o or --output (filename)      Writes Output To File       # "
  echo "#./Peaish.sh -v or --verbose                Verbose Mode                # "
  echo "#                                                                       # "
  echo "# example:                                                              # "
  echo "#         ./Peaish.sh -v                                                # "
  echo "#########################################################################$(tput sgr 0)"

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
  echo "|                 Lean, Green, Mean Enumerateeeeeen                     | "
  echo "------------------------------------------------------------------------- "
  echo "$(tput setaf 0)$(tput setab 2)"
  echo "######################################################################### "
  echo "#./Peaish.sh -h or --help                   Display Help Text           # "
  echo "#./Peaish.sh -o or --output (filename)      Writes Output To File       # "
  echo "#./Peaish.sh -v or --verbose                Verbose Mode                # "
  echo "#                                                                       # "
  echo "# example:                                                              # "
  echo "#         ./Peaish.sh -v                                                # "
  echo "#########################################################################  $(tput sgr 0)"

  echo ""
  printf "Writing Results To "$filename". Be Patient!"
  read IP < ip.txt
  for i in {1..254} ;do ping -c 1 $IP.$i | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" & done >> $filename
  echo "#####################################################################################" >> "$filename"
  uname -r >> "$filename"
  echo "#####################################################################################" >> "$filename"
  whoami && id >> "$filename"
  echo "#####################################################################################" >> "$filename"
  find / -perm -u=s -type f 2>/dev/null >> "$filename"
  echo "#####################################################################################" >> "$filename"
  awk -F/ '$NF != "nologin"' /etc/passwd >> "$filename"
  echo "#####################################################################################" >> "$filename"
  ps aux >> "$filename" 
  echo "#####################################################################################" >> "$filename"
  sudo -V >> "$filename" 
  echo "#####################################################################################" >> "$filename"
  mysql -V>> "$filename" 
  echo "#####################################################################################" >> "$filename"
  httpd -v >> "$filename" 
  echo "#####################################################################################" >> "$filename"
  dpipe >> "$filename" 
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
  echo "|                 Lean, Green, Mean Enumerateeeeeen                     | "
  echo "------------------------------------------------------------------------- "
  echo "$(tput setaf 0)$(tput setab 2)"
  echo "######################################################################### "
  echo "#./Peaish.sh -h or --help                   Display Help Text           # "
  echo "#./Peaish.sh -o or --output (filename)      Writes Output To File       # "
  echo "#./Peaish.sh -v or --verbose                Verbose Mode                # "
  echo "#                                                                       # "
  echo "# example:                                                              # "
  echo "#         ./Peaish.sh -v                                                # "
  echo "######################################################################### $(tput sgr 0)"

  echo ""
 
echo "$(tput setaf 4)$(tput setab 2)                                                $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        ~~~~          V1.2           ~~~~       $(tput sgr 0)"
echo "$(tput setaf 4)$(tput setab 2)                                                $(tput sgr 0)"


echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        ####    Ping Network Scan    ####       $(tput sgr 0)"
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"

#Add Port Scan For All Found IPs
read IP < ip.txt
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
whoami && id

echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        #########Whos Logged In?#########       $(tput sgr 0)"
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
w
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        ##########Grabbing SUIDs#########       $(tput sgr 0)"
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
#ls -la /usr/bin/
echo "Thinking................."
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

<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        ######       Versions      ######       $(tput sgr 0)"
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        ######     Sudo Version    ######       $(tput sgr 0)"
sudo -V
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        ######    Mysql Version    ######       $(tput sgr 0)"
mysql -V
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        ######    Apache Version   ######       $(tput sgr 0)"
httpd -v

echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
echo "$(tput setaf 0)$(tput setab 4)        ########   Dirty Pipe?   ########       $(tput sgr 0)"
echo "$(tput setaf 4)$(tput setab 2)        #################################       $(tput sgr 0)"
#Not My Code But Useful
dpipe
echo ""
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
      filename=$2
      shift
      ipp
      to_file
      ;;
    --verbose|-v)
      shift
      ipp
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

