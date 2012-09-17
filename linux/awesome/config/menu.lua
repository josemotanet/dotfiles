local beautiful = require("beautiful")
myawesomemenu = {
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  { "quit", awesome.quit }
}
-- 
utils_menu = {
  { "File Manager" , "thunar"                                     },
  { "Google Chrome", "google-chrome"                              },
  { "Mutt Email"   , terminal .. " -e mutt"                       },
  { "Ncmcpp Music" , terminal .. " -e ncmpcpp"                    },
  { "Netbeans"     , "/home/jose/bin/netbeans-7.1.1/bin/netbeans" },
  { "Vim"          , "gvim"                        },
  { "Weechat"      , terminal .. " -e weechat-curses"             },
  { "Audio mixer"  , "xfce4-mixer"                                }
}
-- 
mymainmenu = awful.menu({
  items = { 
    { "awesome", myawesomemenu, beautiful.awesome_icon },
    { "apps", utils_menu },
    { "open terminal", terminal }
  }
})

mylauncher = awful.widget.launcher({ 
  image = image(beautiful.awesome_icon),
  menu = mymainmenu
})
