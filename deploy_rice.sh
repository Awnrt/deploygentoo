#emerge --unmerge dev-lang/rust
#emerge --oneshot virtual/rust dev-lang/rust-bin
#emerge --update --deep @world
#emerge --depclean
#echo 'dev-lang/rust' >> /etc/portage/package.mask

DEPLIST="`sed -e 's/#.*$//' -e '/^$/d' dependencies.txt | tr '\n' ' '`"
sudo emerge --autounmask-continue -q $DEPLIST
#USE="font-styles perl xft unicode3 mousewheel blink 256-color"sudo emerge rxvt-unicode
cd /home/awy
git clone https://github.com/awnrt/dwm
git clone https://github.com/awnrt/dmenu
git clone https://github.com/awnrt/slstatus
cd home/awy/dwm
make clean install
cd /home/awy/dmenu
make clean install

cd /home/awy/deploygentoo/rice/dots
cp .xinitrc /home/awy/
cp .Xresources /home/awy/
cp .bash_profile /home/awy/

sudo mkdir /etc/X11/xorg.conf.d
sudo mkdir /etc/modules-load.d
sudo cp /home/awy/deploygentoo/nvidia/nvidia.conf /etc/X11/xorg.conf.d/nvidia.conf
sudo cp /home/awy/deploygentoo/nvidia/video.conf /etc/modules-load.d/video.conf
sudo rc-update add elogind boot
