local awful = require("awful")
local mod = require("bindings.mod")


awful.keyboard.append_global_keybindings({
    awful.key({
        modifiers = { mod.super },
        key = "Left",
        description = "view previous",
        group = "tag",
        on_press = awful.tag.viewprev,
    }),
    awful.key({
        modifiers = { mod.super },
        key = "Right",
        description = "view next",
        group = "tag",
        on_press = awful.tag.viewnext,
    }),
    awful.key({
        modifiers = { mod.super },
        key = "Escape",
        description = "go back",
        group = "tag",
        on_press = awful.tag.history.restore,
    }),
    awful.key({
        modifiers = { mod.super },
        keygroup = "numrow",
        description = "only view tag",
        group = "tag",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.ctrl },
        keygroup = "numrow",
        description = "toggle tag",
        group = "tag",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.shift },
        keygroup = "numrow",
        description = "move focused client to tag",
        group = "tag",
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.ctrl, mod.shift },
        keygroup = "numrow",
        description = "toggle focused client on tag",
        group = "tag",
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    }),
})
