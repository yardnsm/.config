local util = require("lspconfig.util")

return {
  single_file_support = false,
  root_dir = util.root_pattern("nx.json", "tsconfig.json", "package.json", "jsconfig.json", ".git"),

  plugins = {
    {
      name = "@monodon/typescript-nx-imports-plugin",
      location = "~/.local/share/npm/lib/node_modules/@monodon/typescript-nx-imports-plugin/src/index.js",
    },
  },

  init_options = {
    hostInfo = "neovim",
    plugins = {
      {
        name = "typescript-nx-imports-plugin",
        location = "~/.local/share/npm/lib/node_modules/@monodon/typescript-nx-imports-plugin/src/index.js",
      },
    },
    preferences = {
      includeCompletionsForModuleExports = true,
      includeCompletionsForImportStatements = true,
      -- importModuleSpecifierPreference = "non-relative",
    },
  },
  settings = {
    typescript = {
      preferences = {
        includeCompletionsForModuleExports = true,
        includeCompletionsForImportStatements = true,
        -- importModuleSpecifier = "non-relative",
      },
    },
  },
}
