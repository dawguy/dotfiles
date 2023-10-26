local gitsigns = require('gitsigns')

gitsigns.setup()

vim.keymap.set("n", "<leader>gbl", gitsigns.blame_line)
