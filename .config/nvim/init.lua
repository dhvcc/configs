vim.opt.runtimepath:prepend("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")

vim.cmd("source ~/.vimrc")

require("config.lazy")
