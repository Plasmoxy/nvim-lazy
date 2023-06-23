local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

vim.g.gitblame_enabled = 0

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

require("notify").setup({
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = "",
  },
  level = 2,
  minimum_width = 50,
  render = "minimal",
  timeout = 500,
  top_down = false,
  background_colour = "#000000",
})

require("telescope").setup({
  defaults = {
    mappings = {
      n = {
        ["<Del>"] = "delete_buffer",
      },
    },
    path_display = {
      show_only_cwd = true,
      truncate = "true",
    },
    file_ignore_patterns = {
      "node_modules",
      -- "./git",
      "/squashfs-root/usr/share/nvim/runtime/doc/*",
      "%.json",
      "package%-lock%.json",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("neoclip")
require("neoclip").setup()

local navbuddy = require("nvim-navbuddy")
local actions = require("nvim-navbuddy.actions")

navbuddy.setup({
  mappings = {
    ["u"] = actions.previous_sibling,
    ["e"] = actions.next_sibling,
    ["n"] = actions.parent,
    ["i"] = actions.children,
  },
  lsp = {
    preference = { "tsserver" },
  },
})

require("lspconfig").clangd.setup({
  on_attach = function(client, bufnr)
    navbuddy.attach(client, bufnr)
  end,
})

require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
})

require("nvim-treesitter.configs").setup({
  autotag = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>",
    },
  },
  -- textsubjects = {
  --   enable = true,
  --   prev_selection = ",", -- (Optional) keymap to select the previous selection
  --   keymaps = {
  --     ["."] = "textsubjects-smart",
  --     [";"] = "textsubjects-container-outer",
  --     ["i;"] = "textsubjects-container-inner",
  --   },
  -- },
})

function ToggleDiagnosticVirtualText()
  if toggled then
    vim.diagnostic.config({
      virtual_text = true,
    })
  else
    vim.diagnostic.config({
      virtual_text = false,
    })
  end
  toggled = not toggled
end

vim.keymap.set("n", "<leader>ut", "<cmd>lua ToggleDiagnosticVirtualText()<CR>", { noremap = true, silent = true })

-- disable diagnostics
-- vim.diagnostic.config({
--   virtual_text = false,
-- })

vim.api.nvim_command("set noswapfile")

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.whichwrap = "<,>,h,l,[,]"
