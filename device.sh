#This Script Should Be Placed In Rom Directory

echo -e "*>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<*"
echo -e "*     Welcome To AICP Rom Development   *"
echo -e "*>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<*"
OPTIONS="I9082
falcon
Quit"


PS3="Select a Device to build  (1-3): "
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
	
        #these copy normal patches reqd to boot the device and core functions to work
	cp -r ~/patch/audiovideo.diff ~/aicp/frameworks/av
	cp -r ~/patch/bluetooth.diff ~/aicp/hardware/broadcom/libbt
	cp -r ~/patch/hwc.diff ~/aicp/frameworks/native
	cp -r ~/patch/webview.diff ~/aicp/external/chromium_org
	cp -r ~/patch/ril.diff ~/aicp/system/core



	echo -e " patches copied ... pleaser review to check for any errors "
	read -p " PRESS ENTER TO START APPLYING THE PATCHES "

	echo -e ""
	echo -e " Applying Patches for Galaxy Grand Duos "
	echo -e ""

	# Bluetooth Patch
	echo -e ""
	echo -e " APPLYING BLUETOOTH PATCH "
	echo -e ""
	cd hardware/broadcom/libbt
	git checkout .
	patch -p1 < bluetooth.diff
	cd ../../../
	echo -e " BLUETOOTH PATCH APPLIED SUCCESSFULLY "
	echo -e ""

	# HW Composer Patch 
	echo -e ""
	echo -e " APPLYING HWC PATCH "
	cd frameworks/native
	git checkout .
	patch -p1 < hwc.diff

	echo -e ""
	echo -e " HWC PATCHES APPLIED SUCCESSFULLY"
	echo -e ""

	# AUDIO/VIDEO PATCHES 
	echo -e ""
	echo -e " APPLYING A/V PATCHES"
	echo -e ""
	cd ../av
	git checkout .
	patch -p1 < audiovideo.diff 
	echo -e ""
	echo -e " AUDIO/VIDEO PATCHES APPLIED SUCCESSFULLY "

	# WEBVIEW PATCHES 
	echo -e ""
	echo -e " APPLYING WEBVIEW PATCH "
	echo -e ""
	cd ../../
	cd external/chromium_org
	git checkout .
	patch -p1 < webview.diff
	echo -e ""
	echo -e " WEBVIEW PATCHES APPLIED SUCCESSFULLY"

	# ACTUAL BUILD 
	echo -e ""
	echo -e " ALL BASIC PATCHES APPLIED SUCCESSFULLY , NOW BUILDING! "
	echo -e ""
	cd ../../

	
	. build/envsetup.sh && brunch i9082
        cd
#I9082 Build Ends 

     elif [ "$opt" = "falcon" ]; then
        echo -e "*********************************"
	echo -e "*AICP Build For Falcon Starting *"
	echo -e "*			         *"
   	echo -e "*********************************"
        
       . build/envsetup.sh && brunch i9082
       cd ../
       
    fi
done
	 
