local manual_install = {
  ocamllsp = {},
}

local servers = {
  pyright = {
    on_new_config = function(config, root_dir)
      -- Try to find .venv in the project root first
      local venv_path = root_dir .. '/.venv/bin/python'
      if vim.fn.filereadable(venv_path) == 1 then
        config.settings.python.pythonPath = venv_path
      else
        -- Fallback to global python
        config.settings.python.pythonPath = vim.fn.exepath('python3')
      end
    end,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = 'workspace',
          useLibraryCodeForTypes = true,
        },
      },
    },
  },
  rust_analyzer = {},
  ts_ls = {},

  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
  ruby_lsp = {},
  eslint = {},
  vuels = {},
  gopls = {},
  stimulus_ls = {},
  terraformls = {},
  svelte = {},
}

return {
  servers = servers,
  manual_install = manual_install,
}
