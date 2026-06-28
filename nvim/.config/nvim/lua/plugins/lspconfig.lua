return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.diagnostic.config({
      -- virtual_text = true,
    })
    vim.lsp.enable("clangd")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("rust_analyzer")
    vim.lsp.enable("dartls")
    vim.lsp.enable("tinymist")
    vim.lsp.enable("asm_lsp")
  end,
}
