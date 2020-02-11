#
# Post installation
#

export USER=$1
export PASS=$2
export HOST=$3
export DOTFILES=$4
export LANG=$5
export TIMEZONE=$6

echo "\e[33m=== Starting post installation...\e[39m"
ln -sf /usr/share/zoneinfo/$6 /etc/localtime
hwclock --systohc
echo "LANG=$LANG" > /etc/locale.conf
echo "$LANG UTF-8" >> /etc/locale.gen
locale-gen
echo $HOST > /etc/hostname
mkinitcpio -P
echo 'root:'$PASS | chpasswd
pacman -S --noconfirm grub efibootmgr osprober ntfs-3g
grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

echo -e "\e[36m=== Post installation successful.\e[39m"

#
# Bootstrap
#

echo -e "\e[33m=== Bootstrapping...\e[39m"

pacman -Syy
pacman -S --noconfirm arandr \
                      curl \
                      dhcpcd \
                      emacs \
                      fzf \
                      git \
                      go \
                      htop \
                      i3-gaps \
                      isync \
                      lightdm \
                      lightdm-gtk-greeter \
                      lxappearance \
                      lynx \
                      man-db \
                      man-pages \
                      marked \
                      mpc \
                      mpd \
                      mpv \
                      ncdu \
                      ncmpcpp \
                      neomutt \
                      networkmanager \
                      openssh \
                      powertop \
                      pulseaudio \
                      pavucontrol \
                      ranger \
                      ripgrep \
                      rofi \
                      rofimoji \
                      rxvt-unicode \
                      simplescreenrecorder \
                      stow \
                      sudo \
                      tlp \
                      ttf-roboto \
                      ttf-roboto-mono \
                      tmux \
                      udiskie \
                      urxvt-perls \
                      vi \
                      vim \
                      virtualbox-guest-modules-arch \
                      virtualbox-guest-utils \
                      weechat \
                      wget \
                      xf86-video-vmware \
                      xorg-server \
                      xorg-xbacklight \
                      xorg-xrdb \
                      xorg-xset \
                      xsel \
                      zathura-pdf-mupdf \
                      zip \
                      zsh

systemctl enable vboxservice
systemctl enable lightdm
systemctl enable NetworkManager
systemctl enable tlp

useradd -m -G wheel,vboxsf -s /bin/zsh $USER
echo $USER:$PASS | chpasswd
echo "%wheel      ALL=(ALL) ALL" >> /etc/sudoers
echo "autologin-user=$USER" >> /etc/lightdm/lightdm.conf
echo "nameserver 1.1.1.1" > /etc/resolv.conf

echo -e "\e[36m=== Bootstrap complete.\e[39m"
