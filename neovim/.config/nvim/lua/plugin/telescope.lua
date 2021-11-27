if packer_bootstrap then return end

require('telescope').setup {
    defaults = {
        mappings = {i = {['<C-q>'] = "send_to_qflist"}},
        vimgrep_arguments = {
            'rg', '--color=never', '--no-heading', '--with-filename',
            '--line-number', '--column', '--smart-case'
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {prompt_position = "top"},
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        path_display = {'absolute', 'tail'},
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new
    }
}

-- keybindings for telescope
local options = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>',
                        options)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>',
                        options)
vim.api
    .nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>fl',
                        '<cmd>Telescope current_buffer_fuzzy_find<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>fw', '<cmd>Telescope grep_string<CR>',
                        options)
vim.api.nvim_set_keymap('n', '<leader>fs',
                        '<cmd>Telescope lsp_document_symbols<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>gi',
                        '<cmd>Telescope lsp_implementations<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>gd', '<cmd>Telescope lsp_definitions<CR>',
                        options)