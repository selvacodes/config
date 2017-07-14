rm -f arch3.sh

mkdir Downloads

git clone https://github.com/cjbassi/config

# Ranger
mkdir -p ~/.config/ranger
ln -sf ~/config/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sf ~/config/ranger/commands.py ~/.config/ranger/commands.py

# wm
mkdir -p ~/.config/i3
ln -sf ~/config/wm/config ~/.config/i3/
mkdir -p .devilspie
ln -sf ~/config/wm/opacity.ds ~/.devilspie/

# X11 mouse acceleration and speed
sudo ln -sf ~/config/peripherals/50-mouse.conf /etc/X11/xorg.conf.d/

# polybar
mkdir -p ~/.config/polybar
ln -sf ~/config/polybar/config ~/.config/polybar/

# mutt
ln -sf ~/config/mutt/.muttrc ~/

# Vim
mkdir -p ~/.vim/temp ~/.vim/undodir
if ! [[ -e ~/.vim/autoload/plug.vim ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# dotfiles
ln -sf ~/config/dotfiles/.* ~/

cd Downloads
git clone https://github.com/rkitover/vimpager
cd vimpager
sudo make install
cd ~

sudo pip install glances

git clone https://github.com/ervandew/urxvt-vim-scrollback

bash config/installation/pacaur.sh

pacaur -y \
discord \
gitflow-avh \
gitflow-zshcompletion-avh \
google-chrome \
i3-gaps \
i3lock-color-git \
neofetch \
polybar \
unclutter-xfixes-git \
universal-ctags-git \
zsh-fast-syntax-highlighting-git \

echo "
###########################################
1) :PlugInstall
2) Edit /boot/loader/entries/arch.conf
3) Configure internet
4) Configure audio
    - set-default-source ...
    - set-default-sink ...
###########################################
"

#install vim mardown preview
#gitflow-avh vs gitflow-avh-git
#fonts
    #noto-fonts-emoji
    #ttf-symbola
    #ttf-font-awesome
    #awesome-terminal-fonts
    #fonts on bar
