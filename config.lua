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

local mywibox     = {}
local mypromptbox = {}
local mylayoutbox = {}

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

function config.add_panel(pos, size, l_widgets, r_widgets)
    for s = 1, screen.count() do
        mypromptbox[s] = awful.widget.prompt()
        mylayoutbox[s] = awful.widget.layoutbox(s)
        mylayoutbox[s]:buttons(awful.util.table.join(
                               awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                               awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                               awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                               awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
        mytaglist[s]  = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)
        mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)
        mywibox[s]    = awful.wibox({ position = pos, screen = s, height = size })

        local left_layout  = wibox.layout.fixed.horizontal()
        local right_layout = wibox.layout.fixed.horizontal()

        for i = 1, #l_widgets do
            left_layout:add( l_widgets[i] )
        end
        for i = 1, #r_widgets do
            right_layout:add( r_widgets[i] )
        end

        -- if s == 1 then
        --     right_layout:add(spr)
        --     right_layout:add(spr5px)
        --     right_layout:add(mypromptbox[s])
        --     right_layout:add(wibox.widget.systray())
        --     right_layout:add(spr5px)
        -- end

        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_middle(mytasklist[s])
        layout:set_right(right_layout)
        mywibox[s]:set_bg(beautiful.panel)
        mywibox[s]:set_widget(layout)
    end
end

return config
