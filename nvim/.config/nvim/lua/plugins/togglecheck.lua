return {
  "opdavies/toggle-checkbox.nvim",
  ft = { "markdown" },
  config = function()
    vim.keymap.set("n", "<leader>tp", require("toggle-checkbox").toggle, { desc = "Toggle Markdown Checkbox" })
  end,
}
