source /etc/profile
mount /dev/$disk_drive /boot
emerge-webrsync
emerge --verbose --update --deep --newuse @world
