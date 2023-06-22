return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
      opts = {
        lsp = { auto_attach = true },
        window = {
          size = { height = "50%", width = "50%" },
          position = { row = "0%", col = "100%" },
        },
      },
    },
  },
}
