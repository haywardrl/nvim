return {
  {
    'echasnovski/mini.nvim',
    enabled = true,
    config = function()
      require('config.plugins.mini.statusline')
      require('config.plugins.mini.comment')
      require('config.plugins.mini.icons')
      require('config.plugins.mini.pairs')
    end
  }
}
