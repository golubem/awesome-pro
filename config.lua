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

local panel     = {}
local launcher = {}
local wm_layout = {}

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
        tags = awful.tag(names, s, layouts[1])
    end
    return tags
end

function config.add_panel(pos, size, l_widgets, r_widgets)
    panel    = awful.wibox({ position = pos, screen = s, height = size })

    local left_layout  = wibox.layout.fixed.horizontal()
    for i = 1, #l_widgets do
        left_layout:add( l_widgets[i] )
    end

    local right_layout = wibox.layout.fixed.horizontal()
    for i = 1, #r_widgets do
        right_layout:add( r_widgets[i] )
    end

    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(widgets.tasklist)
    layout:set_right(right_layout)
    panel:set_bg(beautiful.panel)
    panel:set_widget(layout)
end

return config
