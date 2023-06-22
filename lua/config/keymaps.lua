-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

Map(
  "n",
  "<leader>so",
  require("telescope.builtin").oldfiles,
  { noremap = true, silent = true, desc = "Find in registers" }
)
-- Map("n", "<C-d>", require("telescope.actions").delete_buffer, { noremap = true, silent = true })

Map("n", "zR", require("ufo").openAllFolds)
Map("n", "zM", require("ufo").closeAllFolds)

Map(
  "n",
  "<leader>fr",
  -- require("telescope.builtin").registers,
  "<cmd>Telescope neoclip<CR>",
  { noremap = true, silent = true, desc = "Old Files" }
)

-- Move to window using the <ctrl> hjkl keys
Map("n", "<C-Left>", "<C-w>h", { desc = "Go to left window", remap = true })
Map("n", "<C-Right>", "<C-w>l", { desc = "Go to right window", remap = true })
Map("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window", remap = true })
Map("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window", remap = true })

Map("n", "<leader>n", require("nvim-navbuddy").open, { desc = "Navbuddy" })

Map("n", "<leader>h", require("harpoon.ui").toggle_quick_menu, { desc = "Harpoon" })
Map("n", "<leader>hn", require("harpoon.ui").nav_next, { desc = "Next mark" })
Map("n", "<leader>hp", require("harpoon.ui").nav_prev, { desc = "Prev mark" })
Map("n", "<leader>he", require("harpoon.mark").add_file, { desc = "Add file" })

Map("n", "<leader>j", require("treesj").toggle)

Map("n", "<leader>sr", "<cmd>SearchBoxReplace confirm=menu<CR>", { desc = "Search and replace" })
Map("n", "<leader>sm", "<cmd>SearchBoxIncSearch <CR>", { desc = "Start search" })

Map({ "n", "v" }, "k", "j")
Map({ "n", "v" }, "j", "k")

Map({ "n", "v" }, "d", '"_d', opts)
Map({ "n", "v" }, "D", '"_D', opts)
Map({ "n", "v" }, "c", '"_c', opts)
Map({ "n", "v" }, "C", '"_C', opts)
Map({ "n", "v" }, "p", "P", opts)
Map({ "n", "v" }, "P", "p", opts)

Map("n", "<C-d>", "<C-d>zz")
Map("n", "<C-u>", "<C-u>zz")

Map("n", "m", '<cmd>lua require("tsht").move({ side = "end" })<CR>', { noremap = true, silent = true })
Map("n", "M", '<cmd>lua require("tsht").move({ side = "start" })<CR>', { noremap = true, silent = true })

Map("n", "<A-k>", "<cmd>m .+1<cr>==", { desc = "Move down", silent = true })
Map("n", "<A-j>", "<cmd>m .-2<cr>==", { desc = "Move up", silent = true })
Map("i", "<A-k>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down", silent = true })
Map("i", "<A-j>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up", silent = true })
Map("v", "<A-k>", ":m '>+1<cr>gv=gv", { desc = "Move down", silent = true })
Map("v", "<A-j>", ":m '<-2<cr>gv=gv", { desc = "Move up", silent = true })
