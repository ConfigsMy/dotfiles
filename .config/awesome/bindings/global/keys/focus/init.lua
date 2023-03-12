local awful = require("awful")
local mod = require("bindings.mod")


awful.keyboard.append_global_keybindings({
    awful.key({
        modifiers = { mod.super },
        key = "j",
        description = "focus next by index",
        group = "client",
        on_press = function()
            awful.client.focus.byidx(1)
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = "k",
        description = "focus previous by index",
        group = "client",
        on_press = function()
            awful.client.focus.byidx(-1)
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = "Tab",
        description = "go back",
        group = "client",
        on_press = function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.ctrl },
        key = "j",
        description = "focus the next screen",
        group = "screen",
        on_press = function()
            awful.screen.focus_relative(1)
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.ctrl },
        key = "k",
        description = "focus the previous screen",
        group = "screen",
        on_press = function()
            awful.screen.focus_relative(-1)
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.ctrl },
        key = "n",
        description = "restore minimized",
        group = "client",
        on_press = function()
            local c = awful.client.restore()
            if c then
                c:active({ raise = true, context = "key.unminimize" })
            end
        end,
    }),
})
