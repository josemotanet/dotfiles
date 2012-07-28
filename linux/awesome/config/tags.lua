layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}

tags = {}

-- Create tags for each screen if you have multiple monitors
for screen = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[screen] = awful.tag({ "sh", "vim", "www", "irc", "misc" }, screen, layouts[2])
end
