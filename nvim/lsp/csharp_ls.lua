local status_ok  = pcall(require, "csharpls_extended")
if not status_ok then
  return
end

return {
  handlers = {
    ["textDocument/definition"] = require("csharpls_extended").handler,
    ["textDocument/typeDefinition"] = require("csharpls_extended").handler,
  },
}
