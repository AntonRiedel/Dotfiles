--[[--
File              : treesitter.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 30.11.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
if packer_bootstrap then return end

-- for orgmode
local parser_config = require"nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
    install_info = {
        url = 'https://github.com/milisims/tree-sitter-org',
        revision = 'main',
        files = {'src/parser.c', 'src/scanner.cc'}
    },
    filetype = 'org'
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c", "cpp", "python", "bash", "latex", "lua", "rust", "org"
    },
    highlight = {enable = true, additional_vim_regex_highlighting = false},
    indent = {enable = true}
}
