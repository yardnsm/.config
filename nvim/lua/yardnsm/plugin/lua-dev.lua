local status_ok, lua_dev = pcall(require, "lua-dev")
if not status_ok then
  return
end

lua_dev.setup()
