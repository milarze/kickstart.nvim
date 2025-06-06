return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  config = function()
    require('flutter-tools').setup {
      decorations = {
        statusline = {
          app_version = true,
          device = true,
        },
      },
      dev_tools = {
        autostart = true, -- autostart devtools server if not detected
        auto_open_browser = true, -- Automatically opens devtools in the browser
      },
      lsp = {
        color = { -- show the derived colours for dart variables
          enabled = false, -- disabling color provider that's causing errors
        },
      },
    }
    require('telescope').load_extension 'flutter'
  end,
}
