local lspconfig = require 'lspconfig'
return {
  lspconfig.dartls.setup {
    cmd = { vim.fn.exepath 'dart', 'language-server', '--protocol=lsp' },
    filetypes = { 'dart' },
    init_options = {
      closingLabels = true,
      flutterOutline = true,
      onlyAnalyzeProjectsWithOpenFiles = true,
      outline = true,
      suggestFromUnimportedLibraries = true,
    },
    settings = {
      dart = {
        completeFunctionCalls = true,
        showTodos = true,
        lineLength = 100,
        formatOnSave = true,
        analysisExcludedFolders = {
          vim.fn.expand '$HOME/.pub-cache',
          vim.fn.expand '$HOME/flutter',
        },
      },
    },
  },
}
