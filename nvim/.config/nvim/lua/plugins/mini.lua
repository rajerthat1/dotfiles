return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.pairs").setup()
    require("mini.bracketed").setup({
      buffer = { suffix = "", options = {} }, --handled by bufferline
      file = { suffix = "", options = {} }, --treesitter functions
      location = { suffix = "", options = {} }, --treesitter loops
    })
    require("mini.basics").setup({
      mappings = {
        windows = true,
        move_with_alt = true,
      },
    })
    require("mini.move").setup()
    require("mini.surround").setup()
    -- require("mini.cursorword").setup()
    require("mini.diff").setup({
      source = require("mini.diff").gen_source.save(),
    })
  end,
}
