#!/bin/sh
#
#  Ensure the chroot has an /etc/resolv.conf file.
#  Add localhost entry into etc/hosts

#
#  Get the root of the chroot.
#
prefix=$1

#
#  Ensure it exists.
#
if [ ! -d "${prefix}" ]; then
  echo "Serious error - the named directory doesn't exist."
  exit
fi

if [ ! -d "${prefix}/etc/" ]; then
    mkdir -p "${prefix}/etc/"
fi

if ! grep -q localhost ${prefix}/etc/hosts 2>/dev/null; then
    echo "127.0.0.1       localhost" >> ${prefix}/etc/hosts
fi

cp /etc/resolv.conf "${prefix}/etc/"

