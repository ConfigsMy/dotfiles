local awful = require("awful")
local mod = require("bindings.mod")
local vars = require("config.vars")


awful.keyboard.append_global_keybindings({
    awful.key({
        modifiers = { mod.super, mod.shift },
        key = "j",
        description = "swap with next client by index",
        group = "client",
        on_press = function()
            awful.client.swap.byidx(1)
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.shift },
        key = "k",
        description = "swap with previous client by index",
        group = "client",
        on_press = function()
            awful.client.swap.byidx(-1)
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = "u",
        description = "jump to urgent client",
        group = "client",
        on_press = awful.client.urgent.jumpto,
    }),
    awful.key({
        modifiers = { mod.super },
        key = "Up",
        description = "increase window factor of a client",
        group = "layout",
        on_press = function()
            awful.tag.incmwfact(0.05)
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = "Down",
        description = "decrease window factor of a client",
        group = "layout",
        on_press = function()
            awful.tag.incmwfact(-0.05)
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = "l",
        description = "increase master width factor",
        group = "layout",
        on_press = function()
            awful.tag.incmwfact(0.05)
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = "h",
        description = "decrease master width factor",
        group = "layout",
        on_press = function()
            awful.tag.incmwfact(-0.05)
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.shift },
        key = "h",
        description = "increase the number of master clients",
        group = "layout",
        on_press = function()
            awful.tag.incnmaster(1, nil, true)
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.shift },
        key = "l",
        description = "decrease the number of master clients",
        group = "layout",
        on_press = function()
            awful.tag.incnmaster(-1, nil, true)
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.ctrl },
        key = "h",
        description = "increase the number of columns",
        group = "layout",
        on_press = function()
            awful.tag.incncol(1, nil, true)
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.ctrl },
        key = "l",
        description = "decrease the number of columns",
        group = "layout",
        on_press = function()
            awful.tag.incncol(-1, nil, true)
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = "space",
        description = "select next layout",
        group = "layout",
        on_press = function()
            awful.layout.inc(1)
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.shift },
        key = "space",
        description = "select previous layout",
        group = "layout",
        on_press = function()
            awful.layout.inc(-1)
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        keygroup = "numpad",
        description = "select layout directly",
        group = "layout",
        on_press = function(index)
            local tag = awful.screen.focused().selected_tag
            if tag then
                tag.layout = vars.layouts[index] or tag.layout
            end
        end,
    }),
})
