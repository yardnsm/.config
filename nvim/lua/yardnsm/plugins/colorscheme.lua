return {
  {
    "RRethy/nvim-base16",
    priority = 99999,

    init = function()
      require("yardnsm.colorscheme").setup()
    end
  },
}
