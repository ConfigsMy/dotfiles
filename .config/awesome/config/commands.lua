local vars = require("config.vars")

local _M = {}

_M.editor = vars.terminal .. " -e " .. vars.editor
_M.manual = vars.terminal .. " -e man awesome"

return _M
