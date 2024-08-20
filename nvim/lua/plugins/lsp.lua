return{
  {
    'williamboman/mason.nvim',
    config = true,
  },
  {
    'neovim/nvim-lspconfig',
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup({
        ensure_installed = {
          'lua_ls',
          'pyright',
        },
      })
      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({})
        end,
      })
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
		config = true,
	},
  {
    'folke/lsp-colors.nvim',
    config = true,
  },
  {
    'folke/trouble.nvim',
    dependencies = {'kyazdani42/nvim-web-devicons'},
    config = true,
  },
  {
    'j-hui/fidget.nvim',
    config = true,
  },
}