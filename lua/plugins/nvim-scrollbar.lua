return {
  "petertriho/nvim-scrollbar",
  name = "nvim-scrollbar",
  config = function()
    require("scrollbar").setup({
      handle = {
        color = "#2e6669",
      },
    })
  end,
}
