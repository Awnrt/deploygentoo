emerge --unmerge dev-lang/rust
emerge --oneshot virtual/rust dev-lang/rust-bin
emerge --update --deep @world
emerge --depclean
echo 'dev-lang/rust' >> /etc/portage/package.mask

DEPLIST="`sed -e 's/#.*$//' -e '/^$/d' dependencies.txt | tr '\n' ' '`"
sudo emerge --autounmask-continue -q $DEPLIST

cd /home/awy
git clone https://github.com/awnrt/dwm
git clone https://github.com/awnrt/dmenu
cd home/awy/dwm
make clean install
cd /home/awy/dmenu
make clean install

cd /home/awy/deploygentoo/rice/dots
cp .xinitrc /home/awy/
cp .Xresources /home/awy/

sudo mkdir /etc/X11/xorg.conf.d

sudo cp /home/awy/deploygentoo/nvidia/nvidia.conf /etc/X11/xorg.conf.d/nvidia.conf
sudo cp /home/awy/deploygentoo/nvidia/video.conf /etc/modules-load.d/video.conf
usermod -a -G video awy
sudo rc-update add elogind boot
