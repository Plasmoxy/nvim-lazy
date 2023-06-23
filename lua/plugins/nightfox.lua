return {
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
        },
        palettes = {
          all = {
            green = "#32d9cc",
            sel0 = "#3e4a5b", -- Popup bg, visual selection bg
            sel1 = "#4f6074", -- Popup sel bg, search bg
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
