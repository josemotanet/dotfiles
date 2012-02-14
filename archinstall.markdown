Arch Linux installation notes
=============================

Applications to install
-----------------------

* archey
* chromium
* cmus
* dropbox
* evince
* feh
* gtk
* htop
* imageshack-upload
* lynx
* ncdu
* netbeans
* packer
* rxvt-unicode
* scrot
* skype
* sudo
* terminus-font
* tmux
* ttf-bistream-vera
* ttf-dejavu
* ttf-freefont
* unrar
* vim
* weechat
* xclip
* xsel
* zlib
* zsh

Settings applied
----------------

### Locale settings

In `rc.conf`, change locale accordingly. Typically: `en_US.UTF-8`

### Keyboard rate

    -> .xinitrc

    xset r rate 200 30

### Keyboard locale settings

    $ touch /etc/X11/xorg.conf.d/keyboard.conf

Append:

    Section "InputClass"
      Identifier		"Keyboard Defaults"
      MatchIsKeyboard		"yes"
      Option			"XkbLayout" 	"pt"
      Option			"XkbModel"	"apple_laptop"
      Option			"XkbVariant"	"mac"
    EndSection

### Weechat settings

    /server add freenode irc.freenode.net
    /set irc.server.freenode.autoconnect = on
    /set irc.server.freenode.nicks = "josemota"

### Netbeans default options to be added

    -J-Dawt.useSystemAAFontSettings=on
    -J-Dswing.aatext=true
    --laf com.sun.java.swing.plaf.gtk.GTKLookAndFeel
