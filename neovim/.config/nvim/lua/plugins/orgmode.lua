--[[--
File              : orgmode.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 01.09.2021
Last Modified Date: 01.09.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
--
require('orgmode').setup({
    org_agenda_files = {'~/nextcloud/org/*'},
    org_default_notes_file = '~/nextcloud/org/default.org'
})
