local utils = require("yardnsm.utils")
local on_attach = require("yardnsm.lsp").on_attach

local enable_nx_imports_plugin = true

return {
  root_markers = { "nx.json", "tsconfig.json", "package.json", "jsconfig.json", ".git" },

  settings = {
    typescript = {
      tsserver = {
        maxTsServerMemory = 8192,
        -- log = "verbose",
      },
    },

    vtsls = {
      tsserver = {
        -- In vtsls directory:
        -- npm install @monodon/typescript-nx-imports-plugin
        globalPlugins = {
          {
            name = "@monodon/typescript-nx-imports-plugin",
            enableForWorkspaceTypeScriptVersions = true,
          },
        },
      },
    },
  },

  ---@param client vim.lsp.Client
  on_init = function(client)
    -- Disble semantic tokens
    client.server_capabilities.semanticTokensProvider = nil
  end,

  ---@param client vim.lsp.Client
  ---@param bufnr number
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    -- This is an adaptation of the following, in order to support auto-completion of imports from
    -- other nx libraries in the same workspace:
    -- https://github.com/nrwl/nx-console/blob/master/libs/vscode/typescript-plugin/src/lib/typescript-plugin.ts

    -- TODO re-configure the plugin when opening .ts{,x} files
    -- TODO re-configure the plugin when ${workspaceRoot} changes
    -- TODO re-configure the plugin when some tsconfig.base.json changes

    if not enable_nx_imports_plugin then
      return
    end

    local TSCONFIG_BASE = "tsconfig.base.json"
    local TSCONFIG_LIB = "tsconfig.lib.json"

    local Path = require("plenary.path")

    -- local root_dir = client.root_dir
    local root_dir = vim.fs.root(client.root_dir, { "nx.json" })

    ---@type Path
    local workspaceRoot = Path:new(root_dir)
    ---@type Path
    local workspaceConfig = workspaceRoot:joinpath(TSCONFIG_BASE)

    if not workspaceConfig:exists() then
      return
    end

    local status_ok, tsconfig = pcall(vim.json.decode, workspaceConfig:read() or "")
    if not status_ok then
      return
    end

    -- TODO take tsconfig.json if tsconfig.compilerOptions == nil
    if tsconfig.compilerOptions == nil then
      return
    end

    local externalFiles = {}
    local paths = tsconfig.compilerOptions.paths or {}

    for _, ps in pairs(paths) do
      for _, p in ipairs(ps) do
        local mainFile = workspaceRoot:joinpath(p).filename
        local directory = vim.fs.root(workspaceRoot:joinpath(p).filename, { TSCONFIG_LIB })

        if directory == nil then
          goto continue
        end

        if utils.ends_with(mainFile, "/*") or utils.ends_with(mainFile, "\\*") then
          local files = vim.fs.find(function(name, path)
            return name:match(".*%.tsx?$") and not path:match(".*node_modules.*")
          end, { limit = math.huge, type = "file", path = vim.fs.dirname(mainFile) })

          for _, file in ipairs(files) do
            table.insert(externalFiles, { mainFile = file, directory = directory })
          end

          goto continue
        end

        table.insert(externalFiles, { mainFile = mainFile, directory = directory })

        ::continue::
      end
    end

    vim.schedule(function()
      require("fidget").notify("Configured typescript-nx-imports-plugin with " .. #externalFiles .. " files")

      vim.lsp.buf.execute_command({
        command = "_typescript.configurePlugin",
        arguments = {
          "@monodon/typescript-nx-imports-plugin",
          {
            externalFiles = externalFiles,
          },
        },
      })
    end)
  end,
}
