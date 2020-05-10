SUMMARY = "decoding library for DTS Coherent Acoustics streams"
SECTION = "libs/multimedia"
LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"

inherit autotools gitpkgv

PV = "0.0.7+git${SRCPV}"
PKGV = "0.0.7+git${GITPKGV}"
SRCREV = "${AUTOREV}"

SRC_URI = "git://github.com/OpenVisionE2/libdca.git"

S = "${WORKDIR}/git"
