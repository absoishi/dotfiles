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
	  requires = {'kyazdani42/nvim-web-devicons', opt = true},
	  config = function ()
		  require('lualine').setup()
	  end
  }
  use {
	  'hrsh7th/nvim-cmp',
	  config = function ()
		  require('pluginconfig/nvim-cmp')
	  end
  }
  use {
	  'hrsh7th/cmp-nvim-lsp'
  }
  use {
	  'hrsh7th/cmp-buffer'
  }
  use {
	  'hrsh7th/cmp-path'
  }
  use {
	  'hrsh7th/cmp-cmdline'
  }
  use {
	  'hrsh7th/vim-vsnip'
  }
  use {
	  'hrsh7th/cmp-nvim-lua'
  }
  use {
	  'saadparwaiz1/cmp_luasnip'
  }
  use {
	  'hrsh7th/cmp-nvim-lsp-signature-help'
  }
  use {
	  'neovim/nvim-lspconfig'
  }
  use {
	  'williamboman/mason.nvim',
	  config = function ()
		  require('mason').setup()
	  end
  }
  use {
	  'williamboman/mason-lspconfig.nvim'
  }
  use {
	  'glepnir/lspsaga.nvim',
	  config = function ()
		  require('lspsaga').init_lsp_saga()
	  end
  }
  use {
	  'folke/lsp-colors.nvim',
	  config = function ()
	  	require('lsp-colors').setup()
	  end
  }
  use {
	  'folke/trouble.nvim',
	  requires = 'kyazdani42/nvim-web-devicons',
	  config = function ()
	  	require('trouble').setup {}
	  end
  }
  use {
	  'j-hui/fidget.nvim',
	  config = function ()
	  	require('fidget').setup {}
	  end
  }
  use {
	  'L3MON4D3/LuaSnip',
	  event = 'VimEnter'
  }
  use {
	  'windwp/nvim-autopairs',
	  event = 'VimEnter',
	  config = function ()
		  require('nvim-autopairs').setup {}
	  end
  }
--  use {
--	  'nvim-lua/plenary.nvim'
--  }
  use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
	  "nvim-telescope/telescope-frecency.nvim",
	  config = function ()
		  require"telescope".load_extension("frecency")
	  end,
	  requires = {"kkharji/sqlite.lua"}
  }
  use {
	  'nvim-telescope/telescope-packer.nvim',
	  config = function ()
		  require('telescope').load_extension('packer')
	  end
  }
--  use {
--	  'LinArcX/telescope-command-paletter.nvim',
--	  config = function ()
--		  require('telescope').load_extension('command_palette')
--	  end
--  }
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function ()
	  	local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		ts_update()
	  end
  }
  use {
	  "yioneko/nvim-yati",
	  tag = "*",
	  requires = "nvim-treesitter/nvim-treesitter"
  }
  use {
	  'nvim-treesitter/nvim-treesitter-context'
  }
  use {
	  'mrjones2014/nvim-ts-rainbow'
  }
  use {
	  'haringsrob/nvim_context_vt'
  }
  use {
	  'SmiteshP/nvim-gps',
	  requires = 'nvim-treesitter/nvim-treesitter'
  }
  use {
	  'akinsho/bufferline.nvim',
	  requires = 'nvim-tree/nvim-web-devicons',
	  config = function ()
	  	vim.opt.termguicolors = true
		require('bufferline').setup {}
	  end
  }
end)
