-- vim.opt.runtimepath:prepend("~/.vim")
-- vim.opt.runtimepath:append("~/.vim/after")

vim.api.nvim_set_keymap('n', '<C-_>', 'gcc', {} )
vim.api.nvim_set_keymap('v', '<C-_>', 'gc', {} )

vim.cmd("source ~/.vimrc")
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

require("config.lazy")
