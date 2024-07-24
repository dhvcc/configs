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

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })

vim.api.nvim_set_keymap('', '<C-k>', ':vertical resize +5<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-j>', ':vertical resize -5<CR>', { noremap = true })

vim.api.nvim_set_keymap('', '<A-j>', ':tabprevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-k>', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-t>', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-w>', ':tabclose<CR><CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-s>', '<ESC>:w<CR>', { noremap = true })

vim.api.nvim_set_keymap('', '<A-L>', ':wincmd l<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-H>', ':wincmd h<CR>', { noremap = true })

vim.opt.background = 'dark'
vim.opt.termguicolors = true

vim.cmd('let &t_ut = \'\'')
vim.cmd('set termguicolors')

vim.cmd('colorscheme nord')
