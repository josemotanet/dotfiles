require("awful")
require("awful.menu")
require("awful.autofocus")
require("awful.rules")
require("beautiful")
require("naughty")
require("vicious")

-- Variables and settings
require("config.settings") 

-- Theme
beautiful.init(home .. "/.config/awesome/themes/josemota/theme.lua")

-- Startup items
require("config.startup")

-- Error handling
require("config.error-handling")

-- Menu
require("config.menu")

--- Tags
require("config.tags")

-- Signals
require("config.signals")

-- Key bindings
require("config.keys")

-- Rules
require("config.rules")

--- Widgets
require("config.widgets")

