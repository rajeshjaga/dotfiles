local wezterm = require 'wezterm'

local config = {}

config = {
        color_scheme = 'catppuccin-mocha',
        font = wezterm.font { family = 'JetBrains Mono', weight = 'Medium' },
        font_size = 14.0,
        window_background_opacity = 0.82,
        text_background_opacity = 1.0,
        tab_bar_at_bottom = true,
        hide_tab_bar_if_only_one_tab = true,
}

config.colors = {
        tab_bar = {
                background = '#1e1e2e',
                active_tab = {
                        bg_color = '#2b2042',
                        fg_color = '#c0c0c0',
                        intensity = 'Normal',
                        underline = 'None',
                        italic = false,
                        strikethrough = false,
                },

                inactive_tab = {
                        bg_color = '#1b1032',
                        fg_color = '#808080',
                },
                inactive_tab_hover = {
                        bg_color = '#3b3052',
                        fg_color = '#909090',
                        italic = true,
                },
                new_tab = {
                        bg_color = '#1b1032',
                        fg_color = '#808080',
                },
                new_tab_hover = {
                        bg_color = '#3b3052',
                        fg_color = '#909090',
                        italic = true,
                },
        }
}

return config
