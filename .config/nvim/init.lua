-- Using -> vim.g.mapleader = "<Space>" <- doesn't work properly
 vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
 vim.g.mapleader = " "

vim.opt.scrolloff = 5
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.list = true
vim.opt.listchars = { trail = '◦' }

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = false })
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = false })

-- Additional keymaps
-- IDE Fallbacks
vim.api.nvim_set_keymap('n', '<C-_>', 'gcc', { desc = "Comment line"} )
vim.api.nvim_set_keymap('v', '<C-_>', 'gc', { desc = "Comment selection"} )

vim.api.nvim_set_keymap('n', '<leader>c', 'gcc', { desc = "Comment line"} )

vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q!<cr>", { desc = "Quit and discard file" })
vim.keymap.set("n", "<leader>qq", "<cmd>qall!<cr>", { desc = "Quit and discard all files" })

-- Map some shift shortcuts to also work with leader
vim.keymap.set("n", "<leader>g", "<S-g>", { desc = "Go to first line" })
vim.keymap.set("n", "<leader>o", "<S-o>", { })
vim.keymap.set("n", "<leader>p", "<S-p>", { })
vim.keymap.set("n", "<leader>p", "<S-p>", { })

-- Panes
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to right window" })

-- Autosave TODO: check if works
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  callback = function()
    if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
      vim.api.nvim_command('silent update')
    end
  end,
})

-- vim.opt.clipboard = "unnamedplus"
-- TODO: fix this
-- if vim.fn.has("wsl") == 1 then
--     vim.g.clipboard = {
--         name = "WSL clipboard",
--         copy = {
--             ["+"] = "clip.exe",
--             ["*"] = "clip.exe",
--         },
--         paste = {
--       ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--             ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
-- 
--         },
--         cache_enabled = true,
--     }
-- end

-- Source some old maps and settings from regular vim
-- vim.cmd("source ~/.vimrc")


require("config.lazy")
vim.cmd('colorscheme nord')
pcall(require, "config.remaps")
