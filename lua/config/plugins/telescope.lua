return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
        defaults = {
          -- Default configuration for telescope goes here:
          -- config_key = value,
          mappings = {
            i = {
              -- map actions.which_key to <C-h> (default: <C-/>)
              -- actions.which_key shows the mappings for your picker,
              -- e.g. git_{create, delete, ...}_branch for the git_branches picker
              ["<C-h>"] = "which_key"
            }
          }
        },
        pickers = {
          find_files = {
            theme = "ivy"
          },
          buffers = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {}
        }
      }
      require('telescope').load_extension('fzf')

      -- FIND --

      -- find files in the current working directory
      vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files, { desc = "Find Files" })
      -- live grep across the working directory
      vim.keymap.set("n", "<space>fg", require('telescope.builtin').live_grep, { desc = "Search Directory" })
      -- fuzzy search the currently open buffer
      vim.keymap.set("n", "<space>fb", require('telescope.builtin').current_buffer_fuzzy_find, { desc = "Search Buffer" })
      -- search through the open buffers
      vim.keymap.set("n", "<space>bb", require('telescope.builtin').buffers, { desc = "List Buffers" })

      -- LSP --

      -- find definition of the word under cursor
      vim.keymap.set("n", "gd", require('telescope.builtin').lsp_definitions, { desc = "LSP Definition" })
      -- find references for word under cursor
      vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, { desc = "LSP References" })
      -- lists lsp document symbols in the current buffer
      vim.keymap.set("n", "<space>cs", require('telescope.builtin').lsp_document_symbols, { desc = "Document Symbols" })
      -- lists lsp document symbols in the current workspace
      vim.keymap.set("n", "<space>cw", require('telescope.builtin').lsp_workspace_symbols, { desc = "Workspace Symbols" })
      -- lists diagnostics in all open buffers
      vim.keymap.set("n", "<space>cd", require('telescope.builtin').diagnostics, { desc = "Diagnostics" })
      -- lists lsp document symbold in the current workspace
      vim.keymap.set("n", "<space>ct", require('telescope.builtin').lsp_type_definitions, { desc = "Type Definition" })

      -- GENERAL --

      -- find recent command
      vim.keymap.set("n", "<space>oc", require('telescope.builtin').command_history, { desc = "Command History" })
      -- find man page
      vim.keymap.set("n", "<space>om", require('telescope.builtin').man_pages, { desc = "Man Pages" })
      -- open keymaps
      vim.keymap.set("n", "<space>ok", require('telescope.builtin').keymaps, { desc = "Keymaps" })
      -- find help documentation using telescope fuzzy finding
      vim.keymap.set("n", "<space>oh", require('telescope.builtin').help_tags, { desc = "Help Tags" })
      -- open the neovim config from anywhere
      vim.keymap.set("n", "<space>on", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end, { desc = "Neovim Config" })
    end
  }
}
