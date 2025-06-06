local lspconfig = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
return {
  lspconfig.dartls.setup {
    capabilities = capabilities,
    cmd = { 'dart', 'language-server', '--protocol=lsp' },
    filetypes = { 'dart' },
    init_options = {
      closingLabels = true,
      flutterOutline = true,
      onlyAnalyzeProjectsWithOpenFiles = true,
      outline = true,
      suggestFromUnimportedLibraries = true
    },
    settings = {
      dart = {
        completeFunctionCalls = true,
        showTodos = true,
        lineLength = 100,
        formatOnSave = true,
        analysisExcludedFolders = { 
          vim.fn.expand('$HOME/.pub-cache'), 
          vim.fn.expand('$HOME/flutter'),
        },
      }
    },
  },
}
