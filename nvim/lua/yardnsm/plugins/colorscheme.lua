return {
  {
    dir = "~/dev/nvim-base46",
    priority = 99999,

    init = function()
      require("yardnsm.colorscheme").setup()
    end
  },
}
