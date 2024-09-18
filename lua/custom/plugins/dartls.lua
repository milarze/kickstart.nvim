return {
  require('lspconfig').dartls.setup {
    cmd = { 'dart', 'language-server', '--protocol=lsp' },
    filetypes = { 'dart' },
  },
}
