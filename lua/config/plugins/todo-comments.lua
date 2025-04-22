return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  -- Keymaps
  vim.keymap.set("n", "<space>tt", "<cmd>TodoTelescope<CR>", { desc = "List all todos in current working directory" }),
  vim.keymap.set("n", "<space>tn", "<cmd>TodoTelescope cwd=~/notes<CR>", { desc = "List todos in notes" })
}
