local config = {}

local beautiful = require("beautiful")
local gears     = require("gears")
local awful     = require("awful")


local layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top
}


function config.set_theme(theme)
    beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/" .. theme .. "/theme.lua")
end

function config.set_wallpaper(wallpaper)
    if wallpaper then
        for s = 1, screen.count() do
            gears.wallpaper.tiled(wallpaper, s)
        end
    end
end

function config.create_tags(names)
    tags = {}
    for s = 1, screen.count() do
        tags[s] = awful.tag(names, s, layouts[1])
    end
    return tags
end

function config.add_panel(position, size, l_widgets, r_widgets)
    -- insert code here
end

return config
