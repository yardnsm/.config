local utils = require("yardnsm.utils")

local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local blink_winhighlights = "Normal:Normal,FloatBorder:BlinkBorder,CursorLine:PmenuSel,Search:None"

return {
  "saghen/blink.cmp",
  lazy = true,

  enabled = true,
  version = '1.*',

  -- Load blink on InsertEnter
  event = "InsertEnter",

  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  ---@type base46.Handler
  setup_base46 = function(c, hi)
    hi.BlinkBorder = { fg = c.one_bg3, bg = c.black }
  end,

  -- use a release tag to download pre-built binaries
  -- version = "v0.*",
  build = "cargo build --release",

  opts_extend = {
    "sources.completion.enabled_providers",
    "sources.compat",
    "sources.default",
  },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",

      ["<C-h>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-j>"] = { "snippet_forward", "select_and_accept", "fallback" },
      ["<C-k>"] = { "snippet_backward", "fallback" },

      -- I like the super-tab thingy
      ["<Tab>"] = {
        function(cmp)
          if cmp.is_menu_visible() then
            cmp.select_next()
            return true
          end
          if not check_backspace() then
            cmp.show()
            return true
          end
        end,
        "fallback",
      },

      ["<S-Tab>"] = {
        function(cmp)
          if cmp.is_menu_visible() then
            return cmp.select_prev()
          end
        end,
        "fallback",
      },
    },

    appearance = {
      nerd_font_variant = "mono",

      -- TODO migrate to blink.cmp specific highlights
      -- https://cmp.saghen.dev/configuration/appearance.html
      use_nvim_cmp_as_default = true,
    },

    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },

      documentation = {
        auto_show = true,
        window = {
          border = utils.float_borders_style,
          winhighlight = blink_winhighlights,
        },
      },

      menu = {
        border = utils.float_borders_style,
        winhighlight = blink_winhighlights,

        scrolloff = 0,

        draw = {
          gap = 2,
          padding = 2,
          columns = { { "kind_icon" }, { "label", "source_name", gap = 1 } },

          components = {

            -- Add a border to the source component
            source_name = {
              width = { max = 30 },
              text = function(ctx)
                return "「" .. ctx.source_name .. "」"
              end,
              highlight = "BlinkCmpSource",
            },
          },
        },
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },

      providers = {
        lsp = {
          fallbacks = { "lazydev" },
          max_items = 30,
          score_offset = 5,
        },

        snippets = { max_items = 30 },
        path = { max_items = 30 },

        buffer = {
          fallbacks = {},
          max_items = 20,
          min_keyword_length = 2,
        },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
}
