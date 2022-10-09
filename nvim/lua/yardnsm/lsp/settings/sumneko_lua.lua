-- https://gist.github.com/folke/fe5d28423ea5380929c3f7ce674c41d8

local library = {}
local runtime_path = vim.split(package.path, ";")

table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local function add(lib)
  for _, p in pairs(vim.fn.expand(lib, false, true)) do
    p = vim.loop.fs_realpath(p)
    library[p] = true
  end
end

-- Add runtime
add("$VIMRUNTIME/lua")

-- Add your config
add(vim.fn.stdpath("config") .. "/lua")

-- Add plugins - THIS MAY MAKE THE SERVER'S START TIME SLOW!!!
-- add(vim.fn.stdpath("config") .. '/plugged/*/lua')

return {
  settings = {

    Lua = {
      runtime = {
        version = "LuaJIT",
        path = runtime_path,
      },

      diagnostics = {
        globals = { "vim" },
      },

      workspace = {
        library = library,
      },

      telemetry = {
        enable = false,
      },
    },
  },
}
