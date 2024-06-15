return {
  {
    dir = "~/dev/nvim-base46",
    priority = 99999,

    opts = {
    },

    init = function()
      require("yardnsm.colorscheme").setup()
      require("yardnsm.misc.base16-shell").setup()
    end
  },
}
