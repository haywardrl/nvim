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

      -- find files in the current working directory
      vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files, { desc = "Find Files" })
      -- live grep across the working directory
      vim.keymap.set("n", "<space>sd", require('telescope.builtin').live_grep, { desc = "Search Directory" })
      -- fuzzy search the currently open buffer
      vim.keymap.set("n", "<space>sb", require('telescope.builtin').current_buffer_fuzzy_find, { desc = "Search Buffer" })
      -- find recent command
      vim.keymap.set("n", "<space>oc", require('telescope.builtin').command_history, { desc = "Command History" })
      -- find man page
      vim.keymap.set("n", "<space>om", require('telescope.builtin').man_pages, { desc = "Man Pages" })
      -- search through the open buffers
      vim.keymap.set("n", "<space>bb", require('telescope.builtin').buffers, { desc = "List Buffers" })
      -- open keymaps
      vim.keymap.set("n", "<space>ok", require('telescope.builtin').keymaps, { desc = "Keymaps" })
      -- find help documentation using telescope fuzzy finding
      vim.keymap.set("n", "<space>oh", require('telescope.builtin').help_tags, { desc = "Help Tags" })
      -- open the neovim config from anywhere
      vim.keymap.set("n", "<space>en", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end, { desc = "Neovim Config" })
    end
  }
}
