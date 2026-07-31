-- Clojure: Conjure uses <localleader> as its mapping prefix.
vim.g.maplocalleader = ","
-- Faster key-sequence timeout so prefix collisions (e.g. ,v and ,x) don't lag.
vim.opt.timeoutlen = 300

-- Structural editing: slurp/barf/drag/raise with >, < and form text objects.
require('nvim-paredit').setup({
  indent = { enabled = true },
})
