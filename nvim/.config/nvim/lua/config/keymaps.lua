vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })

local cses = vim.fn.expand("~/Documents/cses")
vim.keymap.set(
  "n",
  "<leader>r1",
  ":!g++-15 -std=c++20 -O2 -Wall -o " .. cses .. "/main % && timeout 1s " .. cses .. "/main < " .. cses .. "/inp<CR>",
  { desc = "Compile and Run with inp" }
)

vim.keymap.set("n", "<leader>w", function()
  local ok, conform = pcall(require, "conform")
  if ok then
    conform.format({ async = false, lsp_fallback = true })
  else
    vim.lsp.buf.format({ async = false })
  end
  vim.cmd("write")
end, { desc = "Format and Save" })

-- vim.keymap.set({ "n", "x", "o" }, "<TAB>", function()
--   if vim.treesitter.get_parser(nil, nil, { error = false }) then
--     require("vim.treesitter._select").select_parent(vim.v.count1)
--   else
--     vim.lsp.buf.selection_range(vim.v.count1)
--   end
-- end, { desc = "Select parent treesitter node" })
--
-- vim.keymap.set({ "n", "x", "o" }, "<S-TAB>", function()
--   if vim.treesitter.get_parser(nil, nil, { error = false }) then
--     require("vim.treesitter._select").select_child(vim.v.count1)
--   else
--     vim.lsp.buf.selection_range(-vim.v.count1)
--   end
-- end, { desc = "Select child treesitter node" })
