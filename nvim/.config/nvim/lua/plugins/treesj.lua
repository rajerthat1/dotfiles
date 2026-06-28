return {
  {
    "Wansmer/treesj",
    keys = {
      {
        "<space>tt",
        function()
          require("treesj").toggle()
        end,
        desc = "Toggle split/join",
      },
      {
        "<space>tj",
        function()
          require("treesj").join()
        end,
        desc = "Join",
      },
      {
        "<space>ts",
        function()
          require("treesj").split()
        end,
        desc = "Split",
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({ use_default_keymaps = false })
    end,
  },
}
