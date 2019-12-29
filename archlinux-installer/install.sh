##
# Arch Linux Installer
# ====================
#
# Example:
#
# > $ wget -O install.sh https://raw.githubusercontent.com/josemotanet/dotfiles/archlinux-installer/install.sh
# > $ bash install.sh jose my_password arch-virtualbox http://github.com/josemotanet/dotfiles en_US.UTF-8 Europe/Lisbon


#
# First steps
#

USER=$1
PASS=$2
HOST="${3:-arch-virtualbox}"
DOTFILES="${4:-http://github.com/josemotanet/dotfiles}"
LANG="${5:-en_US.UTF-8}"
TIMEZONE="${6:-Europe/Lisbon}"

echo -e "\e[33m=== Installing system...\e[39m"

timedatectl set-ntp true
parted --script /dev/sda mklabel msdos mkpart primary ext4 0% 100%
mkfs.ext4 -qv /dev/sda1
mount /dev/sda1 /mnt
pacstrap /mnt base base-devel linux linux-firmware
genfstab /mnt >> /mnt/etc/fstab

echo -e "\e[36m=== System installed.\e[39m"

wget -O /mnt/chroot.sh https://raw.githubusercontent.com/josemotanet/dotfiles/archlinux-installer/archlinux-installer/chroot.sh

arch-chroot /mnt /bin/bash ./chroot.sh $USER $PASS $HOST $DOTFILES $LANG $TIMEZONE

echo -e "\e[36m=== Full installation complete. Please reboot.\e[39m"
