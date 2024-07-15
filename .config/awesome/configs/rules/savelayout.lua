local awful = require("awful")
local awesome = awesome;

function save_last_ws()
    local f = assert(io.open("$HOME/dotfiles/.config/awesome/.awesome-last-tag", "w"))
    local t = awful.screen.focused().selected_tag
    f:write(t.name, "\n")
    f.close()
end

awesome.connect_signal("exit", function(c)
    save_last_ws()
end)
