return {
  "saghen/blink.cmp",
  version = "1.*",
  opts = {
    snippets = {
      preset = "luasnip",
    },
    keymap = {
      preset = "default",
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    cmdline = {
      completion = {
        menu = {
          auto_show = true,
        },
      },
      enabled = true,
    },
    completion = {
      documentation = {
        auto_show = true,
      },
    },
    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
    signature = {
      enabled = true,
    },
  },
}
