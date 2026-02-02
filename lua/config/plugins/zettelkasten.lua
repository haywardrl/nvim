return {
  {
    'renerocksai/telekasten.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require('telekasten').setup {
        -- Directory setup
        home = vim.fn.expand("~/notes"),
        dailies = "daily",
        templates = vim.fn.expand("~/notes/templates"),
        template_new_note = vim.fn.expand("~/notes/templates/template_new_note.md"),
        template_new_daily = vim.fn.expand("~/notes/templates/template_daily_note.md"),
        -- File extension for notes
        extension = ".md",
        -- Create new note if linking to something not yet created
        follow_creates_nonexisting = true,
      }
      -- Launch panel if nothing is typed after <leader>z
      vim.keymap.set("n", "<leader>n", "<cmd>Telekasten panel<CR>")

      -- Most used functions
      vim.keymap.set("n", "<leader>nf", "<cmd>Telekasten find_notes<CR>")
      vim.keymap.set("n", "<leader>ng", "<cmd>Telekasten search_notes<CR>")
      vim.keymap.set("n", "<leader>nt", "<cmd>Telekasten goto_today<CR>")
      vim.keymap.set("n", "<leader>no", "<cmd>Telekasten follow_link<CR>")
      vim.keymap.set("n", "<leader>nn", "<cmd>Telekasten new_note<CR>")
      vim.keymap.set("n", "<leader>nb", "<cmd>Telekasten show_backlinks<CR>")
      vim.keymap.set("n", "<leader>nI", "<cmd>Telekasten insert_img_link<CR>")

      -- Call insert link automatically when we start typing a link
      vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
    end
  }
}
