local M = {}

function M.toggle()
  local bufnr = vim.api.nvim_get_current_buf()
  local state = vim.g.focus_mode

  if state then
    vim.g.focus_mode = false

    pcall(vim.cmd, "TSBufEnable highlight")

    vim.diagnostic.enable(true, { bufnr = bufnr })

    vim.b.completion = nil

    vim.schedule(function()
      pcall(vim.cmd, "edit")
    end)

    print("Focus mode off")
  else
    vim.g.focus_mode = true

    pcall(vim.cmd, "TSBufDisable highlight")

    vim.diagnostic.enable(false, { bufnr = bufnr })

    vim.b.completion = false
    pcall(require("blink.cmp").cancel)

    for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
      client:stop()
    end

    print("Focus mode on - no help")
  end
end

vim.api.nvim_create_user_command("FocusToggle", M.toggle, {})
vim.keymap.set("n", "<leader>uf", M.toggle, { desc = "Toggle Focus Mode" })

return M
