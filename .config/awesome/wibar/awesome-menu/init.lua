local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")

awesomeMenu = {
   { " Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { " Manual", terminal .. " -e man awesome" },
   { " Edit config", editor_cmd .. " " .. awesome.conffile },
   { " Restart", awesome.restart },
   { " Quit", function() awesome.quit() end },
}

browsers = {
  { " Firefox", "firefox" },
  { " Google Chrome", "chrome" }
}

fileManagers = { 
  { "LF", terminal .. " -e lf" } 
}

mainMenu = awful.menu({ 
  items = { 
    { "Awesome", awesomeMenu, beautiful.awesome_icon },
    { "Terminal", terminal, "" },
    { "󰖟 Browsers", browsers },
    { " Files", fileManagers }
  }
})

launcher = awful.widget.launcher({ 
  image = beautiful.awesome_icon,
   menu = mainMenu }
)

return launcher

