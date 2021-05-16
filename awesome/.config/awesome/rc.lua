--[[--
File              : rc.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 15.05.2021
Last Modified Date: 16.05.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
-- Notification library
local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
        })
        in_error = false
    end)
end
-- }}}

beautiful.init(gears.filesystem.get_xdg_config_home() .. "awesome/theme.lua")

-- Default modkey.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile, awful.layout.suit.max
    -- awful.layout.suit.max.fullscreen,
}
-- }}}

-- {{{ Wibar
-- Create a textclock widget
myram = require("ram.ram")
mycpu = require("cpu.cpu")
mybattery = require("battery.battery")
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                            awful.button({}, 1, function(t) t:view_only() end))

awful.screen.connect_for_each_screen(function(s)

    -- Each screen has its own tag table.
    awful.tag({"1", "2", "3", "4", "5", "6", "7", "8", "9"}, s,
              awful.layout.layouts[1])

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                              awful.button({}, 1,
                                           function() awful.layout.inc(1) end),
                              awful.button({}, 3,
                                           function()
            awful.layout.inc(-1)
        end), awful.button({}, 4, function() awful.layout.inc(1) end),
                              awful.button({}, 5,
                                           function()
            awful.layout.inc(-1)
        end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({position = "top", screen = s})

    -- Add widgets to the wibox
    s.mywibox:setup{
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            myram({
                color_used = "#ff0000",
                color_free = "#00ff00",
                color_buf = "#0000ff"
            }),
            mycpu({width = 30, step_width = 3, step_spacing = 0, timeout = 2}),
            mybattery(),
            mytextclock,
            battery_widget,
            s.mylayoutbox,
            wibox.widget.systray()
        }
    }
end)
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(awful.key({modkey}, "s", hotkeys_popup.show_help,
                                        {
    description = "show help",
    group = "awesome"
}), awful.key({modkey}, "j", function() awful.client.focus.byidx(1) end,
              {description = "focus next by index", group = "client"}),
                              awful.key({modkey}, "k", function()
    awful.client.focus.byidx(-1)
end, {description = "focus previous by index", group = "client"}),

                              awful.key({modkey}, ",", function()
    awful.screen.focus_relative(1)
end, {description = "focus the next screen", group = "screen"}),
                              awful.key({modkey}, ".", function()
    awful.screen.focus_relative(-1)
end, {description = "focus the previous screen", group = "screen"}),
                              awful.key({modkey}, "Escape", awesome.restart, {
    description = "reload awesome",
    group = "awesome"
}), awful.key({modkey, "Shift"}, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

                              awful.key({modkey}, "l", function()
    awful.tag.incmwfact(0.05)
end, {description = "increase master width factor", group = "layout"}),
                              awful.key({modkey}, "h", function()
    awful.tag.incmwfact(-0.05)
end, {description = "decrease master width factor", group = "layout"}),
                              awful.key({modkey}, "t",
                                        function() awful.layout.inc(1) end, {
    description = "select next",
    group = "layout"
}))

clientkeys = gears.table.join(awful.key({modkey}, "f", function(c)
    c.fullscreen = not c.fullscreen
    c:raise()
end, {description = "toggle fullscreen", group = "client"}),
                              awful.key({modkey, "Shift"}, "c",
                                        function(c) c:kill() end, {
    description = "close",
    group = "client"
}), awful.key({modkey}, "space", awful.client.floating.toggle,
              {description = "toggle floating", group = "client"}),
                              awful.key({modkey, "Shift"}, "Return",
                                        function(c)
    c:swap(awful.client.getmaster())
end, {description = "move to master", group = "client"}),
                              awful.key({modkey, "Shift"}, ".", function(c)
    c:move_to_screen(c.screen.index + 1)
end, {description = "move to screen to the left", group = "client"}),
                              awful.key({modkey, "Shift"}, ",", function(c)
    c:move_to_screen(c.screen.index - 1)
end, {description = "move to screen to the right", group = "client"}))

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys, -- View tag only.
    awful.key({modkey}, "#" .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then tag:view_only() end
    end, {description = "view tag #" .. i, group = "tag"}),
    -- Toggle tag display.
                                  awful.key({modkey, "Control"}, "#" .. i + 9,
                                            function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then awful.tag.viewtoggle(tag) end
    end, {description = "toggle tag #" .. i, group = "tag"}),
    -- Move client to tag.
                                  awful.key({modkey, "Shift"}, "#" .. i + 9,
                                            function()
        if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then client.focus:move_to_tag(tag) end
        end
    end, {description = "move focused client to tag #" .. i, group = "tag"}),
    -- Toggle tag on focused client.
                                  awful.key({modkey, "Control", "Shift"},
                                            "#" .. i + 9, function()
        if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then client.focus:toggle_tag(tag) end
        end
    end, {description = "toggle focused client on tag #" .. i, group = "tag"}))
end

clientbuttons = gears.table.join(awful.button({}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
end), awful.button({modkey}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.mouse.client.move(c)
end), awful.button({modkey}, 3, function(c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.mouse.client.resize(c)
end))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap +
                awful.placement.no_offscreen
        }
    }, -- Floating clients.
    {
        rule_any = {
            instance = {"pinentry"},
            class = {
                "Tor Browser" -- Needs a fixed window size to avoid fingerprinting by screen size.
            }
        },
        properties = {floating = true}
    }, -- Add titlebars to normal clients and dialogs
    {
        rule_any = {type = {"normal", "dialog"}},
        properties = {titlebars_enabled = true}
    }
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and not c.size_hints.user_position and
        not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus",
                      function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus",
                      function(c) c.border_color = beautiful.border_normal end)
-- }}}
