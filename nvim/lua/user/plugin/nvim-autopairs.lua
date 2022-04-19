local status_ok, autopairs = pcall(require, "nvim-autopairs")
local utils                = require("user.utils")
if not status_ok then
  return
end

local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

autopairs.setup({
  check_ts = true,
  map_bs = false,
  enable_moveright = false,
  enable_afterquote = false,
})

-- Remove for quotes
autopairs.remove_rule('"')
autopairs.remove_rule('`')
autopairs.remove_rule("'")

-- Make every rule happend only on <CR>, similarly to vim-closer.
local pairs = {
  '(',
  '[',
  '{',
  '"""',
  '```',
}

for _, rule in ipairs(autopairs.config.rules) do
  if utils.has_value(pairs, rule.start_pair) then
    rule:end_wise()
  end
end

-- Additional for JS / Lua shit
autopairs.add_rules({
  Rule('[[', ']]'):end_wise(),
  Rule('({', '})'):end_wise(),
  Rule('{(', ')}'):end_wise(),
})
