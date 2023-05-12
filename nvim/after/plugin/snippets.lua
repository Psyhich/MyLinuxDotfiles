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

local function reuse(args, _, reuse_arg)
    return "" .. args[reuse_arg][1]
end
ls.add_snippets("cpp",
{
	s("ternary", {
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	}),
	s("if",
	{
		t("if ("), i(1, "condition"), t({")",
			"{",
				"\t"}), i(0, "statement"), t({";",
			"}"})
	}),
	s("for",
	{
		t("for ("), i(1), t("; "), i(2), t("; "), i(3), t({")",
		"{", "\t"}),
			i(0), t({";",
		"}"})

	}),
	s("foreach",
	{
		t("for ("), i(1), t(" : "), i(2), t({")",
		"{", "\t"}),
			i(0), t({";",
		"}"})

	}),
	s("while",
	{
		t("while ("), i(1), t({")",
		"{", "\t"}),
			i(0), t({";",
		"}"})

	}),
	s("dowhile",
	{
		t({"do",
		"{",
			"\t"}), i(0), t({";",
		"} while ("}), i(1), t(")")
	}),
	s("main",
	{
		t({"int main(int argc, char **argv)",
		"{",
			"\t"}), i(0), t({";",
		"}"})
	}),
	s("class",
	{
		t("class "), i(1), t({"",
		"{",
		"public:",
			"\t"}), f(reuse, {1}, {user_args = {1}}), t({"() = default;",
			"\t~"}), f(reuse, {1}, {user_args = {1}}), t({"() = default;",
		"};"})
	}),
	s("function",
	{
		i(1, "return"), t(" "), i(2, "name"), t("("), i(3, "vars"), t({")",
		"{",
			"\t"}), i(0, "body"), t({";",
		"}"})
	}),
	s("#include<>",
	{
		t("#include <"), i(0), t(">")
	}),
	s("#include\"\"",
	{
		t("#include \""), i(0), t("\"")
	}),
	s("#ifndef",
	{
		t("#ifndef "), i(1), t({"",
		"#define "}), f(reuse, {1}, {user_args = {1}}), t({"",
		"#endif // "}), f(reuse, {1}, {user_args = {1}})
	}),
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

ls.add_snippets("text",
{
	s("conanfile",
	{
		t({"[requires]",
		""}), i(1, "requires"), t({"",
		"[generators]",
		""}), i(0, "generators")
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
	}),
	s("emph", {
		t("\\emph{"), i(1), t("}")
	})
})
