#!/bin/bash
# Function: Caesar Cipher Cryptography or ROT13 Algorithm for cipher & decipher
# Run option 1: User can provide command line argument (text only) and perform cipher & decipher
# Run option 2: User just run the cc.sh file without any argument.
# Author: Khondakar
# Date: 10/Sep/2020


# Accept user argument text/words from command line
echo -e "\e[30;48;5;214m\e[1m            WELCOME TO CIPHER & DECIPHER TOOL         \e[0m"
echo "User input text : " $@ 		# All the arguments are individually double quoted


# If user argument more than one
if [ $# -gt 0 ] 
then
	# Case-sensitive version of ROT13
	cipherCode=$(echo "$@" | tr '[A-Za-z]' '[N-ZA-Mn-za-m]')
	echo "Your cipher code : " $cipherCode

	# User input for cipher code
	echo -n -e "\nEnter cipher code here to decipher : "
	read cipherCode

	# Display original text using decipher
	decipherCode=$(echo "$cipherCode" | tr '[N-ZA-Mn-za-m]' '[A-Za-z]')
	echo "Your decipher text : " $decipherCode
		
		
# If user argument empty
elif [ $# -eq 0 ]
then
	
	# No control + c allowed
	trap '' 2 

	# Function:
	ROT13(){
		# ----------- ROT13 Algorithm or Rotate by 13 places -------------
		# ROT13 ("rotate by 13 places", sometimes hyphenated ROT-13) is a simple letter substitution cipher 
		# that replaces a letter with the 13th letter after it, in the alphabet. 
		# ROT13 is a special case of the Caesar cipher which was developed in ancient Rome.
			
		# User input for text
		echo -e "\e[30;48;5;214m\e[1m            WELCOME TO ROT13 ALGORITHM                   \e[0m"
		echo -n -e "Enter texts that you want to cipher : "
		read userInput

		# ROT13 process to cipher (i.e.) Rotate by 13 places
		cipherCode=$(echo "$userInput" | tr '[A-Za-z]' '[N-ZA-Mn-za-m]')
		echo "Your cipher code =" $cipherCode

		# User input for cipher code
		echo -n -e "\nEnter the cipher code here to decipher : "
		read cipherCode

		# Display original text using decipher
		decipherCode=$(echo "$cipherCode" | tr '[N-ZA-Mn-za-m]' '[A-Za-z]')
		echo "Your decipher info = " $decipherCode
	}
	
	# Function:
	CaesarCipher(){
		# ----------- Caesar Cipher Cryptography ----------------
		# Caesar cipher using a left rotation of 3 places, equivalent to a right shift of 23 from English alphabet 
		# (the shift parameter is used as the key)
		# Plain:    ABCDEFGHIJKLMNOPQRSTUVWXYZ
		# Cipher:   XYZABCDEFGHIJKLMNOPQRSTUVW

		# User input for text
		echo -e "\e[30;48;5;214m\e[1m            WELCOME TO CAESAR CIPHER                     \e[0m"
		echo -n -e "Enter texts that you want to cipher : "
		read userInput

		# Using Caesar Cipher i.e. left shift of 3
		cipherCode=$(echo "$userInput" | tr '[A-Z]' '[X-ZA-W]')
		echo "Your cipher code =" $cipherCode

		# User input for cipher code
		echo -n -e "\nEnter the cipher code here to decipher : "
		read cipherCode

		# Display original text using decipher
		decipherCode=$(echo "$cipherCode" | tr '[X-ZA-W]' '[A-Z]')
		echo "Your decipher info = " $decipherCode
	}

	while true
	do
	  	clear 	# clear screen for each loop of menu
	  	echo -e "\e[30;48;5;240m                                                         \e[0m" # Grey Line	
		echo -e "\e[30;48;5;214m                       [M E N U]                         \e[0m"
	  	echo -e "\e[30;48;5;214m\e[1m               BASIC CIPHER & DECIPHER TOOL              \e[0m" 
		echo -e "\e[30;48;5;214m                                                         \e[0m"  	
		echo -e "\e[30;48;5;240m                                                         \e[0m" # Grey Line
	  	echo -e "\e[30;48;5;214m\e[1mCHOOSE FROM THE BELOW OPTIONS:                           \e[0m" 
		echo -e "\e[30;48;5;214m                                                         \e[0m"
		echo -e "\e[30;48;5;214m[1] ROT13 Algorithm (Rotate by 13 places).               \e[0m" 
	  	echo -e "\e[30;48;5;214m[2] Caesar Cipher.                                       \e[0m"
		echo -e "\e[30;48;5;214m[3] Exit or Quit.                                        \e[0m"
		echo -e "\e[30;48;5;214m                                                         \e[0m"	
		echo -e "\e[30;48;5;240m                                                         \e[0m" # Grey Line	
		echo -n -e "\e[96mPlease select number and press <ENTER> key :  " 
	 	read selection  
		echo -e "\e[30;48;5;240m                                                         \e[0m" # Grey Line 	
		case "$selection" in
	   		1) ROT13 ;;	# Call the CaesarCipher function
	   		2) CaesarCipher;;		# Call the ROT13 function
			3) exit ;;		# Exit from the Main Menu
	  	esac
	  	echo -e "\e[31mPress the <ENTER> key to continue.."
	  	read input 	# This cause a pause so we can read the output
	  		   	# of the selection before the loop clear the screen
	done
fi
