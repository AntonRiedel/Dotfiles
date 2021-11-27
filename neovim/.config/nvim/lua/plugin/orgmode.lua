if packer_bootstrap then return end

require('orgmode').setup({org_agenda_files = {'$HOME/nextcloud/org'}})
