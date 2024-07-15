local awful
require("awful")
local ruled = require("ruled")
local client = client

ruled.client.append_rule {
    id         = "floating",
    rule_any   = {
        instance = { "copyq", "pinentry" },
        class    = {
            "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
            "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer",
        },
        name     = {
            "Event Tester", -- xev.
        },
        role     = {
            "AlarmWindow",   -- Thunderbird's calendar.
            "ConfigManager", -- Thunderbird's about:config.
            "pop-up",        -- e.g. Google Chrome's (detached) Developer Tools.
        }
    },
    properties = { floating = true }
}

ruled.client.append_rule {
    id         = "titlebars",
    rule_any   = { type = { "normal", "dialog" } },
    properties = { titlebars_enabled = true }
}

ruled.client.append_rule {
    rule       = { class = "Alacritty" },
    properties = { screen = 0, tag = "1" }
}
ruled.client.append_rule {
    rule       = { class = "firefox" },
    properties = { screen = 1, tag = "2" }
}

ruled.client.append_rule {
    rule       = { class = "Pavucontrol" },
    properties = {
        floating = true,
        -- placement = awful.placement.centered,
        width    = 640,
        height   = 480,
    }
}
