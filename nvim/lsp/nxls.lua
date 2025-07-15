return {
  -- cmd = { "nxls", "--stdio", "--nolazy", "--inspect-brk" },
  cmd = { "nxls", "--stdio" },

  init_options = {
    workspacePath = vim.fn.getcwd(),
  },

  handlers = {
    -- vim.lsp.buf_request_sync(0, "nx/version", {}, 1000)
    ["nx/version"] = function(err, result, ctx, config)
      print(vim.inspect(result))
    end,
  },
}
