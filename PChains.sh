#!/bin/bash

#this script checks for input commands that need anonymization and then 
#automatically does proxychains in front of the command

# grab input, check if input needs anonmyzation:
# commands that need anonymization :  nmap, ping, nslookup, dig 

#while [[ command != quit ||command !=  exit ]];
while [ command ];
	do
	printf "************************************************** \n PROXYCHAINS ON"
	printf "\n for: NMAP, Ping, dig, nslookup \n type 'exit' to escape "
	printf "\n#################################################\n"
	read -a command  #read input into an array

	max=${#command[@]}

	#check the input for a command to be proxied

	for (( n=0; n<max; n++))
 		do
 		if [[ ${command[n]} = "nmap" || ${command[n]} = "ping"  || ${command[n]} = "nslookup" || ${command[n]} = "dig"  ]];
 			then
 			echo "USING PROXYCHAINS"
			eval proxychains ${command[@]} 
        		n=max+2	

		else
 		echo ${command[@]}
		eval ${command[@]}
	 	fi
	done

done

exit


