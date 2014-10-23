-- | BAT | --

bat_widget = wibox.widget.textbox()
vicious.register(bat_widget, vicious.widgets.bat, vspace1 .. "$2%" .. vspace1, 9, "BAT0")

widget_bat = wibox.widget.imagebox()
widget_bat:set_image(beautiful.widget_bat)
batwidget = wibox.widget.background()
batwidget:set_widget(bat_widget)
batwidget:set_bgimage(beautiful.widget_display)


