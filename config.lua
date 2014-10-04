local beatiful = require( "beatiful" )
module( "config" )

function init()
    -- input here initialization param's
end

function set_theme( theme )
    beautiful.init( os.getenv( "HOME" ) .. "/.config/awesome/themes/" .. theme .. "/theme.lua" )
end

function set_wallpaper( wallpaper )
    if wallpaper then
        for s = 1, screen.count() do
            gears.wallpaper.tiled( wallpaper, s )
        end
    end
end

function set_tags( tags )
    for s = 1, screen.count() do
        tags[s] = awful.tag( tags, s, layouts[1])
    end
end

function add_panel( pos, size, panels )
    -- insert code here
end
