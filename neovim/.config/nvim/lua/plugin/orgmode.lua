--[[--
File              : orgmode.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 30.11.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]]--
if packer_bootstrap then return end

require('orgmode').setup({org_agenda_files = {'$HOME/nextcloud/org'}})
