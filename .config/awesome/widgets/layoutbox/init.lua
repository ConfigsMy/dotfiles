local awful = require("awful")
local _M = {}


-- Create an imagebox widget which will contain an icon
-- Indicating which layout we're using.
-- We need one layoutbox per screen.
function _M.create(s)
    _M.widget = awful.widget.layoutbox({
        screen = s,
        buttons = {
            awful.button({}, 1, function()
                awful.layout.inc(1)
            end),
            awful.button({}, 3, function()
                awful.layout.inc(-1)
            end),
            awful.button({}, 4, function()
                awful.layout.inc(-1)
            end),
            awful.button({}, 5, function()
                awful.layout.inc(1)
            end),
        },
    })

    return _M.widget
end

return _M
