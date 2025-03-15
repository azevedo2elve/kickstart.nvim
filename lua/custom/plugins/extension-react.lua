-- lua/custom/plugins/extension-react.lua

return {
  -- Treesitter (Syntax Highlighting)
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'javascript', 'typescript', 'tsx', 'html', 'css' },
        highlight = { enable = true },
      }
    end,
  },

  -- Fechamento automático de tags (nvim-ts-autotag)
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup() -- Nova configuração
    end,
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = { 'ts_ls', 'html', 'cssls' }, -- Usando ts_ls em vez de tsserver
      }
      require('lspconfig').ts_ls.setup {} -- Configuração do LSP para TypeScript/JavaScript
      require('lspconfig').html.setup {} -- Configuração do LSP para HTML
      require('lspconfig').cssls.setup {} -- Configuração do LSP para CSS
    end,
  },

  -- Autocompletion (nvim-cmp)
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require 'cmp'
      cmp.setup {
        sources = {
          { name = 'nvim_lsp' }, -- Autocompletion do LSP
          { name = 'buffer' }, -- Autocompletion do buffer atual
          { name = 'path' }, -- Autocompletion de caminhos
        },
      }
    end,
  },

  -- Formatação (Prettier)
  {
    'MunifTanjim/prettier.nvim',
    config = function()
      require('prettier').setup {
        bin = 'prettier', -- ou o caminho para o binário do Prettier
        filetypes = { 'javascript', 'typescript', 'css', 'html', 'json' },
      }
    end,
  },

  -- Destaque de cores CSS
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
}
