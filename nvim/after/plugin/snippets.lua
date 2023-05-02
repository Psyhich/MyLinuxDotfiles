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
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet

vim.keymap.set("i", "<C-i>",
	function ()
		local ls = require("luasnip")
		if ls.expand_or_jumpable() then
			ls.expand_or_jump()
		end
	end, { silent = true, expr = true})

-- Snippets are created by:
-- s(trigger:string, nodes:table)
ls.add_snippets("all", {
	s("ternary", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	})
})
ls.add_snippets("all", {
	s("if", {
		t("if ("), i(1, "condition"), t({")",
			"{",
				"\t"}), i(2, "statement"),
		t({"", "}"})
	})
})

ls.add_snippets("cmake", {
	s("cmake_project", {
		t({"cmake_minimum_required(VERSION 3.22)", "",
			"project("}), i(1), t({")", "", ""}),
		t({
			"set(CMAKE_CXX_STANDARD 20)",
			"set(CMAKE_CXX_STANDARD_REQUIRED TRUE)",
			"",
			"list(APPEND CMAKE_MODULE_PATH \"${CMAKE_BINARY_DIR}\")",
			"list(APPEND CMAKE_PREFIX_PATH \"${CMAKE_BINARY_DIR}\")",
			"",
			"add_executable(\"${PROJECT_NAME}\"", ""
		}),
		i(2), t({")", ""})
	})
})

ls.add_snippets("tex", {
	s("figure", {
		t({
			"\\begin{figure}[H]",
			"\t\\centering",
			"\t\\includegraphics[width=10cm]{"
		}),
		i(1),
		t({
			"}",
			"\t\\caption{"
		}),
		i(2),
		t({
			"}",
			"\\end{figure}"
		}),
	})
})

ls.add_snippets("tex", {
	s("emph", {
		t("\\emph{"), i(1), t("}")
	})
})
