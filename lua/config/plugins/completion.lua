return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
      keymap = { preset = 'default' }, -- uses ins-completion -> <C-n>/<C-p>/<C-y>
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      signature = { enabled = true },
      completion = {
        documentation = {
          auto_show = true,          -- keep false if you don't want it to show automatically
          auto_show_delay_ms = 5000, -- set the delay to 500ms
        },
      },
    },
  },
}
