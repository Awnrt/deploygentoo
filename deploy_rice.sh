DEPLIST="`sed -e 's/#.*$//' -e '/^$/d' dependencies.txt | tr '\n' ' '`"
sudo emerge --autounmask-continue -q $DEPLIST
cd /home/awy
git clone https://github.com/awnrt/dwm
git clone https://github.com/awnrt/dmenu
git clone https://github.com/awnrt/slstatus
cd home/awy/dwm
make clean install
cd /home/awy/dmenu
make clean install

cd /home/awy/deploygentoo/rice/dots
cp -f .xinitrc /home/awy/
cp -f .Xresources /home/awy/
cp -f .bash_profile /home/awy/
cp -f .bashrc /home/awy/
cd /usr/lib64/urxvt/perl/
sudo git clone https://github.com/majutsushi/urxvt-font-size
sudo mv urxvt-font-size/font-size .

sudo mkdir /etc/X11/xorg.conf.d
sudo mkdir /etc/modules-load.d
sudo cp /home/awy/deploygentoo/nvidia/nvidia.conf /etc/X11/xorg.conf.d/nvidia.conf
sudo cp /home/awy/deploygentoo/nvidia/video.conf /etc/modules-load.d/video.conf
sudo rc-update add elogind boot
