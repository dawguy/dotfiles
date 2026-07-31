-- Built-in plugin manager (vim.pack, Nvim 0.12+).
-- Installed state is tracked in nvim-pack-lock.json next to this config
-- (commit it). Update plugins with :lua vim.pack.update(), then :restart.

local gh = function(x)
  return 'https://github.com/' .. x
end

-- Keep parser versions in sync with nvim-treesitter after installs/updates.
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
      vim.schedule(function()
        if not ev.data.active then
          vim.cmd.packadd('nvim-treesitter')
        end
        pcall(vim.cmd.TSUpdate)
      end)
    end
  end,
})

vim.pack.add({
  -- Tools / UI
  gh('nvim-telescope/telescope.nvim'),
  gh('nvim-lua/plenary.nvim'),
  gh('rose-pine/neovim'),
  gh('Olical/conjure'),

  -- Treesitter (main branch: the current rewrite, requires Nvim 0.12)
  { src = gh('nvim-treesitter/nvim-treesitter'), version = 'main' },

  -- Git / editing
  gh('theprimeagen/harpoon'),
  gh('mbbill/undotree'),
  gh('tpope/vim-fugitive'),
  gh('lewis6991/gitsigns.nvim'),

  -- LSP + Mason
  gh('williamboman/mason.nvim'),
  gh('williamboman/mason-lspconfig.nvim'),
  gh('neovim/nvim-lspconfig'),

  -- Testing
  gh('nvim-neotest/nvim-nio'),
  gh('nvim-neotest/neotest'),
  gh('nvim-neotest/neotest-go'),

  -- Completion
  gh('hrsh7th/nvim-cmp'),
  gh('hrsh7th/cmp-nvim-lsp'),
  gh('hrsh7th/cmp-path'),
}, { confirm = false })
