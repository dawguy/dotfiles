local telescope = require('telescope')
local actions = require('telescope.actions')

vim.cmd([[
function!   QuickFixOpenAll()
    if empty(getqflist())
        return
    endif
    let s:prev_val = ""
    let s:j = 0
    for d in getqflist()
        let s:curr_val = bufname(d.bufnr)
        if (s:j == 0)
            exec "edit " . s:curr_val
        endif
        if (s:curr_val != s:prev_val)
            if (s:j != 0)
                exec "vsplit " . s:curr_val
            endif
        endif
        let s:prev_val = s:curr_val
        let s:j = s:j + 1
    endfor
endfunction
]])

vim.keymap.set('n', '<leader>oq', ':call QuickFixOpenAll()<CR>', { noremap = true, silent = false })

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-o>"] = function(prompt_bufnr)
                    require("telescope.actions").select_default(prompt_bufnr)
                    require("telescope.builtin").resume()
                end,
                ["<C-q>"] = actions.smart_send_to_qflist,
                ["<leader>q"] = actions.smart_send_to_qflist,
            }
        },
        layout_strategy = 'flex'
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > "), use_regex = true });
end)
vim.keymap.set('n', '<leader>pg', builtin.grep_string, {})
vim.keymap.set('n', '<leader>pp', function()
    builtin.find_files({
        default_text = vim.fn.expand('%:t')
    })
end)

vim.keymap.set('n', 'gr', function() builtin.lsp_references() end, { noremap = true, silent = true })
vim.keymap.set('n', 'gI', function() builtin.lsp_implementations() end, { noremap = true, silent = true })
