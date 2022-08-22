--[[--
File              : telescope.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 19.08.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]]
--
if packer_bootstrap then
	return
end

require("telescope").setup({
	defaults = {
		mappings = { i = { ["<C-q>"] = "smart_send_to_qflist" } },
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		sorting_strategy = "ascending",
		layout_config = { prompt_position = "top" },
		winblend = 0,
		border = true,
		color_devicons = false,
		path_display = { "smart", "absolute" },
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})
-- load fzf extension
require("telescope").load_extension("fzf")

-- keybindings for telescope
local options = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", options)
