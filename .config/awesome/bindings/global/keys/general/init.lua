local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
local mod = require("bindings.mod")
local vars = require("config.vars")


awful.keyboard.append_global_keybindings({
    awful.key({
        modifiers = { mod.super },
        key = "s",
        description = "show help",
        group = "awesome",
        on_press = hotkeys_popup.show_help,
    }),
    awful.key({
        modifiers = { mod.super, mod.shift },
        key = "r",
        description = "reload awesome",
        group = "awesome",
        on_press = awesome.restart,
    }),
    awful.key({
        modifiers = { mod.super, mod.shift },
        key = "q",
        description = "quit awesome",
        group = "awesome",
        on_press = awesome.quit,
    }),
    awful.key({
        modifiers = { mod.super },
        key = "x",
        description = "lua execute prompt",
        group = "awesome",
        on_press = function()
            awful.prompt.run({
                prompt = "Run Lua code: ",
                textbox = awful.screen.focused().promptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval",
            })
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = "Return",
        description = "open a terminal",
        group = "launcher",
        on_press = function()
            awful.spawn(vars.terminal)
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = "r",
        description = "run prompt",
        group = "launcher",
        on_press = function()
            awful.screen.focused().promptbox:run()
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = "p",
        description = "show the menubar",
        group = "launcher",
        on_press = function()
            menubar.show()
        end,
    }),
})
