--[[--
File              : theme.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 16.05.2021
Last Modified Date: 16.05.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
---------------------------
-- Default awesome theme --
---------------------------
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

theme.font = "Hack 12"

theme.fg_normal = "#e2ccb0"
theme.fg_focus = "#d88166"
theme.fg_urgent = "#CC9393"
theme.bg_normal = "#140c0b"
theme.bg_focus = "#140c0b"
theme.bg_urgent = "#2a1f1e"
theme.border_width = dpi(3)
theme.border_normal = "#302627"
theme.border_focus = "#c2745b"
theme.border_marked = "#CC9393"
theme.taglist_fg_focus = "#d88166"
theme.tasklist_bg_focus = "#140c0b"
theme.tasklist_fg_focus = "#d88166"

-- Generate taglist squares:
local taglist_square_size = dpi(3)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
                                taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
                                  taglist_square_size, theme.fg_normal)
theme.menu_height = dpi(30)
-- theme.menu_width = dpi(100)

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height,
                                               theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
