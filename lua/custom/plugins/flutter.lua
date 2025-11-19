return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  config = function()
    require('flutter-tools').setup {
      flutter_lookup_cmd = 'asdf where flutter',
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
        color = {
          enabled = false,
        },
        settings = {
          dart = {
            analysisExcludedFolders = {
              vim.fn.expand '$HOME/.pub-cache',
              vim.fn.expand '$HOME/flutter',
            },
            completeFunctionCalls = true,
            showTodos = true,
            lineLength = 100,
          },
        },
      },
    }
    require('telescope').load_extension 'flutter'
  end,
}
