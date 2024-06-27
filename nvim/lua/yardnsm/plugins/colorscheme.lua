return {
  {
    -- "yardnsm/nvim-base46",
    dir = "~/dev/nvim-base46",

    priority = 99999,
    opts = {
      telescope_style = "borderless",
    },

    init = function()
      require("yardnsm.colorscheme").setup()
    end
  },
}
