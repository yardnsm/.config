local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

return {
  "saghen/blink.cmp",
  lazy = true,

  enabled = false,

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

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {

    keymap = {
      preset = "default",

      ["<C-j>"] = { "snippet_forward", "select_and_accept", "fallback" },
      ["<C-k>"] = { "snippet_backward", "fallback" },

      ["<Tab>"] = {
        function(cmp)
          if cmp.windows.autocomplete.win:is_open() then
            return cmp.select_next()
          end
          if not check_backspace() then
            return cmp.show()
          end
        end,
        "fallback",
      },

      ["<S-Tab>"] = {
        function(cmp)
          if cmp.windows.autocomplete.win:is_open() then
            return cmp.select_prev()
          end
        end,
        "fallback",
      },
    },

    highlight = {
      use_nvim_cmp_as_default = true,
    },

    nerd_font_variant = "mono",

    windows = {
      autocomplete = {
        border = "rounded",
        winhighlight = "Normal:Normal,FloatBorder:BlinkBorder,CursorLine:PmenuSel,Search:None", -- TODO change to highlights

        scrolloff = 0,
        selection = "auto_insert",

        draw = {
          gap = 2,
          padding = 2,
          align_to_component = "none",

          columns = { { "kind_icon" }, { "label", "source" } },
          components = {
            source = {
              width = { max = 30 },
              text = function(ctx)
                return " "
                    .. ({
                      lsp = "「LSP」    ",
                      snippets = "「Snippet」",
                      buffer = "「Buffer」 ",
                      path = "「Path」   ",
                      lazydev = "「LazyDev」",
                    })[ctx.item.source_id]
              end,
              highlight = "BlinkCmpLabelDescription",
            },
          },
        },
      },

      documentation = {
        auto_show = true,
        border = "rounded",
        winhighlight = "Normal:Normal,FloatBorder:BlinkBorder,CursorLine:PmenuSel,Search:None",
      },
    },

    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, via `opts_extend`
    sources = {
      completion = {
        enabled_providers = { "lsp", "path", "snippets", "buffer", "lazydev" },
      },

      providers = {
        ---@diagnostic disable-next-line: missing-fields
        lsp = {
          fallback_for = { "lazydev" },
          max_item = 30,
          score_offset = 5,
        },

        ---@diagnostic disable-next-line: missing-fields
        snippets = { max_item = 30 },
        ---@diagnostic disable-next-line: missing-fields
        path = { max_item = 30 },

        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
        },

        ---@diagnostic disable-next-line: missing-fields
        buffer = {
          fallback_for = {},
          max_item = 20,
          min_keyword_length = 2,
        },
      },
    },

    -- Experimental auto-brackets support
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },

    -- Experimental signature help support
    trigger = {
      signature_help = {
        enabled = false,
      },
    },
  },
}
