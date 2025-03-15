-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = 'none' })
  end,
})

return {
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true, -- Carregar apenas quando necessário
    config = function()
      require('nvim-web-devicons').setup()
    end,
  },
  { import = 'custom.plugins.extension-react' },
  { import = 'custom.plugins.neo-tree' },
}
