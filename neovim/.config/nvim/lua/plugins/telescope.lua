--[[--
File              : telescope.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.04.2021
Last Modified Date: 08.07.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
options = {noremap = true}
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>',
                        options)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>',
                        options)
vim.api
    .nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', options)

require('telescope').setup {layout_strategy = "Center"}
