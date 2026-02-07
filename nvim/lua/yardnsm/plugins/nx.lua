return {
  {
    dir = "~/dev/nx-console.nvim",

    lazy = false,
    submodules = false,

    ---@type nx_console.Config
    opts = {
      picker = 'snacks',
      command_runner = function(cmd) return require("nx-console.runners").yeet()(cmd) end,
    },

    dependencies = {
      "samharju/yeet.nvim",
      "akinsho/toggleterm.nvim"
    },

    keys = {
      {
        "<leader>nf",
        ":Neotree reveal source=nx-console<CR>",
        desc = "Nx Projects",
      },
      {
        "<leader>nt",
        function()
          require("nx-console").pickers.targets_current()
        end,
        desc = "Nx Targets",
      },
      {
        "<leader>ng",
        function()
          require("nx-console").pickers.generators()
        end,
        desc = "Nx Generators",
      },
    },

    -- init = function()
    -- end
  },

  {"samharju/yeet.nvim", lazy = false},

  {
    "Equilibris/nx.nvim",

    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },

    opts = {
      nx_cmd_root = "yarn nx",
      read_init = true,

      command_runner = function(command)
        local Job = require("plenary.job")
        local popup = Job:new({
          command = "tmux",
          args = {
            "popup",
            "-d",
            vim.fn.getcwd(0),
            "-T",
            " NX: " .. command .. " ",
            command,
          },
        })

        popup:start()
      end,
    },

    config = function(_, opts)
      -- Disable logging...
      require("nx.logging").log = function() end
      require("nx.logging").warn = function() end
      require("nx.logging").error = function() end

      require("nx").setup(opts)
    end,

    keys = {
      { "<leader>nx", "<cmd>Telescope nx actions<CR>" },
    },
  },
}
