#!/bin/bash
#This build script has to be kept in the home folder along with the patch folder(for i9082).


echo -e "************************************"
echo -e "*WELCOME TO ANDRIOD ROM DEVELOPMENT*"
echo -e "************************************"

OPTIONS="AICP
Revolt
AOGP
Nameless
Quit"


PS3="Select a ROM You Want To Build  (1-5): "
select opt in $OPTIONS; 
do
    if [ "$opt" = "Quit" ]; then
     echo done
     exit
    elif [ "$opt" = "AICP" ]; then
        cd aicp
        . device.sh
    	 
#AICP BUILD STARTS    	 

elif [ "$opt" = "Revolt" ]; then
        echo -e "**************************"
	echo -e "*Revolt BUILD STARTING*"
	echo -e "*			  *"
   	echo -e "**************************"

	cd revolt/. device.sh
	
#REVOLT BUILD STARTS


elif [ "$opt" = "AOGP" ]; then
        echo -e "*******************************"
	echo -e "*AOGP BUILD STARTING*"
	echo -e "*			       *"
   	echo -e "*******************************"

        cd aogp/. device.sh

#AOGP BUILD STARTS
	
elif [ "$opt" = "Nameless" ]; then
        echo -e "*******************************"
	echo -e "*Nameless BUILD STARTING*"
	echo -e "*			       *"
   	echo -e "*******************************"
        cd nameless/. device.sh

 	cd
    fi
done
	 
	








