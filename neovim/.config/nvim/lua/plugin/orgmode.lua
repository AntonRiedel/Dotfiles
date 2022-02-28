--[[--
File              : orgmode.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 23.02.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
if packer_bootstrap then return end

require('orgmode').setup_ts_grammar()

require('orgmode').setup({
    org_agenda_files = {'~/nextcloud/org/*'},
    org_default_notes_file = '~/nextcloud/org/default.org'
})

