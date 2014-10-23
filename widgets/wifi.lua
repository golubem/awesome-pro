-- | WI-FI | --

wifi_widget = wibox.widget.textbox()
vicious.register(wifi_widget, vicious.widgets.wifi, vspace1 .. "${ssid}" .. vspace1, 9, "wlo1")

widget_wifi = wibox.widget.imagebox()
widget_wifi:set_image(beautiful.widget_wifi)
wifiwidget = wibox.widget.background()
wifiwidget:set_widget(wifi_widget)
wifiwidget:set_bgimage(beautiful.widget_display)


