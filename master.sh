#!/bin/bash
#This build script has to be kept in the home folder along with the patch folder .. it will automatically navigate and apply patches and build


echo -e "Welcome To Android Rom Devleopment"


OPTIONS="AICP
Revolt
AOGP
Nameless
Quit"


PS3="Select a ROM to build  (1-5): "
select opt in $OPTIONS; 
do
    if [ "$opt" = "Quit" ]; then
     echo done
     exit
    elif [ "$opt" = "AICP" ]; then
        cd aicp
        . device.sh
    	 
#AICP BUILD ENDS
elif [ "$opt" = "Revolt" ]; then
        echo -e "**************************"
	echo -e "*Revolt BUILD STARTING*"
	echo -e "*			  *"
   	echo -e "**************************"

	cd revolt/. device.sh
	
#REVOLT BUILD ENDS


elif [ "$opt" = "AOGP" ]; then
        echo -e "*******************************"
	echo -e "*AOGP BUILD STARTING*"
	echo -e "*			       *"
   	echo -e "*******************************"

        cd aogp/. device.sh
	
elif [ "$opt" = "Nameless" ]; then
        echo -e "*******************************"
	echo -e "*Nameless BUILD STARTING*"
	echo -e "*			       *"
   	echo -e "*******************************"
        cd nameless/. device.sh

 	cd
    fi
done
	 
	








