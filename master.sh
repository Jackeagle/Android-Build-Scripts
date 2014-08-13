 #Master Script For Multiple Rom Selection Optionable Which Triggers Respective Device Support List.
 #This Script Should Be Placed in Home Directory.
 
    #Copyright (C) 2014  Jackeagle

    #This program is free software: you can redistribute it and/or modify
    #it under the terms of the GNU General Public License as published by
    #the Free Software Foundation, either version 3 of the License, or
    #(at your option) any later version.

    #This program is distributed in the hope that it will be useful,
    #but WITHOUT ANY WARRANTY; without even the implied warranty of
    #MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    #GNU General Public License for more details.

    #You should have received a copy of the GNU General Public License
    #along with this program.  If not, see <http://www.gnu.org/licenses/>.


#!/bin/bash


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
	 
	








