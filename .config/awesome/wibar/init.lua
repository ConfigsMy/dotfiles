local awful = require("awful")
local wibox = require("wibox")
local widgets = require("widgets")
local _M = {}


-- local battery_widget = require("awesome-widgets.batteryarc-widget")
-- local volume_widget = require("awesome-widgets.volume-widget")

-- Create the wibox
function _M.create(s)
    _M.widget = awful.wibar({
        position = "top",
        screen = s,
        widget = {
            layout = wibox.layout.align.horizontal,
            {
                -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                widgets.menu.create(),
                widgets.taglist.create(s),
                awful.widget.prompt()
            },
            widgets.tasklist.create(s), -- Middle widget
            {
                -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                awful.widget.keyboardlayout(),
                -- volume_widget({
                -- 	widget_type = "arc",
                -- }),
                -- battery_widget({
                -- 	show_current_level = true,
                -- 	arc_thickness = 1,
                -- }),
                wibox.widget.textclock(),
                wibox.widget.systray(),
                widgets.logout_menu(),
            },
        },
    })

    return _M.widget
end

return _M
