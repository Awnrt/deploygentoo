LIGHTGREEN='\033[1;32m'
LIGHTRED='\033[1;91m'
WHITE='\033[1;97m'
MAGENTA='\033[1;35m'
CYAN='\033[1;96m'
NoColor='\033[0m'

source /etc/profile
mount /dev/$disk_drive /boot
emerge-webrsync
emerge --verbose --update --deep --newuse @world
echo "Europe/Moscow" > /etc/timezone
emerge --config sys-libs/timezone-data
echo "en_US ISO-8859-1" >> /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
eselect locale set 4

env-update && source /etc/profile
rm -f /etc/portage/package.license
cd /etc/portage/
wget https://raw.githubusercontent.com/Awnrt/deploygentoo/main/portage/package.license
emerge sys-kernel/linux-firmware sys-apps/pciutils

emerge sys-kernel/gentoo-kernel-bin

echo "/dev/$disk_drive"1"               /boot           ext4            noauto,noatime  1 2" >> /etc/fstab
echo "/dev/$disk_drive"3"               /               ext4            noatime         0 1" >> /etc/fstab
echo "/dev/$disk_drive"2"               none            swap            sw              0 0" >> /etc/fstab

echo hostname=\"$_hostname\" > /etc/conf.d/hostname

emerge net-misc/dhcpcd netifrc

rc-update add dhcpcd default
echo config_eno1=\"dhcp\" > /etc/conf.d/net

cd /etc/init.d/
ln -s net.lo net.eno1
rc-update add net.eno1 default
emerge sys-boot/grub
grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg

cd /etc/portage/package.use/
rm -f zz-autounmask
wget https://raw.githubusercontent.com/Awnrt/deploygentoo/main/portage/package.use/zz-autounmask
printf ${NoColor}""
printf ${LIGHTGREEN}"Installation is complete"
printf ${NoColor}""
