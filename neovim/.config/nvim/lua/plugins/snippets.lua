--[[--
File              : snippets.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 19.09.2021
Last Modified Date: 23.09.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
--
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

ls.snippets = {
    cpp = {
        s({
            trig = "cout",
            name = "cout",
            dscr = "cout",
            docstring = "std::cout << 1 << std::endl"
        }, {t("std::cout << "), i(1, "PRINT"), t(" << std::endl;")}), s({
            trig = "debug",
            name = "debug",
            dscr = "cout current line",
            docstring = "std::cout << 1 << std::endl"
        }, {t("std::cout << \"DEBUG: Line \" <<__LINE__ << std::endl;")}), s({
            trig = "fori",
            name = "normal for loop",
            dscr = "for loop",
            docstring = "for(1 2=3;4 5 6;7){8}"
        }, {
            t("for ("), i(1, "int"), t(" "), i(2, "i"), t("="), i(3, "0"),
            t(";"), i(4, "i"), i(5, "<"), i(6, "N"), t(";"), i(7, "i++"),
            t({"){", "   "}), i(8, "LOOP"), t({"", "}"})
        })
    },
    -- latex snipptes
    tex = {
        --
        -- misc
        --
        s({
            trig = "ch",
            name = "Chapter",
            dscr = "Chapter header",
            docstring = "\\chapter{1}\n\\label{ch:2}"
        }, {
            t("\\chapter{"), i(1, "CHAPTER"), t({"}", "\\label{ch:"}),
            i(2, "LABEL"), t("}")
        }), s({
            trig = "sec",
            name = "Section",
            dscr = "Section header",
            docstring = "\\section{1}\n\\label{sec:2}"
        }, {
            t("\\section{"), i(1, "SECTION"), t({"}", "\\label{sec:"}),
            i(2, "LABEL"), t("}")
        }), s({
            trig = "cref",
            name = "cref",
            dscr = "Clever Reference",
            docstring = "\\cref{1}"
        }, {t("\\cref{"), i(1, "REF"), t("}")}), s({
            trig = "si",
            name = "SI",
            dscr = "Insert value with units",
            docstring = "\\SI{1}{2}"
        }, {t("\\SI{"), i(1, "VALUE"), t("}{"), i(2, "UNIT"), t("}")}), s({
            trig = "sirange",
            name = "SIrange",
            dscr = "Insert range with units",
            docstring = "\\SIrange{1}{2}{3}"
        }, {
            t("\\SIrange{"), i(1, "START"), t("}{"), i(2, "STOP"), t("}{"),
            i(3, "UNIT"), t("}")
        }), --
        --
        -- math objects
        -- 
        s({
            trig = "frac",
            name = "Fraction",
            dscr = "Insert Fraction",
            docstring = "\\frac{ 1 }{ 2 }"
        }, {
            t("\\frac{"), i(1, "NUMERATOR"), t("}{"), i(2, "DENOMINATOR"),
            t("}"), i(0)
        }),
        s(
            {
                trig = "expval",
                name = "Expectation value",
                docstring = "\\expval{1}"
            }, {t("\\expval{ "), i(1), t(" }")}), -- 
        --
        -- brackets
        --
        s({
            trig = "rb",
            name = "round brackets",
            dscr = "Insert Round brackets",
            docstring = "\\left( 1 \\right)"
        }, {t("\\left( "), i(0), t(" \\right)")}), s({
            trig = "sb",
            name = "square brackets",
            dscr = "Insert square brackets",
            docstring = "\\left[ 1 \\right]"
        }, {t("\\left[ "), i(0), t(" \\right]")}), --
        --
        -- environments
        --
        s({
            trig = "eq",
            name = "equation",
            dscr = "Equation environment",
            docstring = "\\begin{equation}\n    1\n\\label{2}\n\\end{equation}"
        }, {
            t({"\\begin{equation}", "    "}), i(1), t({"", "\\label{eq:"}),
            i(2, "LABEL"), t({"}", "\\end{equation}"})
        }), s({
            trig = "al",
            name = "align",
            dscr = "align environment",
            docstring = "\\begin{align}\n    1\n\nlabel{2}\\end{align}"
        }, {
            t({"\\begin{align}", "    "}), i(1), t({"", "\\label{eq:"}),
            i(2, "LABEL"), t({"}", "\\end{align}"})
        }), s({
            trig = "fig",
            name = "figure",
            dscr = "Figure environment",
            docstring = "\\begin{figure}[htpb]\n\\includegraphics[width=0.8\\linewidth]{1}\n\\caption[2]{3}\n\\label{4}"
        }, {
            t({
                "\\begin{figure}[htpb]", "  \\centering",
                "   \\includegraphics[width=0.8\\linewidth]{"
            }), i(1), t({"}", "\\caption["}), i(2, "SHORTCAPTION"), t("]{"),
            i(3, "LONGCAPTION"), t({"}", "\\label{fig:"}), i(4, "LABEL"),
            t({"}", "\\end{figure}"})
        }), s({
            trig = "subfloat",
            name = "Subfloat",
            dscr = "Figure enviroment with subfloats",
            docstring = "FUN"
        }, {
            t({"\\begin{figure}[htpb]", "   \\centering", "    \\subfloat["}),
            i(1, "SHORTCAPTION"), t("]{\\includegraphics[width="), i(2, "0.5"),
            t("\\linewidth]{"), i(3, "FILENAME"), t({"}}", "\\label{fig:"}),
            i(4, "LABEL"), t({"}", "\\caption["}), i(5, "SHORTCAPTION"),
            t("]{"), i(6, "LONGCAPTION"), t({"}", "\\end{figure}"})
        })
    }
}
