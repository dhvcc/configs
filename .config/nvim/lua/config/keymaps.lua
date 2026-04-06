local map = vim.keymap.set

map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

map("n", "gt", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "gT", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

map("n", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("x", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
map("x", "<leader>p", '"+p', { desc = "Paste from system clipboard" })

map("n", "<leader>b", "<cmd>Neotree toggle<cr>", { desc = "Toggle sidebar" })
map("n", "<leader>P", "<leader>fp", { remap = true, desc = "Open project" })
map("n", "<leader>o", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Toggle outline" })

map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Terminal normal mode" })

map("x", "<leader>f", [[y/\V<C-R>=escape(@", '/\')<CR><CR>]], { desc = "Search selection" })
