-- Global key bindings only
-- use app specific config files where needed

local map = vim.api.nvim_set_keymap

opt = { noremap = true }

map('i', ';l', '<Esc>', opt)

map('n', 'l', '<Left>', opt)
map('n', 'j', '<Up>', opt)
map('n', 'k', '<Down>', opt)
map('n', ';', '<Right>', opt)

-- map the leader key
vim.g.mapleader = ','  
map('n', '<,>', '', {})

options = { noremap = true, silent = true }

map('n', '<A-,>', ':BufferPrevious<cr>', options)
map('n', '<A-.>', ':BufferNext<cr>', options)

map('n', '<A-<>', ':BufferMovePrevious<cr>', options)
map('n', '<A->>', ':BufferMoveNext<cr>', options)

map('n', '<A-1>', ':BufferGoto 1<cr>', options)
map('n', '<A-2>', ':BufferGoto 2<cr>', options)
map('n', '<A-3>', ':BufferGoto 3<cr>', options)
map('n', '<A-4>', ':BufferGoto 4<cr>', options)
map('n', '<A-5>', ':BufferGoto 5<cr>', options)
map('n', '<A-6>', ':BufferGoto 6<cr>', options)
map('n', '<A-7>', ':BufferGoto 7<cr>', options)
map('n', '<A-8>', ':BufferGoto 8<cr>', options)
map('n', '<A-9>', ':BufferGoto 9<cr>', options)

map('n', '<A-p>', ':BufferPin<cr>', options)
map('n', '<A-c>', ':BufferClose<cr>', options)

vim.g.dashboard_default_executive ='telescope'

vim.o.swapfile = true
vim.o.dir = '/tmp'
vim.o.hlsearch = true
vim.wo.number = true 
vim.wo.relativenumber = true

vim.opt.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox8]])
