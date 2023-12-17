local utils = require("yardnsm.utils")

-- vim-closer replacement
-- https://github.com/rstacruz/vim-closer/blob/master/autoload/closer.vim
local get_closing_for_line = function(line)
  local i = -1
  local clo = ""

  -- TODO replicate the auto semicolon insertion

  while true do
    i, _ = string.find(line, "[%(%)%{%}%[%]]", i + 1)
    if i == nil then
      break
    end
    local ch = string.sub(line, i, i)
    local st = string.sub(clo, 1, 1)

    if ch == "{" then
      clo = "}" .. clo
    elseif ch == "}" then
      if st ~= "}" then
        return ""
      end
      clo = string.sub(clo, 2)
    elseif ch == "(" then
      clo = ")" .. clo
    elseif ch == ")" then
      if st ~= ")" then
        return ""
      end
      clo = string.sub(clo, 2)
    elseif ch == "[" then
      clo = "]" .. clo
    elseif ch == "]" then
      if st ~= "]" then
        return ""
      end
      clo = string.sub(clo, 2)
    end
  end

  return clo
end

return {
  {
    "windwp/nvim-autopairs",

    opts = {
      check_ts = true,
      map_bs = false,
      enable_moveright = false,
      enable_afterquote = false,
    },

    config = function(_, opts)
      local autopairs = require("nvim-autopairs")

      local Rule = require("nvim-autopairs.rule")
      local cond = require("nvim-autopairs.conds")

      autopairs.setup(opts)

      -- Remove for quotes
      autopairs.remove_rule('"')
      autopairs.remove_rule("`")
      autopairs.remove_rule("'")

      -- Make every rule happend only on <CR>, similarly to vim-closer.
      local pairs = {
        '"""',
        "```",
      }

      for _, rule in ipairs(autopairs.config.rules) do
        if utils.has_value(pairs, rule.start_pair) then
          rule:end_wise()
        end
      end

      autopairs.remove_rule("(")
      autopairs.remove_rule("{")
      autopairs.remove_rule("[")

      autopairs.add_rule(Rule("[%(%{%[]", "")
        :use_regex(true)
        :replace_endpair(function(o)
          return get_closing_for_line(o.line)
        end)
        :end_wise(function(o)
          -- Do not endwise if there is no closing
          return get_closing_for_line(o.line) ~= ""
        end))
    end,
  },
}
