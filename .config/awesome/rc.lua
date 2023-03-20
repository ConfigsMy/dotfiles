-- awesome_mode: api-level=4:screen=on


-- load luarocks if installed
-- pcall(require, "luarocks.loader")
require("luarocks.loader")

-- Standard awesome library
local awful = require("awful")
local vars = require("config.vars")

local menubar = require("menubar")


-- -- Menubar configuration
awful.screen.set_auto_dpi_enabled(true)
menubar.utils.terminal = vars.terminal -- Set the terminal for applications that require it


----------------------------------
--          MAIN CONFIGS       --
----------------------------------
require("bindings")
require("init_theme")
require("rules")
require("signals")

-- start some scripts/programms
awful.spawn.with_shell("~/.config/awesome/autorun.sh")
