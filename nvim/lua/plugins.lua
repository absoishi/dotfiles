vim.cmd.packadd 'packer.nvim'

require('packer').startup(function(use)
  use {
	  'wbthomason/packer.nvim',
	  opt = true
  }

  use {
	  'EdenEast/nightfox.nvim',
	  event = {'VimEnter', 'ColorSchemePre'},
	  config = 'vim.cmd[[colorscheme nightfox]]'
  } 
  use {
          'nvim-lualine/lualine.nvim',
	  requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)
