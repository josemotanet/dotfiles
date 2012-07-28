-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

spacer = widget({ type = 'textbox', name = "spacer" })
spacer.text = " | "

-- { RAM widget

ramwtext = widget({ type = 'textbox', name = "ramwtext" })
  ramwtext.text = "<span color='white'>RAM: </span>"

ramw2 = widget({ type = 'textbox', name = "ramw2" })
  vicious.register(ramw2, vicious.widgets.mem, "$2 MiB ", 5)

ramw = awful.widget.progressbar()
  ramw:set_width(30)
  ramw:set_height(6)
  ramw:set_vertical(false)
  ramw:set_background_color("#494B4F")
  ramw:set_border_color("#cccccc")
  ramw:set_color("#ffffff")
  awful.widget.layout.margins[ramw.widget] = {top = 6}
    vicious.register(ramw, vicious.widgets.mem, "$1", 5)

-- }

-- Network widget
netuptext = widget({ type = 'textbox', name = "netuptext" })
  netuptext.text = "<span color='#9f9'>u </span>"

netupwidget = widget({ type = 'textbox', name = "netupwidget" })
  vicious.cache(vicious.widgets.net)
  vicious.register(netupwidget, vicious.widgets.net, "${eth0 up_kb} ", 1)

netdowntext = widget({ type = 'textbox', name = "netdowntext" })
  netdowntext.text = "<span color='#f99'>d </span>"

netdownwidget = widget({ type = 'textbox', name = "netdownwidget" })
  vicious.cache(vicious.widgets.net)
  vicious.register(netdownwidget, vicious.widgets.net, "${eth0 down_kb}", 1)

mpdwidget = widget({ type = "textbox" })
  vicious.register(mpdwidget, vicious.widgets.mpd,
  function (widget, args)
    if args["{state}"] == "Stop" then 
      return "music off"
    else 
      return args["{Artist}"]..' - '.. args["{Title}"]
    end
  end, 10)

volwidget = widget({ type = "textbox" })
  vicious.register(volwidget, vicious.widgets.volume, "$2 $1%", 2, "Master")

-- Create the wibox
mywibox[s] = awful.wibox({ position = "top", screen = s })
-- Add widgets to the wibox - order matters
mywibox[s].widgets = {
  {
      mylauncher,
      mytaglist[s],
      mypromptbox[s],
      layout = awful.widget.layout.horizontal.leftright
  },
  mylayoutbox[s],
  mytextclock, spacer,
  ramw.widget,
  ramw2, ramwtext, spacer,
  netdownwidget, netdowntext, netupwidget, netuptext, spacer,
  volwidget, spacer,
  mpdwidget, spacer,
  s == 2 and mysystray or nil,
  mytasklist[s],
  layout = awful.widget.layout.horizontal.rightleft
}

end
