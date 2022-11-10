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

emerge sys-kernel/linux-firmware sys-apps/pciutils

