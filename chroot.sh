#!/bin/bash
# Script to mount for chroot and umount device
help_mount() {
	echo "Usage: sudo chroot.sh action device directory"
	echo "Action ={mount,umount}"
	echo "Device = where your system partition is locate, only name (Don't Include /dev), eg sda1"
	echo "Directory = Mount point directory"
	exit 1
}

if [ "$#" -lt 2 ]; then
	help_mount
fi

bindList=( "/dev" "/proc" "/tmp" "/etc/resolv.conf" )

shareFolder() {

for i in ${bindList[@]}
do
	if [ "$1" == "mount --bind" ];then
		 $1 $i $2$i
	else
		 $1 $2$i
	fi
done
 
}

case $1 in
mount)
if [ -z "$3" ];then
	echo "Include directory to mount device"
	help_mount
fi 
mount -t auto -o acl /dev/$2 $3
shareFolder $1" --bind" $3
chroot $3
;;
umount)
shareFolder $1 $3
umount /dev/$2
;;
*)
help_mount
esac

