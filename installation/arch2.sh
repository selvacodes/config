rm /arch2.sh

# Time Zone
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
hwclock --systohc

# Locale
FIND="en_US.UTF-8 UTF-8" ; sed -i "s/#$FIND/$FIND/g" /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

# Hostname
echo arch > /etc/hostname

# Network configuration
#systemctl enable dhcpcd@eno1.service

# Root password
passwd

# Boot loader
pacman -S --noconfirm intel-ucode
bootctl --path=/boot install

echo "\
default arch
#timeout 4
editor  0" \
> /boot/loader/loader.conf

echo "\
title       Arch Linux
linux       /vmlinuz-linux
initrd      /intel-ucode.img
initrd      /initramfs-linux.img
options     root=PARTLABEL=ROOT rw" \
> /boot/loader/entries/arch.conf


################################################################################
# Post-installation

mkdir /mnt/usb

# Enable members of 'wheel' group to use root
FIND="%wheel ALL=(ALL) NOPASSWD: ALL" ; sed -i "s/# $FIND/$FIND/g" /etc/sudoers

# Add user
useradd -m -G wheel -s $(which zsh) cjbassi
passwd cjbassi

# Edit pacman.conf
sed -i "s/#Color/Color/g" /etc/pacman.conf
sed -i "s/#TotalDownload/TotalDownload/g" /etc/pacman.conf
sed -i "s/#VerbosePkgLists/VerbosePkgLists/g" /etc/pacman.conf

################################################################################
# As non root

cd /home/cjbassi/
touch .zshrc
curl https://raw.githubusercontent.com/cjbassi/config/master/installation/arch3.sh > arch3.sh
su cjbassi
