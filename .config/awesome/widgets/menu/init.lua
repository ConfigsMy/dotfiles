local awful = require("awful")
local beautiful = require("beautiful")
local commands = require("config.commands")
local hotkeys_popup = require("awful.hotkeys_popup")
local mod = require("bindings.mod")
local vars = require("config.vars")
local _M = {}

local awesome_menu = {
    {
        " Hotkeys",
        function()
            hotkeys_popup.show_help(nil, awful.screen.focused())
        end,
    },
    { " Manual",      commands.manual .. " -e man awesome" },
    { " Edit config", commands.editor .. " " .. awesome.conffile },
    { " Restart",     awesome.restart },
    {
        " Quit",
        function()
            awesome.quit()
        end,
    },
}

local browsers = {
    { " Firefox",       "firefox" },
    { " Google Chrome", "chrome" },
}

local file_managers = {
    { "LF", vars.terminal .. " -e lf" },
}

local function create_menu_bindings(m)
    awful.keyboard.append_global_keybindings({
        awful.key({
            modifiers = { mod.super },
            key = "w",
            description = "show main menu",
            group = "awesome",
            on_press = function()
                m:show()
            end,
        }),
    })

    awful.mouse.append_global_mousebindings({
        awful.button({}, 3, function()
            m:toggle()
        end),
    })
end

function _M.create()
    _M.menu = awful.menu({
        items = {
            { "Awesome",       awesome_menu, beautiful.awesome_icon },
            { " Terminal",  vars.terminal },
            { "󰖟 Browsers", browsers },
            { " Files",     file_managers },
        },
    })
    _M.widget = awful.widget.launcher({
        image = beautiful.awesome_icon,
        menu = _M.menu,
    })

    create_menu_bindings(_M.menu)

    return _M.widget
end

return _M
