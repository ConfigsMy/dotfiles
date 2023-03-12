local beautiful = require("beautiful")
local awful = require("awful")

awful.screen.set_auto_dpi_enabled(true)

local themes = {
    "default",
    "xresources",
}
local chosen_theme = themes[2]


beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))
beautiful.wallpaper = "/home/artur/Nextcloud/Разное/Обои/8.jpg"
