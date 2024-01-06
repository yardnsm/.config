local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- https://www.nerdfonts.com/cheat-sheet
local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

return {
  "hrsh7th/nvim-cmp",

  -- Load cmp on InsertEnter
  event = "InsertEnter",

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
  },

  config = function(_, opts)
    local cmp = require("cmp")

    local window_border_config = cmp.config.window.bordered()
    window_border_config.winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None"

    cmp.setup({
      -- Setup LuaSnip
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      -- Setup mappings
      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),

        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),

        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),

        -- Expand snippets
        ["<C-j>"] = cmp.mapping(function(fallback)
          local luasnip = require("luasnip")

          if luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif cmp.visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, { "s", "i", "c" }),

        ["<C-k>"] = cmp.mapping(function(fallback)
          local luasnip = require("luasnip")

          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "s", "i", "c" }),

        -- <CR> should be <CR>. Do not fucking select the current item; I have <Tab> for that.
        ["<CR>"] = function(fallback)
          fallback()
        end,

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif not check_backspace() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      },

      window = {
        completion = window_border_config,
        documentation = window_border_config,
      },

      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = " " .. (kind_icons[vim_item.kind] or "") .. "  "

          -- Completion menus
          vim_item.menu = " "
            .. ({
              nvim_lsp = "「LSP」",
              luasnip = "「Snippet」",
              buffer = "「Buffer」",
              path = "「Path」",
            })[entry.source.name]

          return vim_item
        end,
      },

      sources = {
        { name = "nvim_lsp", max_item_count = 30 },
        { name = "luasnip", max_item_count = 30 },
        { name = "path", max_item_count = 30 },

        {
          name = "buffer",
          max_item_count = 20,
          keyword_length = 2,

          option = {
            -- Complete from visible buffers
            get_bufnrs = function()
              local bufs = {}
              for _, win in ipairs(vim.api.nvim_list_wins()) do
                bufs[vim.api.nvim_win_get_buf(win)] = true
              end
              return vim.tbl_keys(bufs)
            end,
          },
        },
      },

      experimental = {
        ghost_text = false,
      },
    })
  end,
}
