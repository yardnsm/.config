local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- https://www.nerdfonts.com/cheat-sheet
-- TODO remove since we've using mini-icons
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
  },

  ---@type Base46Handler
  setup_base46 = function(c, hi)
    hi.CmpBorder = { fg = c.one_bg3, bg = c.black }
  end,

  config = function(_, opts)
    local cmp = require("cmp")

    local window_border_config = cmp.config.window.bordered()
    window_border_config.winhighlight = "Normal:Normal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None"

    cmp.setup({
      -- Setup native snippets
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
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
          if vim.snippet.active({ direction = 1 }) then
            vim.snippet.jump(1)
          elseif cmp.visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, { "s", "i", "c" }),

        ["<C-k>"] = cmp.mapping(function(fallback)
          if vim.snippet.active({ direction = -1 }) then
            vim.snippet.jump(-1)
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
        expandable_indicator = true,
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = " " .. (MiniIcons.get('lsp', vim_item.kind) or "") .. "  "

          -- Completion menus
          vim_item.menu = " "
              .. ({
                nvim_lsp = "「LSP」",
                snippets = "「Snippet」",
                buffer = "「Buffer」",
                path = "「Path」",
                lazydev = "「LazyDev」",
              })[entry.source.name]

          return vim_item
        end,
      },

      sources = {
        { name = "nvim_lsp", max_item_count = 30 },
        { name = "snippets", max_item_count = 30 },
        { name = "path",     max_item_count = 30 },

        { name = "lazydev",  group_index = 0 },

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

      preselect = cmp.PreselectMode.None,

      experimental = {
        ghost_text = false,
      },
    })
  end,
}
