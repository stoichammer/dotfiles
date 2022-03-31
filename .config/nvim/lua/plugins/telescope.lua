local map = vim.api.nvim_set_keymap

options = { noremap = true }

-- require('telescope.builtin').map('n', '<leader>ff' , find_files(), options)
-- map('n', '<leader>ff', require('telescope.builtin').find_files(), options)

map('n', '<leader>ff', ':Telescope find_files<cr>', options)
map('n', '<leader>fg', ':Telescope live_grep<cr>', options)
map('n', '<leader>fb', ':Telescope buffers<cr>', options)
map('n', '<leader>fh', ':Telescope help_tags<cr>', options)



