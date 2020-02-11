#!/bin/sh

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd "${SCRIPTPATH}"

def_path="${SCRIPTPATH}/meta-dream/recipes-bsp/linux/linux-dreambox-3.14"

echo "Please enter: (1)dm900 (2)dm920"

read MACHINESPECIFIC

if [ $MACHINESPECIFIC != "dm900" -a $MACHINESPECIFIC != "dm920" ]
then
	echo -e "${RED}Not a valid answer!${NC}"
	echo -e ""
	exit 0
fi

if [ $MACHINESPECIFIC = "dm900" ]; then
        cp -pf $def_path/dm900/defconfig $def_path/defconfig
	echo "Compiling $MACHINESPECIFIC image, please wait ..."
        MACHINE=dm900 make image
elif [ $MACHINESPECIFIC = "dm920" ]; then
        cp -pf $def_path/dm920/defconfig $def_path/defconfig
	echo "Compiling $MACHINESPECIFIC image, please wait ..."
        MACHINE=dm920 make image
else
	echo "Please enter a correct choice"
fi


