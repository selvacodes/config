#!/bin/bash

# Pre-installation {{{1

# Verify the boot mode
#ls /sys/firmware/efi/efivars

# Conect to the internet
#ping archlinux.org

# Update the system clock
timedatectl set-ntp true

# Partition the disks
    # boot partition
        # Create a 512 MiB FAT32 partition in parted
        # Set the boot flag (not legacy_boot)
    # root partition
        # Format to ext4

# Format the partitions
#mkfs.ext4 /dev/sda1

# Mount the file systems
#mount /dev/sda1 /mnt
#mkdir /mnt/boot
#mount /dev/sda2 /mnt/boot

# Installation {{{1

# Sync database, update keyring, and update mirrors with Reflector
pacman -Sy
pacman -S --noconfirm archlinux-keyring reflector
reflector --verbose --country 'United States' --protocol https --sort rate --save /etc/pacman.d/mirrorlist


# Install packages
pacstrap /mnt                                                   \
    base base-devel                                             \
\
    xorg xorg-xinit                                             \
\
    pulseaudio pulseaudio-alsa pavucontrol                      \
    alsa-utils                                                  \
    blueman pulseaudio-bluetooth bluez bluez-libs bluez-utils   \
\
    redshift python-gobject python-xdg librsvg                  \
    feh                                                         \
    scrot                                                       \
\
    xbindkeys                                                   \
    xclip                                                       \
    xcape                                                       \
    xf86-input-wacom                                            \
\
    python python-pip                                           \
    jdk8-openjdk                                                \
    gdb valgrind                                                \
    go                                                          \
    nodejs npm                                                  \
    astyle eslint autopep8 flake8 tidy rust-racer               \
    hub                                                         \
    mono                                                        \
\
    ttf-dejavu                                                  \
    ttf-hack                                                    \
\
    noto-fonts-emoji                                            \
    awesome-terminal-fonts                                      \
\
    ttf-freefont                                                \
    ttf-arphic-uming                                            \
    ttf-indic-otf                                               \
\
    adobe-source-han-sans-otc-fonts                             \
\
    neovim                                                      \
    zsh                                                         \
    ranger highlight w3m                                        \
    rofi                                                        \
    qbittorrent                                                 \
    networkmanager network-manager-applet                       \
    mopidy ncmpcpp                                              \
    neomutt                                                     \
\
    git tig                                                     \
    the_silver_searcher                                         \
    openssh sshfs                                               \
    parted                                                      \
    gnome-keyring libsecret                                     \
    gnupg                                                       \
    ccache                                                      \
    zsh-completions                                             \
    rsync                                                       \
    fuse                                                        \
    strace                                                      \
    reflector                                                   \
    cmake                                                       \
    clang                                                       \
    sxiv                                                        \
    unzip                                                       \
    httpie                                                      \
    docker                                                      \
    whois                                                       \

    # otf-ipafont                                                 \
    # ttf-hanazono                                                \


    # ttf-symbola                                                 \
    # ttf-emojione-color
    # ttf-twemoji-color

    # adobe-source-han-sans-jp-fonts                              \
    # ttf-sazanami                                                \

    # zsh-theme-powerlevel9k                                      \


# compton                                                     \
# powerline-fonts                                             \
# autofs
#rustup
# pandoc                                                      \
# lzop                                                        \
#devilspie transset-df                                       \
#termite                                                     \
#xf86-input-synaptics                                        \
#yarn
#xdotool
#wmctrl \
#tmux
#ttf-insonsolata
#alsa-utils
#vimpager
#dialog wpa_supplicant \
#urxvt-perls rxvt-unicode \


# Chroot {{{1

# Fstab
genfstab -U /mnt >> /mnt/etc/fstab

curl https://raw.githubusercontent.com/cjbassi/config/master/arch/arch2.sh > /mnt/arch2.sh

# Chroot
arch-chroot /mnt


# Old Configs {{{1

# ssh-server {{{2

# Enable sshd daemon
#systemctl enable sshd.service

# Sets up authorized keys for remote login
#cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys

# /etc/ssh/sshd_config
#PasswordAuthentication no
#!!!!!May need to change other things!!!!!

# Creates key and adds it to agent {{{2
#ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)-$(date -I)"
#eval $(ssh-agent)
#ssh-add ~/.ssh/id_ed25519

# Lengthens shell history {{{2
#fbcon=scrollback:64k

#ntp {{{2
# Sets time
#sudo timedatectl set-local-rtc 0
#sudo timedatectl set-timezone America/Los_Angeles
#systemctl enable ntpd.service

# mirrors {{{2
#cat /etc/pacman.d/mirrorlist | grep -A1 --no-group-separator "United States" | grep "Server" > mirrorlist
#mv -f morrorlist /etc/pacman.d/mirrorlist
# }}}

# GPG keys
#pacman-key --init
#pacman-key --populate archlinux
