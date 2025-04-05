local is_in_diffview = function()
  return vim.fn.exists("t:diffview_view_initialized") == 1
end

local augroup = vim.api.nvim_create_augroup("nvim_tree_au", { clear = true })

local function nvim_tree_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Custom mappings
  vim.keymap.set("n", "x", api.node.navigate.parent_close, opts("Clsoe Directory"))
  vim.keymap.set("n", "m", api.fs.rename, opts("Rename"))
  vim.keymap.set("n", "r", api.tree.reload, opts("Refresh"))
  vim.keymap.set("n", "cd", api.tree.change_root_to_node, opts("Change Directory"))
  vim.keymap.set("n", "go", api.node.open.preview, opts("Open Preview"))
  vim.keymap.set("n", "s", api.node.open.vertical, opts("Open Vertical Split"))
  vim.keymap.set("n", "i", api.node.open.horizontal, opts("Open Horizontal Split"))
  vim.keymap.set("n", "bb", api.marks.toggle, opts("Toggle Bookmark"))

  -- Remove default mappings
  vim.keymap.del("n", "<C-k>", opts(""))
end

return {
  {
    "kyazdani42/nvim-tree.lua",

    enabled = false,

    dependencies = {
      "echasnovski/mini.icons",
    },

    keys = {
      {
        "<leader>/",
        function()
          return is_in_diffview() and ":DiffviewToggleFiles<CR>" or ":NvimTreeToggle<CR>"
        end,
        expr = true,
      },
      {
        "<leader>0",
        function()
          return is_in_diffview() and ":DiffviewFocusFiles<CR>" or ":NvimTreeFocus<CR>"
        end,
        expr = true,
      },
      {
        "<leader><leader>",
        function()
          if is_in_diffview() then
            return ":DiffviewFocusFiles<CR>"
          end

          return vim.bo.ft == "NvimTree" and ":NvimTreeClose<CR>" or ":NvimTreeFindFile<CR>"
        end,
        expr = true,
      },
    },

    config = function(_, opts)
      require("nvim-tree").setup(opts)

      -- Setups for signcolumn and winbar when the plugins loads
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "NvimTree",
        group = augroup,
        callback = function()
          vim.schedule(function()
            vim.wo.signcolumn = "auto"
            vim.wo.winbar = ""
          end)
        end,
      })

      -- Support for LSP rename via snacks.nvim
      local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
      vim.api.nvim_create_autocmd("User", {
        pattern = "NvimTreeSetup",
        callback = function()
          local events = require("nvim-tree.api").events
          events.subscribe(events.Event.NodeRenamed, function(data)
            if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
              data = data
              Snacks.rename.on_rename_file(data.old_name, data.new_name)
            end
          end)
        end,
      })
    end,

    opts = {
      on_attach = nvim_tree_on_attach,

      actions = {
        open_file = {
          quit_on_open = true,
          window_picker = {
            enable = false,
          },
        },
      },

      filters = {
        exclude = { ".DS_Store", "__pycache__", ".pyc" },
      },

      git = {
        ignore = false,
        timeout = 1000,
      },

      view = {
        width = {
          max = 80,
        },

        float = {
          enable = false,

          ---@type vim.api.keyset.win_config
          open_win_config = {
            relative = "editor",
            border = "rounded",
          },
        },
      },

      renderer = {
        highlight_git = true,

        indent_markers = {
          enable = true,
        },

        icons = {
          git_placement = "after",

          show = {
            file = true,
            folder = true,
          },

          glyphs = {
            folder = {
              default = "󰉖",
              open = "󰷏",
              empty = "󰉖",
              empty_open = "󰷏",
            },

            git = {
              unstaged = "+",
              staged = "+",
              unmerged = "U",
              renamed = ">",
              untracked = "?",
              deleted = "-",
              ignored = "",
            },
          },
        },
      },
    },
  },
}
