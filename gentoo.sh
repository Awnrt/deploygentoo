
read -p "" disk_drive

mkfs.vfat -F 32 /dev/$disk_drive"1"
mkfs.ext4 /dev/$disk_drive"3"
mkswap /dev/$disk_drive"2"
swapon /dev/$disk_drive"2"

mount /dev/$disk_drive"3" /mnt/gentoo
cd /mnt/gentoo/

