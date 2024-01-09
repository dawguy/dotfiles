vim.g.mapleader = ","

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Open new buffer
vim.keymap.set("n", "<leader>v", vim.cmd.vsp)

-- Basic buffer operations
-- vim.keymap.set("n", "<leader>n", vim.cmd.bnext)
-- vim.keymap.set("n", "<leader>p", vim.cmd.bprevious)
-- vim.keymap.set("n", "<leader>l", vim.cmd.buffers)
vim.keymap.set("n", "<leader>d", vim.cmd.bd)

-- Allows moving visual blocks with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Cursor stays near middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste without overwriting buffer
-- vim.keymap.set("x", "<leader>p", "\"_dP")
-- vim.keymap.set("n", "<leader>d", "\"_d")
-- vim.keymap.set("v", "<leader>d", "\"_d")

-- Apparently Q is bad
vim.keymap.set("n", "Q", "<nop>")

-- Primeagen had a neat tmux open folder command

-- Format project
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- Quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Easily make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Go fmt easily
vim.keymap.set("n", "<leader>gf", "<cmd>!go fmt %<CR>", { silent = true })

-- Alternate git blame
vim.keymap.set("n", "<leader>gbf", ":Git blame<CR>", { silent = true })

-- Make quicklist easy to open and close
vim.keymap.set("n", "<leader>co", ":copen<CR>", { silent = true })
vim.keymap.set("n", "<leader>cc", ":cclose<CR>", { silent = true })

-- mix format easily
vim.keymap.set("n", "<leader>ef", "<cmd>!mix format<CR>", { silent = true })
