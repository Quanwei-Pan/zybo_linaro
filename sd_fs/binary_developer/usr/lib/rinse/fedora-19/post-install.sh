#!/bin/sh
#
#  Customise the distribution post-install.
#


prefix=$1

if [ ! -d "${prefix}" ]; then
  echo "Serious error - the named directory doesn't exist."
  exit
fi

arch=i386
if [ $ARCH = "amd64" ] ; then
    arch=x86_64
fi

#
#  2.  Copy the cached .RPM files into the yum directory, so that
#     yum doesn't need to download them again.
#
echo "  Setting up YUM cache"
mkdir -p ${prefix}/var/cache/yum/core/packages/

for i in ${prefix}/*.rpm ; do
    cp -p $i ${prefix}/var/cache/yum/core/packages/
done

cp -pu $cache_dir/$dist.$ARCH/* ${prefix}/var/cache/yum/core/packages/


#
#  3.  Ensure that Yum has a working configuration file.
#

# use the mirror URL which was specified in rinse.conf
# A correct mirror URL does not contain /Packages on the end
mirror=`dirname $mirror`

# save original yum.conf
mv ${prefix}/etc/yum.conf ${prefix}/etc/yum.conf.orig

cat > ${prefix}/etc/yum.conf <<EOF
[main]
reposdir=/dev/null
logfile=/var/log/yum.log

[core]
name=core
baseurl=$mirror
EOF


#
#  4.  Run "yum install yum".
#

echo "  Bootstrapping yum"
chroot ${prefix} /usr/bin/yum -y install yum vim-minimal dhclient

# restore original yum.conf
mv ${prefix}/etc/yum.conf.orig ${prefix}/etc/yum.conf


# If you get this error, then replace https with http in /etc/yum.repos.d/*
# Error: Cannot retrieve metalink for repository: fedora/19/x86_64. Please verify its path and try again
#
# sed -i -e 's/https/https' ${prefix}/etc/yum.repos.d/*


#
#  5.  Clean up
#
chroot ${prefix} /usr/bin/yum clean all

umount ${prefix}/proc
umount ${prefix}/sys


#
#  6.  Remove the .rpm files from the prefix root.
#
rm -f ${prefix}/*.rpm ${prefix}/var/cache/yum/core/packages/*.rpm

find ${prefix} -name '*.rpmorig' -delete
find ${prefix} -name '*.rpmnew' -delete
