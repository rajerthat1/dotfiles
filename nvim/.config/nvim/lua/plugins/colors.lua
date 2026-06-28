return {
  {
    "reobin/olive-crt.nvim",
    lazy = true,
    priority = 0,
  },
  {
    "wtfox/jellybeans.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("jellybeans")
    end,
  },
  {
    "metalelf0/kintsugi-nvim",
    lazy = true,
    priority = 0,
  },
}
