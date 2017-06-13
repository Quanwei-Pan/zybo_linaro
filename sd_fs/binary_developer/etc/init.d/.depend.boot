TARGETS = console-setup mountkernfs.sh alsa-utils resolvconf lm-sensors hostname.sh udev mountdevsubfs.sh procps udev-finish hwclock.sh checkroot.sh networking urandom checkroot-bootclean.sh bootmisc.sh mountall-bootclean.sh mountall.sh checkfs.sh lvm2 mountnfs-bootclean.sh mountnfs.sh kmod
INTERACTIVE = console-setup udev checkroot.sh checkfs.sh
udev: mountkernfs.sh
mountdevsubfs.sh: mountkernfs.sh udev
procps: mountkernfs.sh udev
udev-finish: udev
hwclock.sh: mountdevsubfs.sh
checkroot.sh: hwclock.sh mountdevsubfs.sh hostname.sh
networking: mountkernfs.sh urandom resolvconf procps
urandom: hwclock.sh
checkroot-bootclean.sh: checkroot.sh
bootmisc.sh: checkroot-bootclean.sh mountall-bootclean.sh udev mountnfs-bootclean.sh
mountall-bootclean.sh: mountall.sh
mountall.sh: checkfs.sh checkroot-bootclean.sh lvm2
checkfs.sh: checkroot.sh lvm2
lvm2: mountdevsubfs.sh udev
mountnfs-bootclean.sh: mountnfs.sh
mountnfs.sh: networking
kmod: checkroot.sh
