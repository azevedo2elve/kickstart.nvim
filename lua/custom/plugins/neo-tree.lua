-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- Certifique-se de que esta linha está presente
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  init = function()
    -- Abre o Neotree automaticamente ao iniciar o Neovim com um diretório
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        local stats = vim.loop.fs_stat(vim.fn.argv(0)) -- Verifica se o argumento é um diretório
        if stats and stats.type == 'directory' then
          require('neo-tree').setup {}
          vim.cmd 'Neotree'
        end
      end,
    })
  end,
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    window = {
      width = 30,
      position = 'left',
      winblend = 80,
    },
  },
}
