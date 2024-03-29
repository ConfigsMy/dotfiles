local awful = require("awful")
local beautiful = require("beautiful")
local vars = require("config.vars")
local wibar = require("wibar")
local wibox = require("wibox")

screen.connect_signal("request::wallpaper", function(s)
    awful.wallpaper({
        screen = s,
        widget = {
            {
                image = beautiful.wallpaper,
                upscale = true,
                downscale = true,
                widget = wibox.widget.imagebox,
            },
            valign = "center",
            halign = "center",
            tiled = false,
            widget = wibox.container.tile,
        },
    })
end)

screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table.
    awful.tag(vars.tags, s, awful.layout.layouts[1])
    wibar.create(s)
end)

screen.connect_signal("theme::change", function(s)
    local theme = require("themes.xresources")
    theme.set_theme_colors()
    wibar.widget.bg = theme.theme.bg_normal
    wibar.widget.fg = theme.theme.fg_normal
    wibar.widget.draw()
end)
