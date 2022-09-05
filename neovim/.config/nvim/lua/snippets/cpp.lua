--[[--
File              : cpp.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 01.09.2022
Last Modified Date: 03.09.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]]
--

local mySnippets = {}

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix

-- define snippets for histograms
local genSnippetHist1D = function(histType)
	return
		s(histType, {
		t(string.upper(histType) .. "* "),
		i(1, "HistPointer"),
		t(" = new " .. string.upper(histType) .. '("'),
		i(2, "HistName"),
		t([[","]]),
		i(3, "HistTitle"),
		t([[",]]),
		i(4, "Bins"),
		t(","),
		i(5, "XLow"),
		t(","),
		i(6, "XHigh"),
		t(");"),
		i(0),
	})
end

local Hist1D = { "th1f", "th1d" }
for _, h in ipairs(Hist1D) do
	table.insert(mySnippets, genSnippetHist1D(h))
end

-- snippets for other common root objects
local otherSnippets = {
	s("tfile", {
		t("TFile* "),
		i(1, "FileName"),
		t([[ = new TFile("]]),
		i(2, [[HistName]]),
		t([[","]]),
		i(3, "RECREATE"),
		t([[");]]),
		i(0),
	}),
}

for _, h in ipairs(Hist1D) do
	table.insert(mySnippets, genSnippetHist1D(h))
end

-- return mySnippets + otherSnippets
return mySnippets
