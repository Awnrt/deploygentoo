LIGHTGREEN='\033[1;32m'
LIGHTRED='\033[1;91m'
WHITE='\033[1;97m'
MAGENTA='\033[1;35m'
CYAN='\033[1;96m'
NoColor='\033[0m'

printf ${LIGHTRED}"Enter your disk label (sda, sdb, etc.): "
printf ${NoColor}""

read -p "" disk_drive

printf ${LIGHTRED}"Hostname: "
printf ${NoColor}""

read -p "" _hostname

printf ${LIGHTRED}"Username: "
printf ${NoColor}""
read -p "" _username

printf ${LIGHTRED}"ROOT password: "
printf ${NoColor}""

read -p "" _rootpasswd

printf ${LIGHTRED}"User password: "
printf ${NoColor}""
read -p "" _userpasswd

mkfs.vfat -F 32 /dev/$disk_drive"1"
mkfs.ext4 /dev/$disk_drive"3"
mkswap /dev/$disk_drive"2"
swapon /dev/$disk_drive"2"

mount /dev/$disk_drive"3" /mnt/gentoo
cd /mnt/gentoo/

links https://www.gentoo.org/downloads/mirrors/

cd /mnt/gentoo/
tar xpvf stage3.tar.xz --xattrs-include='*.*' --numeric-owner

cd /mnt/gentoo/
rm -f stage3.tar.xz
cd /mnt/gentoo/etc/portage/
rm -f make.conf
wget https://raw.githubusercontent.com/Awnrt/deploygentoo/main/portage/make.conf
mkdir --parents /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/

mount --types proc /proc /mnt/gentoo/proc/
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave  /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run

cp /root/deploygentoo/post_chroot.sh /mnt/gentoo/ 

export disk_drive
export _hostname
export _username
export _rootpasswd
export _userpasswd
chroot /mnt/gentoo/ /bin/bash ./post_chroot.sh
