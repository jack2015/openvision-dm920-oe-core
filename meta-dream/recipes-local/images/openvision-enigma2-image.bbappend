IMAGE_INSTALL_remove = "distro-feed-configs"

IMAGE_INSTALL_append += " \
	bitratecalc \
	"

ENIGMA2_PLUGINS = " \
	enigma2-plugin-extensions-audiosync \
	enigma2-plugin-extensions-autobackup \
	enigma2-plugin-extensions-backupsuite \
	enigma2-plugin-extensions-blurayplayer \
	enigma2-plugin-extensions-cutlisteditor \
	enigma2-plugin-extensions-cacheflush \
	enigma2-plugin-extensions-epgimport \
	enigma2-plugin-extensions-dvdplayer \
	enigma2-plugin-extensions-filecommander \
	enigma2-plugin-extensions-graphmultiepg \
	enigma2-plugin-extensions-mediaplayer \
	enigma2-plugin-extensions-mediascanner \
	enigma2-plugin-extensions-moviecut \
	enigma2-plugin-extensions-openwebif \
	enigma2-plugin-extensions-oscamstatus \
	enigma2-plugin-extensions-pictureplayer \
	enigma2-plugin-extensions-ppanel \
	enigma2-plugin-extensions-systemtools \
	enigma2-plugin-extensions-tmbd \
	${@bb.utils.contains_any("MACHINE", "dm900 dm920", "enigma2-plugin-extensions-youtube", "", d)} \
	${@bb.utils.contains("MACHINE", "dm900", "enigma2-plugin-softcams-oscam-dm900", "", d)} \
	${@bb.utils.contains("MACHINE", "dm920", "enigma2-plugin-softcams-oscam-dm920", "", d)} \
	\
	enigma2-plugin-systemplugins-cablescan \
	enigma2-plugin-systemplugins-fastscan \
	enigma2-plugin-systemplugins-mphelp \
	enigma2-plugin-systemplugins-hdmicec \
	enigma2-plugin-systemplugins-hotplug \
	enigma2-plugin-systemplugins-networkbrowser \
	enigma2-plugin-systemplugins-osd3dsetup \
	enigma2-plugin-systemplugins-osdpositionsetup \
	enigma2-plugin-systemplugins-positionersetup \
	enigma2-plugin-systemplugins-satfinder \
	enigma2-plugin-systemplugins-systemtime \
	enigma2-plugin-systemplugins-softwaremanager \
	enigma2-plugin-systemplugins-videoenhancement \
	enigma2-plugin-systemplugins-videomode \
	enigma2-plugin-systemplugins-videotune \
	enigma2-plugin-systemplugins-wirelesslan \
	${@bb.utils.contains_any("MACHINE", "dm900 dm920", "enigma2-plugin-systemplugins-commoninterfaceassignment", "", d)} \
	${@bb.utils.contains_any("MACHINE", "dm900 dm920", "enigma2-plugin-systemplugins-fsblupdater", "", d)} \
	${@bb.utils.contains_any("MACHINE", "dm900 dm920", "enigma2-plugin-systemplugins-serviceapp", "", d)} \
	"

rmpy() {
	rm -f $1/*.py
	for file2 in `ls -A $1`
	do
		if [ -d "$1/$file2" ];then
			if [ $file2 != "OpenMultiboot" ];then
				rmpy "$1/$file2"
			fi
		fi
	done
}

rootfs_myworks() {
	rmpy ${IMAGE_ROOTFS}/usr/lib/enigma2/python/Plugins
	rmpy ${IMAGE_ROOTFS}/usr/lib/enigma2/python/Components
	mv -f ${IMAGE_ROOTFS}/usr/lib/bitratecalc.so ${IMAGE_ROOTFS}/usr/lib/enigma2/python/Components/Converter/
	rm -f ${IMAGE_ROOTFS}/usr/share/enigma2/PLi-HD/picon_default.png
	rm -f ${IMAGE_ROOTFS}/usr/share/enigma2/PLi-FullHD/picon_default.png
	rm -f ${IMAGE_ROOTFS}/usr/share/enigma2/PLi-FullNightHD/picon_default.png
	cp -rf ${THISDIR}/files/usr ${IMAGE_ROOTFS}/
	cp -rf ${THISDIR}/files/etc ${IMAGE_ROOTFS}/
}

ROOTFS_POSTPROCESS_COMMAND_append_dm900 += "rootfs_myworks; "
ROOTFS_POSTPROCESS_COMMAND_append_dm920 += "rootfs_myworks; "
