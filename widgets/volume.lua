-- | VOL | --

vol_widget = wibox.widget.textbox()
vicious.register(vol_widget, vicious.widgets.volume, vspace1 .. "$1%" .. vspace1, 9, "Master")

widget_vol = wibox.widget.imagebox()
widget_vol:set_image(beautiful.widget_vol)
volwidget = wibox.widget.background()
volwidget:set_widget(vol_widget)
volwidget:set_bgimage(beautiful.widget_display)


