local wezterm = require "wezterm"

local config = wezterm.config_builder()



config.front_end = "OpenGL"
config.max_fps = 144
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500
config.term = "xterm-256color"

config.font = wezterm.font({ family = "JetBrains Mono", weight = "Medium" })
config.font_size = 14.0
config.prefer_egl = true
config.window_background_opacity = 0.95

config.color_scheme = "rose-pine"
config.default_prog = { 'pwsh.exe', '-NoLogo', '-NoProfileLoadTime' }

config.window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.inactive_pane_hsb = {
        saturation = 0.0,
        brightness = 1.0,
}

config.colors = {
        background = "#191724",
        cursor_bg = "#e0def4",
        cursor_border = "#908caa",
        tab_bar = {
                background = "#191724",
                active_tab = {
                        bg_color = "#191724",
                        fg_color = "e0def4",
                        intensity = "Normal",
                        underline = "None",
                        italic = false,
                        strikethrough = false,
                },
                inactive_tab = {
                        bg_color = "#191724",
                        fg_color = "#908caa",
                        intensity = "Normal",
                        underline = "None",
                        italic = false,
                        strikethrough = false,
                },
                new_tab = {
                        bg_color = "#191724",
                        fg_color = "#908caa",
                },
        },
}

config.window_frame = {
        font = wezterm.font({ family = "JetBrains Mono", weight = "Regular" }),
        active_titlebar_bg = "191724",
}

config.selection_word_boundary = '{}[]()"\'`.,;:'

config.automatically_reload_config = true

return config
