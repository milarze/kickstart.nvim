return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'saghen/blink.cmp',
  },
  config = function()
    local server_config = require 'custom.plugins.lsp.servers'
    local setup_keymaps = require 'custom.plugins.lsp.keymaps'
    local setup_diagnostics = require 'custom.plugins.lsp.diagnostics'

    setup_keymaps()
    setup_diagnostics()

    local capabilities = require('blink.cmp').get_lsp_capabilities()

    local ensure_installed = vim.tbl_filter(function(name)
      return not vim.tbl_contains(server_config.manual_install, name)
    end, vim.tbl_keys(server_config.servers))

    vim.list_extend(ensure_installed, {
      'stylua',
    })

    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      ensure_installed = {},
      automatic_installation = false,
      automatic_enable = true,
      handlers = {
        function(server_name)
          local server = server_config.servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          vim.lsp.config(server_name, server)
        end,
      },
    }

    for _, server_name in ipairs(server_config.manual_install) do
      local server = server_config.servers[server_name] or {}
      server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      vim.lsp.config(server_name, server)
      vim.lsp.enable(server_name)
    end
  end,
}
