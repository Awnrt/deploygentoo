DEPLIST="`sed -e 's/#.*$//' -e '/^$/d' dependencies.txt | tr '\n' ' '`"
emerge --autounmask-continue -q $DEPLIST

cd $HOME
git clone https://github.com/awnrt/dwm
git clone https://github.com/awnrt/dmenu
cd $HOME/dwm
make clean install
cd $HOME/dmenu
make clean install

cd $HOME/deploygentoo/rice/dots
cp .xinitrc $HOME
cp .Xresources $HOME
