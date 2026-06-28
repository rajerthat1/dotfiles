return {
  "stevearc/conform.nvim",
  opts = {},
  keys = {
    {
      "<leader>fk",
      function()
        require("conform").format()
      end,
      desc = "Code Indent",
    },
  },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        cpp = { "clang-format" },
        c = { "clang-format" },
        rust = { "rustfmt" },
        dart = { "dart_format" },
        asm = { "asmfmt" },
        typst = { "typstyle" },
        json = { "jq" },
      },
    })
  end,
}
