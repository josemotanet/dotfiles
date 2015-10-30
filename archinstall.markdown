Arch Linux installation notes
=============================

Applications to install
-----------------------

* ack
* adobe-source-code-pro-fonts
* adobe-source-sans-pro-fonts
* arandr
* archey
* artwiz-fonts
* chruby-git
* compton-git
* conky
* dmenu-xft
* dropbox
* dunst
* elementary-icon-theme
* elinks
* emacs
* evince
* feh
* filezilla
* firefox
* gawk
* git
* gpick
* gtk-theme-arc-git
* gtk
* gucharmap
* htop
* i
* imagemagick
* lemonbar-git
* lightdm
* lightdm-gtk-greeter
* livestreamer
* lxappearance-gtk
* menumaker
* ncdu
* nitrogen
* nopaste
* notify-osd
* ntop
* obconf
* obkey-git
* openbox
* openssh
* packer
* pgadmin
* playerctl
* postgresql
* pulseaudio
* ranger
* ruby-install-git
* rxvt-unicode-patched
* scrot
* spotify
* sqlitebrowser
* thunar
* thunar-archive-plugin
* thunar-volman
* tmux
* transmission-gtk
* ttf-freefont
* ttf-input
* ttf-lato
* unrar
* update-pacman-mirrorlist
* vlc
* weechat
* xsel
* zip
* zsh

Settings applied
----------------

### Keyboard rate

    -> .xprofile

    xset r rate 200 30

### Weechat settings

    /server add freenode irc.freenode.net
    /set irc.server.freenode.autoconnect = on
    /set irc.server.freenode.nicks = "josemota"
    /set irc.server.freenode.command = "/msg nickserv identify ****"

### Netbeans default options to be added

    -J-Dawt.useSystemAAFontSettings=on
    -J-Dswing.aatext=true
    --laf com.sun.java.swing.plaf.gtk.GTKLookAndFeel
