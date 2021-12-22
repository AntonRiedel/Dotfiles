--[[--
File              : markdown.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 22.12.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
vim.bo.makeprg = "pandoc % -o %:r.pdf"

vim.bo.spelllang = "en_us,de"
vim.wo.spell = true
