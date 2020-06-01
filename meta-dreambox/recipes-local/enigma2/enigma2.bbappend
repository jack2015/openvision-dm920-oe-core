#FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI = "git://github.com/jack2015/enigma2-openvision.git;branch=develop \
			file://002-dont-remove-e2iplayer.patch \
			file://005-set-box-brand-to-dreambox.patch \
			file://006-make-PLi-FullNightHD-skin-default.patch \
			file://011-fix-hardware-name.patch \
			file://012-set-default-hide-channel-list-radio.patch \
"

RRECOMMENDS_${PN}_remove = "enigma2-plugin-skins-octetfhd"
