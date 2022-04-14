--[[--
File              : treesitter.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 14.04.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
if packer_bootstrap then return end

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c", "cpp", "python", "bash", "lua", "rust", "latex"
    },
 -- "org"
    highlight = {enable = true, additional_vim_regex_highlighting = false},
    indent = {enable = true}
}
