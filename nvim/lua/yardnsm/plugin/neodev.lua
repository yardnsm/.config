local status_ok, neodev = pcall(require, "lua-dev")
if not status_ok then
  return
end

neodev.setup()
