return {
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

      require('nx').setup(opts)
    end,

    keys = {
      { "<leader>nx", "<cmd>Telescope nx actions<CR>" },
    },
  },
}
