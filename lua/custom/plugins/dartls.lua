return {
  require('lspconfig').dartls.setup {
    on_attach = function(client, bufnr)
      client.server_capabilities.colorProvider = false
    end,
    cmd = { 'dart', 'language-server', '--protocol=lsp' },
    filetypes = { 'dart' },
  },
}
