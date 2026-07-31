-- Clojure: Conjure uses <localleader> as its mapping prefix.
vim.g.maplocalleader = ","
-- Give multi-key chords like ,e! room to breathe. The tradeoff: keys that are
-- prefixes of Conjure's maps (e.g. ,v and ,x) wait this long before firing.
vim.opt.timeoutlen = 650

-- Structural editing: slurp/barf/drag/raise with >, < and form text objects.
require('nvim-paredit').setup({
  indent = { enabled = true },
})
