local is_in_diffview = function()
  return vim.fn.exists("t:diffview_view_initialized") == 1
end

local function on_move(data)
  Snacks.rename.on_rename_file(data.source, data.destination)
end

local augroup = vim.api.nvim_create_augroup("Neotree", { clear = true })

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "echasnovski/mini.icons",
  },

  keys = {
    {
      "<leader>/",
      function()
        return is_in_diffview() and ":DiffviewToggleFiles<CR>" or ":Neotree toggle<CR>"
      end,
      expr = true,
    },
    {
      "<leader>0",
      function()
        return is_in_diffview() and ":DiffviewFocusFiles<CR>" or ":Neotree focus<CR>"
      end,
      expr = true,
    },
    {
      "<leader><leader>",
      function()
        if is_in_diffview() then
          return ":DiffviewFocusFiles<CR>"
        end

        return vim.bo.ft == "neo-tree" and ":Neotree close<CR>" or ":Neotree reveal<CR>"
      end,
      expr = true,
    },
  },

  config = function(_, opts)
    require("neo-tree").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "neo-tree-popup",
      group = augroup,
      callback = function()
        vim.schedule(function()
          -- A trick to hide colorcolumn
          vim.opt_local.winhl:append("ColorColumn:")
        end)
      end,
    })
  end,

  opts = {
    sources = {
      "filesystem",
      "document_symbols",
    },

    close_if_last_window = true,
    popup_border_style = "rounded",

    enable_diagnostics = false,
    enable_modified_markers = false,
    enable_opened_markers = true,

    source_selector = {
      winbar = true,
      content_layout = "center",
      sources = {
        {
          source = "filesystem",
          display_name = " Files ",
        },
        {
          source = "document_symbols",
          display_name = " Symbols ",
        },
      },
    },

    use_default_mappings = false,
    window = {
      mappings = {
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["o"] = "open",
        ["<esc>"] = "cancel",
        ["<tab>"] = "toggle_node",

        ["go"] = { "toggle_preview", config = { use_float = false } },
        ["<C-f>"] = { "scroll_preview", config = { direction = -10 } },
        ["<C-b>"] = { "scroll_preview", config = { direction = 10 } },
        -- ["l"] = "focus_preview",

        ["S"] = "open_split",
        ["s"] = "open_vsplit",
        ["t"] = "open_tabnew",

        ["x"] = "close_node",
        ["z"] = "close_all_nodes",

        ["R"] = "refresh",

        ["a"] = {
          "add",
          config = {
            show_path = "relative",
          },
        },
        ["A"] = {
          "add_directory",
          config = {
            show_path = "relative",
          },
        },

        ["d"] = "delete",
        ["r"] = "rename",

        ["y"] = "copy_to_clipboard",
        ["X"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",

        -- Takes text input for destination, also accepts the config.show_path and config.insert_as options
        ["c"] = "copy",
        ["m"] = "move",

        ["e"] = "toggle_auto_expand_width",
        ["q"] = "close_window",
        ["g?"] = "show_help",

        ["<"] = "prev_source",
        [">"] = "next_source",
      },
    },

    filesystem = {
      window = {
        mappings = {
          ["H"] = "toggle_hidden",

          -- ["/"] = "fuzzy_finder",
          ["D"] = "fuzzy_finder_directory",
          -- ["#"] = "fuzzy_sorter",

          ["f"] = "filter_on_submit",
          ["F"] = "clear_filter",

          -- ["<bs>"] = "navigate_up",
          -- ["."] = "set_root",

          ["[c"] = "prev_git_modified",
          ["]c"] = "next_git_modified",
          ["i"] = "show_file_details",
        },
        fuzzy_finder_mappings = {
          ["<down>"] = "move_cursor_down",
          ["<C-n>"] = "move_cursor_down",
          ["<up>"] = "move_cursor_up",
          ["<C-p>"] = "move_cursor_up",
        },
      },

      search_limit = 50, -- max number of search results when using filters
      hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
      use_libuv_file_watcher = true, -- this will use the os level file watchers to detect changes
      -- instead of relying on nvim autocmd events.

      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_by_pattern = {
          ".DS_Store",
          "__pycache__",
          ".pyc",
        },
      },
    },

    default_component_configs = {
      container = {
        enable_character_fade = true,
      },
      indent = {
        with_expanders = true,
      },
      name = {
        highlight_opened_files = true,
      },
      icon = {
        folder_closed = "󰉖",
        folder_open = "󰷏",
        folder_empty = "󰉖",
        folder_empty_open = "󰷏",
      },
      git_status = {
        align = "left",
        symbols = {
          unstaged = "+",
          staged = "+",
          unmerged = "U",
          renamed = ">",
          untracked = "?",
          deleted = "-",
          ignored = "",
        },
      },
      file_size = {
        enabled = false,
      },
      type = {
        enabled = false,
      },
      last_modified = {
        enabled = false,
      },
      created = {
        enabled = false,
      },
      symlink_target = {
        enabled = false,
      },
    },

    document_symbols = {
      follow_cursor = false,
      client_filters = "first",
      window = {
        mappings = {
          ["<cr>"] = "jump_to_symbol",
          ["o"] = "jump_to_symbol",
          ["A"] = "noop", -- also accepts the config.show_path and config.insert_as options.
          ["d"] = "noop",
          ["y"] = "noop",
          ["x"] = "noop",
          ["p"] = "noop",
          ["c"] = "noop",
          ["m"] = "noop",
          ["a"] = "noop",
          -- ["/"] = "filter",
          ["f"] = "filter_on_submit",
        },
      },
    },

    event_handlers = {
      {
        event = "file_open_requested",
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
      { event = "file_moved", handler = on_move },
      { event = "file_renamed", handler = on_move },
    },
  },
}
