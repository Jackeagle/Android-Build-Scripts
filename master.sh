#!/bin/bash
#This build script has to be kept in the home folder along with the patch folder(for i9082).


echo -e "************************************"
echo -e "*WELCOME TO ANDRIOD ROM DEVELOPMENT*"
echo -e "************************************"

OPTIONS="AICP
Spirit
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

elif [ "$opt" = "Spirit" ]; then
        echo -e "**************************"
	echo -e "*Spirit BUILD STARTING   *"
	echo -e "*			  *"
   	echo -e "**************************"

	cd spirit
	. device.sh
	
#SPIRIT BUILD STARTS


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
	 
	








