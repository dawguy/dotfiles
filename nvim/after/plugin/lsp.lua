-- LSP via core Nvim: vim.lsp.config() + vim.lsp.enable().
-- Server defaults come from nvim-lspconfig (installed as a plugin);
-- mason-lspconfig auto-enables any server installed through Mason.

-- Completion capabilities for nvim-cmp
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- Per-server overrides
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config('gopls', {
  settings = {
    gopls = {
      buildFlags = { '-tags=e2e,unstable,cucumber' },
    },
  },
})

vim.lsp.config('cucumber_language_server', {
  settings = {
    features = { '**/e2e_tests/**/*.feature' },
    glue = {
      '**/e2e_tests/**/*.go',
      '**/e2e_tests/**/*_test.go',
    },
  },
})

-- Tailwind is only useful in templates, not plain Elixir source files.
vim.lsp.config('tailwindcss', {
  filetypes = { 'heex', 'eelixir' },
})

-- LSP keymaps (unchanged from the previous config)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local opts = { buffer = ev.buf, remap = false }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>wrr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>wrn', vim.lsp.buf.rename, opts)
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, opts)
  end,
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'clojure_lsp',
    'eslint', 'lua_ls', 'rust_analyzer', 'gopls', 'golangci_lint_ls',
    'tailwindcss', 'cssls', 'cucumber_language_server',
  },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
  sources = {
    { name = 'nvim_lsp', group_index = 2 },
    { name = 'path', group_index = 2 },
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
