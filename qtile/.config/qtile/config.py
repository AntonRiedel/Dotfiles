#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# File              : config.py
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 12.04.2020
# Last Modified Date: 24.02.2022
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

# import libraries
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget

# set the mod key to the super key
mod = "mod4"

# keybinds to control qtile itself
keys = [
    # resize the master/stack panes
    Key([mod], "l", lazy.layout.increase_ratio()),
    Key([mod], "h", lazy.layout.decrease_ratio()),
    # move windows in the stack upward/downward
    # Key([mod, "shift"], "l", lazy.layout.decrease_nmaster()),
    # Key([mod, "shift"], "h", lazy.layout.increase_nmaster()),
    # shift focus in the stack upward/downwar
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    # shuffel windows in the stack upward/downward
    # Key([mod, "shift"], "j", lazy.layout.shuffle_up()),
    # Key([mod, "shift"], "k", lazy.layout.shuffle_down()),
    # switch focus to next/previous monitor
    Key([mod], "period", lazy.next_screen()),
    Key([mod], "comma", lazy.prev_screen()),
    # toggle between different layouts (tile,max)
    Key([mod], "Tab", lazy.next_layout()),
    # toggle floating
    Key([mod], "space", lazy.window.toggle_floating()),
    # toggle fullscreen
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    # kill a window
    Key([mod, "shift"], "c", lazy.window.kill()),
    # restart qtile
    Key([mod], "Escape", lazy.restart()),
    Key([mod], "Return", lazy.spawn("alacritty")),
    Key([mod], "r", lazy.spawncmd()),
]

# NOTE: keybindings for programs are handled by sxhkd

# set workspaces, in qtile called groups
groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # switch to group
            Key([mod], i.name, lazy.group[i.name].toscreen()),
            # shift + letter of group = switch to & move focused window to group
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
        ]
    )

# set layouts
layouts = [
    layout.tile.Tile(
        ratio=0.55, border_width=2, margin=4, shift_window=True, border_focus="#ff0000"
    ),
    layout.Max(),
]
# TODO: look into monadtall

# define defaults for widgets
widget_defaults = dict(
    font="Hack", fontsize=12, padding=3, border="#ff0000", border_width=3, margin=3
)
extension_defaults = widget_defaults.copy()

# setup for screens
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentScreen(),
                widget.GroupBox(disable_drag=True),
                widget.Sep(linewidth=2, padding=2),
                widget.TaskList(),
                widget.Sep(linewidth=2, padding=2),
                widget.TextBox(text="📶"),
                widget.Net(
                    interface=["wlp3s0"], update_interval=10, format="{down}↓↑{up}"
                ),
                widget.Sep(linewidth=1, padding=2),
                widget.TextBox(text="🔊"),
                widget.Volume(),
                widget.Sep(linewidth=1, padding=2),
                widget.TextBox(text="🧠"),
                widget.Memory(),
                widget.Sep(linewidth=1, padding=2),
                widget.TextBox(text="🖥"),
                widget.ThermalSensor(),
                widget.Sep(linewidth=2, padding=2),
                widget.Battery(
                    format="{char}{hour:2d}:{min:02d}h ({percent:.1%})",
                    charge_char="🔌",
                    discharge_char="🔋",
                    full_char="⚡",
                    low_percentage=0.3,
                ),
                widget.Sep(linewidth=2, padding=2),
                widget.TextBox(text="📅"),
                widget.Clock(format="%a %Y-%m-%d %I:%M %p"),
                widget.Sep(linewidth=2, padding=2),
                widget.Systray(),
            ],
            24,
        ),
    ),
]

# setup for draggin floating layouts
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
# dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        {"wmclass": "confirm"},
        {"wmclass": "dialog"},
        {"wmclass": "download"},
        {"wmclass": "error"},
        {"wmclass": "file_progress"},
        {"wmclass": "notification"},
        {"wmclass": "splash"},
        {"wmclass": "toolbar"},
        {"wmclass": "confirmreset"},  # gitk
        {"wmclass": "makebranch"},  # gitk
        {"wmclass": "maketag"},  # gitk
        {"wname": "branchdialog"},  # gitk
        {"wname": "pinentry"},  # GPG key password entry
        {"wmclass": "ssh-askpass"},  # ssh-askpass
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
