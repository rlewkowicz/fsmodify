#!/bin/sh
CONTROL=control$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')
touch /$CONTROL
ROOTFS=$(nsenter -t 1 -m -u -n -i sh -c "find / | grep $CONTROL | grep merged" | awk -F'/merged' '{print $1}')
nsenter -t 1 -m -u -n -i sh -c "mkdir -p $ROOTFS/merged/overlay && mount --bind /var/lib/docker $ROOTFS/merged/overlay"

/prep.sh
