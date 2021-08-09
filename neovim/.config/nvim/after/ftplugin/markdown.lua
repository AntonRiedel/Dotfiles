--[[--
File              : markdown.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 09.08.2021
Last Modified Date: 09.08.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
-- settings for markdown files
-- set tabwidth
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

-- set make program
vim.bo.makeprg = "pandoc % -o %:r.pdf"
