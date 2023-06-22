return {
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    config = function()
      require("nightfox").setup({
        palettes = {
          all = {
            green = "#32d9cc",
          },
        },
        specs = {
          all = {
            syntax = {},
          },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "carbonfox",
    },
  },
}
