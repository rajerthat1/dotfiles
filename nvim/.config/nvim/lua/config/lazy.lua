local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.opt.exrc = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.shortmess:append("I")
vim.schedule(function()
  vim.opt.shiftwidth = 4
  vim.opt.relativenumber = true
  vim.opt.tabstop = 4
  vim.opt.undofile = true
  -- vim.opt.cursorline = false
  vim.opt.clipboard = "unnamedplus"
  vim.opt.guifont = "Mononoki Nerd Font:h16"
  vim.opt.foldlevel = 99
  vim.opt.foldlevelstart = 99
  vim.opt.foldenable = true
  vim.opt.wrap = true
end)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = false },
})
