#Android Multiple Device Supportable Rom Build Script With Selective Options.

#patches are only for Samsung Galaxy Grand Duos GT-I9082 Only.
    
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


#This Script Should Be Placed In AICP Rom Directory
#if you want to add your devices replace the device option and make appropriate changes to your devices.

#This Script Should Be Placed In Rom Directory

echo -e "*>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<*"
echo -e "*     Welcome To AICP Rom Development   *"
echo -e "*>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<*"
OPTIONS="I9082
falcon
Quit"


PS3="Select a Device to build  (1-2): "
select opt in $OPTIONS; 
do
    if [ "$opt" = "Quit" ]; then
     echo done
     exit
    elif [ "$opt" = "I9082" ]; then
    	echo -e "*******************************"
	echo -e "*AICP BUILD For I9082 STARTING*"
	echo -e "*			       *"
   	echo -e "*******************************"
	repo sync -j50
        . build/envsetup.sh && brunch i9082
        cd 
        
        #these copy normal patches reqd to boot the device and core functions to work
	cp -r ~/patch/audiovideo.diff ~/aicp/frameworks/av
	cp -r ~/patch/bluetooth.diff ~/aicp/hardware/broadcom/libbt
	cp -r ~/patch/hwc.diff ~/aicp/frameworks/native
	cp -r ~/patch/webview.diff ~/aicp/external/chromium_org
	cp -r ~/patch/ril.diff ~/aicp/system/core



	echo -e " patches copied ... pleaser review to check for any errors "
	read -p " PRESS ENTER TO START APPLYING THE PATCHES "

	echo -e "#########################################"
	echo -e " Applying Patches for Galaxy Grand Duos #"
	echo -e "#########################################"

	# Bluetooth Patch
	echo -e ""
	echo -e " APPLYING BLUETOOTH PATCH "
	echo -e ""
	cd aicp/hardware/broadcom/libbt
	git checkout .
	patch -p1 < bluetooth.diff
	cd ../../../../
        
        echo -e "****************************************"
	echo -e "* BLUETOOTH PATCH APPLIED SUCCESSFULLY *"
	echo -e "****************************************"

	# HW Composer Patch 
	echo -e ""
	echo -e " APPLYING HWC PATCH "
	cd aicp/frameworks/native
	git checkout .
	patch -p1 < hwc.diff
        cd ../../../
	echo -e ""
	echo -e " HWC PATCHES APPLIED SUCCESSFULLY"
	echo -e ""

	# AUDIO/VIDEO PATCHES 
	echo -e ""
	echo -e " APPLYING A/V PATCHES"
	echo -e ""
	cd aicp/frameworks/av
	git checkout .
	patch -p1 < audiovideo.diff 
        cd ../../../
	echo -e ""
	echo -e " AUDIO/VIDEO PATCHES APPLIED SUCCESSFULLY "

	# WEBVIEW PATCHES 
	echo -e "##########################"
	echo -e "# APPLYING WEBVIEW PATCH #"
	echo -e "##########################"
	cd aicp/external/chromium_org
	git checkout .
	patch -p1 < webview.diff
        cd ../../
	echo -e ""
	echo -e " WEBVIEW PATCHES APPLIED SUCCESSFULLY"

	# ACTUAL BUILD 
	echo -e ""
	echo -e " ALL BASIC PATCHES APPLIED SUCCESSFULLY , NOW BUILDING! "
	echo -e ""
	

	
	. build/envsetup.sh && brunch i9082
        cd

#I9082 Build Ends 

     elif [ "$opt" = "falcon" ]; then
        echo -e "*********************************"
	echo -e "*AICP Build For Falcon Starting *"
	echo -e "*			         *"
   	echo -e "*********************************"
        repo sync
       . build/envsetup.sh && brunch falcon
       cd ../
       
    fi
done
	 
