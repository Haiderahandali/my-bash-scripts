#!/usr/local/bin/bash

#--------------generating cpp file in temporary location -------------------#


myEditor=sublime 		#you can put any editor that you launch from the shell/cmd here. 

location=${HOME}/.tmp 	# you can change the location if you want.

chars=abcdefghijklmnbvczxqwer91231tyyuiopQAZXSWEDCVFRTGBNHYU099287123JM1234 # Random character to pick from


if [[ $# -eq 1 ]]; then    # if the user provided a name, use that name
	ranName="$1"
else

	ranName="${chars:RANDOM%${#chars}:8}.cpp"
fi


cd ${HOME};
if [[ -d .tmp ]]; then
	cd .tmp;
else
	mkdir .tmp
	cd .tmp
fi
touch $ranName;


$myEditor $ranName

