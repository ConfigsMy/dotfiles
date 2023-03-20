local awful = require("awful")
local wibox = require("wibox")
local widgets = require("widgets")
local _M = { widgets = {} }


-- local battery_widget = require("awesome-widgets.batteryarc-widget")
-- local volume_widget = require("awesome-widgets.volume-widget")

-- Create the wibox
function _M.create(s)
    _M.widgets.layoutbox = widgets.layoutbox.create(s)
    _M.widgets.textclock = wibox.widget.textclock()
    _M.left = wibox.widget({
        -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        widgets.menu.create(),
        _M.widgets.layoutbox,
        widgets.taglist.create(s),
        awful.widget.prompt()
    })
    _M.right = wibox.widget({
        -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        awful.widget.keyboardlayout(),
        widgets.battery({ show_current_level = true }),
        _M.widgets.textclock,
        wibox.widget.systray(),
        widgets.logout_menu(),
    })

    _M.widget = awful.wibar({
        position = "top",
        screen = s,
        widget = {
            layout = wibox.layout.align.horizontal,
            _M.left,
            widgets.tasklist.create(s), -- Middle widget
            _M.right
        },
    })

    return _M.widget
end

return _M
