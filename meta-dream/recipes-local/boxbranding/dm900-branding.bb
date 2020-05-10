DESCRIPTION = "Openpli branding lib DM900"
MAINTAINER = "Openpli Developers"
PACKAGE_ARCH = "${MACHINE_ARCH}"

DEPENDS = "python"

require conf/license/openpli-gplv2.inc

inherit autotools-brokensep gitpkgv pythonnative

SRCREV = "${AUTOREV}"
PV = "git${SRCPV}"
PKGV = "git${GITPKGV}"

PR[vardepsexclude] += "DATE"

do_configure[nostamp] = "1"

SRC_URI="git://github.com/jack2015/branding-module.git;protocol=git"

S = "${WORKDIR}/git"

EXTRA_OECONF = " \
    BUILD_SYS=${BUILD_SYS} \
    HOST_SYS=${HOST_SYS} \
    STAGING_INCDIR=${STAGING_INCDIR} \
    STAGING_LIBDIR=${STAGING_LIBDIR} \
    --with-visionversion="9.3" \
    --with-visionrevision="develop" \
    --with-boxbrand="dreambox" \
    --with-oever="PLi-OE" \
    --with-distro="openpli" \
    --with-boxtype="dm900" \
    --with-brandoem="dreambox" \
    --with-machinebrand="dreambox" \
    --with-machinename="dm900" \
    --with-machinebuild="dm900" \
    --with-machinemake="dm900" \
    --with-imageversion="9.3" \
    --with-imagebuild="release" \
    --with-imagedevbuild="000" \
    --with-imagetype="develop" \
    --with-feedsurl="http://downloads.openpli.org/feeds/openpli-7-release" \
    --with-imagedir="dm900" \
    --with-imagefs="tar.bz2" \
    --with-mtdbootfs="mmcblk0p3" \
    --with-mtdrootfs="mmcblk0p2" \
    --with-mtdkernel="mmcblk0p1" \
    --with-rootfile="rootfs.tar.bz2" \
    --with-kernelfile="kernel.bin" \
    --with-mkubifs="" \
    --with-ubinize="" \
    --with-arch="cortexa15hf-neon-vfpv4" \
    --with-display-type="colorlcd390" \
    --with-small-flash="" \
    --with-transcoding="" \
    --with-multitranscoding="" \
    "

FILES_${PN} = "${libdir}/enigma2/python/*.so"
FILES_${PN}-dev += "${libdir}/enigma2/python/*.la"
FILES_${PN}-staticdev += "${libdir}/enigma2/python/*.a"
FILES_${PN}-dbg += "${libdir}/enigma2/python/.debug"
