return {
  "Wansmer/treesj",
  keys = {
    "<space>m",
    "<space>j",
    "<space>s",
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
      max_join_length = 400,
    })
  end,
}
