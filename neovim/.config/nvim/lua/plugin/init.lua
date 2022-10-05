--[[--
File              : init.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 26.09.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]]
--
-- install packer if it is not installed already
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd([[packadd packer.nvim]])
end

return require("packer").startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	-- colorscheme
	use({
		"EdenEast/nightfox.nvim",
		config = function()
			require("plugin/colorscheme")
		end,
	})

	-- statusline
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugin/statusline")
		end,
	})

	-- file headers
	use({
		"alpertuna/vim-header",
		config = function()
			require("plugin/fileheader")
		end,
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugin/treesitter")
		end,
		run = ":TSUpdate",
	})

	use({
		"nvim-neorg/neorg",
		config = function()
			require("plugin/neorg")
		end,
		ft = "norg",
		requires = "nvim-lua/plenary.nvim",
	})

	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("plugin/telescope")
		end,
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
	})

	-- code formatting
	use({
		"mhartington/formatter.nvim",
		config = function()
			require("plugin/format")
		end,
	})

	-- code commenting
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("plugin/comment")
		end,
	})

	-- snippet engine
	use({
		"L3MON4D3/LuaSnip",
		config = function()
			require("snippets")
		end,
		requires = { "rafamadriz/friendly-snippets" },
	})

	-- completion
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugin/completion")
		end,
		requires = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "neovim/nvim-lspconfig" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "windwp/nvim-autopairs" },
		},
	})

	use({
		"kylechui/nvim-surround",
		config = function()
			require("plugin/surround")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugin/gitsigns")
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- terminal integration
	use({
		"numToStr/FTerm.nvim",
		config = function()
			require("plugin/terminal")
		end,
	})

	-- make quickfix even more awesome
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
