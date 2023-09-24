local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>pp', function()
    builtin.find_files({
        default_text=vim.fn.expand('%:t')
    })
end)

vim.keymap.set('n', 'gr', function() builtin.lsp_references() end, { noremap = true, silent = true })
vim.keymap.set('n', 'gI', function() builtin.lsp_implementations() end, { noremap = true, silent = true })
