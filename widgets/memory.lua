-- | MEM | --

mem_widget = lain.widgets.mem({
    settings = function()
        local mem_usage = string.format("%4d", mem_now.used)
        widget:set_markup(space3 .. mem_usage .. "MB" .. markup.font("Tamsyn 4", " "))
    end
})

widget_mem = wibox.widget.imagebox()
widget_mem:set_image(beautiful.widget_mem)
memwidget = wibox.widget.background()
memwidget:set_widget(mem_widget)
memwidget:set_bgimage(beautiful.widget_display)


