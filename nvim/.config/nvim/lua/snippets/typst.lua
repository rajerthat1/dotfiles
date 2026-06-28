local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("eqn", {
    t("#math.equation(block: true, $"),
    i(1),
    t("$)"),
  }),

  s("fmg", {
    t("#figure("),
    t({ "", '  image("' }),
    i(1, "path"),
    t('", width: '),
    i(2, "100"),
    t("%),"),
    t({ "", "  caption: [" }),
    i(3, "caption"),
    t({ "]", ")" }),
  }),

  s("fbi", {
    t("#figure("),
    t({ "", '  box(stroke: 1pt, image("' }),
    i(1, "path"),
    t('", width: '),
    i(2, "100"),
    t("%)),"),
    t({ "", "  caption: [" }),
    i(3, "caption"),
    t({ "]", ")" }),
  }),

  s("ftb", {
    t({ "#figure(", "  table(", "    columns: 2,", "    align: center,", "    [" }),
    i(1, ""),
    t("], ["),
    i(2, ""),
    t({ "],", "    [" }),
    i(3, ""),
    t("], ["),
    i(4, ""),
    t({ "],", "  ),", "  caption: [" }),
    i(5, ""),
    t({ "]", ")" }),
  }),

  s("cbk", {
    t({ "```", "" }),
    i(1),
    t({ "", "```" }),
  }),
}
