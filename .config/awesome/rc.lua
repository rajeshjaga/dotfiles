-- awesome_mode: api-level=4:screen=on
pcall(require, "luarocks.loader")
local beautiful = require("beautiful")

beautiful.init("theme.lua")


require("configs.notification.notify")
require("configs.rules.window")
require("configs.keybinds")
require("configs.buttons")
require("configs.tags.tags")
require("configs.autostart")
require("configs.bar.bar")
