local lsp = require('lsp-zero')

local on_attach = lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>wrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>wrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>D", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'eslint', 'lua_ls', 'rust_analyzer', 'gopls', 'golangci_lint_ls', 'tailwindcss', 'cssls', 'cucumber_language_server' },
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	},
})

require('lspconfig').elixirls.setup {
    cmd = { "/Users/david/.elixir-ls/release/language_server.sh" },
    filetypes = {"ex", "exs", "hex"},
    on_attach = on_attach
}

require('lspconfig').cucumber_language_server.setup({
    settings = {
        features = {
            "**/e2e_tests/**/*.feature",
        },
        glue = {
            "**/e2e_tests/**/*.go",
            "**/e2e_tests/**/*_test.go",
        },
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        -- Copilot Source
        { name = "copilot", group_index = 2  },
        -- Other Sources
        {  name = "nvim_lsp", group_index = 2 },
        {  name = "path", group_index = 2 },
        {  name = "luasnip", group_index = 2 },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-,'] = cmp.mapping.complete(),
    }),
    experimental = {
        ghost_text = true,
    },
})

lsp.set_preferences({
    sign_icons = {}
})

local lspconfig = require("lspconfig")
lspconfig.gopls.setup{
    settings = {
        gopls = {
            buildFlags = {"-tags=e2e,unstable,cucumber"}
        }
    }
}
