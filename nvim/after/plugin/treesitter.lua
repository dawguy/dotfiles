-- nvim-treesitter (main branch: the 0.12 rewrite).
-- Parsers are installed with `require('nvim-treesitter').install({...})`
-- or `:TSInstall` / `:TSUpdate`.

require('nvim-treesitter').setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
})

-- The vimdoc parser covers help files.
vim.treesitter.language.register('vimdoc', 'help')

-- Enable treesitter highlighting whenever a parser is available.
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
