local manual_install = {}

local servers = {
  pyright = {},
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
  ocamllsp = {},
  terraformls = {},
}

return {
  servers = servers,
  manual_install = manual_install,
}
