---@type LineManager
local LineManager = require("yardnsm.ui.line.manager")

---@class LineState
---@field winid integer
---@field buf integer
---@field ft string
---@field active boolean wether the current window is active
---@field focused boolean wether the current nvim instance is focused

---@class RendererConfig
---@field ft? string[]
---@field enabled? boolean | fun(state: LineState): boolean
---@field render fun(state: LineState): string

---@class LineConfig
---@field option string
---@field renderers RendererConfig[]

---@class Line
---@field config LineConfig
local Line = {}

---@param config LineConfig
function Line.setup(config)
  local self = setmetatable({}, { __index = Line })
  self.config = config
  self:attach()
end

function Line:attach()
  local option = self.config.option
  LineManager.add(option, self)
  LineManager.setup()
end

function Line:render()
  local winid = vim.g.statusline_winid
  local buf = vim.fn.winbufnr(winid)

  local active = winid == vim.fn.win_getid(vim.fn.winnr())
  local ft = vim.api.nvim_get_option_value("ft", { buf = buf })

  ---@type LineState
  local state = {
    winid = winid,
    buf = buf,
    ft = ft,
    active = active,
    focused = LineManager.focused,
  }

  -- Try to find a suitable renderer
  local selected = nil
  for _, renderer in ipairs(self.config.renderers) do
    -- Use custom enabled function if exists
    if renderer.enabled ~= nil then
      if type(renderer.enabled) == "function" and renderer.enabled(state) then
        selected = renderer
        break
      elseif renderer.enabled == true then
        selected = renderer
        break
      end
    end

    -- Select by ft
    if type(renderer.ft) == "table" then
      if vim.tbl_contains(renderer.ft, ft) then
        selected = renderer
        break
      end
    end
  end

  if selected ~= nil then
    return selected.render(state)
  end

  return ""
end

return Line
