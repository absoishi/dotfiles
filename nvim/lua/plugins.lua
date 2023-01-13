vim.cmd.packadd 'packer.nvim'

require('packer').startup(function(use)
  -- ------------------------------------------------------------------
  -- Installer

  -- Plugin Manager
  use {
	  'wbthomason/packer.nvim',
	  opt = true
  }

  -- External package Installer
  use {
	  'williamboman/mason.nvim',
	  config = function ()
		  require('mason').setup()
	  end
  }
  -- ------------------------------------------------------------------
  -- Lua Library
  use {
	  'nvim-lua/plenary.nvim'
  }
  use {
	  'kkharji/sqlite.lua'
  }
  -- ------------------------------------------------------------------  
  -- ColorScheme
  use {
	  'EdenEast/nightfox.nvim',
	  event = {'VimEnter', 'ColorSchemePre'},
	  config = 'vim.cmd[[colorscheme nightfox]]'
  }
  -- ------------------------------------------------------------------
  -- Statusline
  use {
          'nvim-lualine/lualine.nvim',
	  requires = {'kyazdani42/nvim-web-devicons', opt = true},
	  config = function ()
		  require('lualine').setup()
	  end
  }
  -- ------------------------------------------------------------------
  -- Auto Completion
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
  -- ------------------------------------------------------------------
  -- Language Server Protocol
  use {
	  'neovim/nvim-lspconfig'
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
  -- ------------------------------------------------------------------
  -- Snippet
  use {
	  'L3MON4D3/LuaSnip',
	  event = 'VimEnter'
  }
  -- ------------------------------------------------------------------
  -- telescope.nvim
  use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
	  'nvim-telescope/telescope-frecency.nvim',
	  config = function ()
		  require'telescope'.load_extension('frecency')
	  end,
	  requires = {'kkharji/sqlite.lua'}
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
  -- ------------------------------------------------------------------
  -- Treesitter
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function ()
	  	local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		ts_update()
	  end
  }
  use {
	  'yioneko/nvim-yati',
	  tag = "*",
	  requires = 'nvim-treesitter/nvim-treesitter'
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
  -- ------------------------------------------------------------------
  -- bufferline
  use {
	  'akinsho/bufferline.nvim',
	  requires = 'nvim-tree/nvim-web-devicons',
	  config = function ()
	  	vim.opt.termguicolors = true
		require('bufferline').setup {}
	  end
  }
  -- ------------------------------------------------------------------
  -- Highlight
  use {
	  'RRethy/vim-illuminate'
  }
  use {
	  'folke/todo-comments.nvim',
	  requires = 'nvim-lua/plenary.nvim',
	  config = function()
		  require('todo-comments').setup {}
	  end
  }
  use {
	  'mvllow/modes.nvim',
	  config = function ()
	  	require('modes').setup()
	  end
  }
  -- ------------------------------------------------------------------
  -- Sidebar
  use {
	  'sidebar-nvim/sidebar.nvim',
	  config = function ()
	  	local sidebar = require('sidebar-nvim')
		local opts = {open = true}
		sidebar.setup(opts)
	  end
  }
  -- ------------------------------------------------------------------
  -- Scrollbar
  use {
	  'petertriho/nvim-scrollbar',
	  config = function ()
	  	require('scrollbar').setup()
	  end
  }
  -- ------------------------------------------------------------------
  -- Yank
  use {
	  'AckslD/nvim-neoclip.lua',
	  requires = {
		  { 'nvim-telescope/telescope.nvim' },
		  { 'kkharji/sqlite.lua' }
	  },
	  config = function()
		require('neoclip').setup()
		require('telescope').load_extension('neoclip')
	  end
  }
  -- ------------------------------------------------------------------
  -- Find
  use {
	  'kevinhwang91/nvim-hlslens',
	  config = function ()
	  	require('hlslens').setup()
	  end
  }
  -- ------------------------------------------------------------------
  -- Filer
  use {
	  'nvim-neo-tree/neo-tree.nvim',
	  branch = 'v2.x',
	  requires = {
		  'nvim-lua/plenary.nvim',
		  'nvim-tree/nvim-web-devicons',
		  'MunifTanjim/nui.nvim'
	  }
  }
  -- ------------------------------------------------------------------
  -- Mapping
  use {
	  'folke/which-key.nvim',
	  config = function ()
		  vim.o.timeout = true
		  vim.o.timeoutlen = 300
		  require("which-key").setup {}
	  end
  }
  -- ------------------------------------------------------------------
  -- Quickfix
  use {
	  'kevinhwang91/nvim-bqf',
	  config = function ()
	  	require('bqf').setup()
	  end
  }
  -- ------------------------------------------------------------------
  -- Command
  use {
	  'jghauser/mkdir.nvim',
	  config = function ()
	  	require('mkdir')
	  end
  }
  -- ------------------------------------------------------------------
  -- Terminal
  use {
	  'akinsho/toggleterm.nvim',
	  tag = '*',
	  config = function ()
	  	require('toggleterm').setup()
	  end
  }
  -- ------------------------------------------------------------------
  -- CommandPalette
  use {
	  'mrjones2014/legendary.nvim',
	  requires = 'kkharji/sqlite.lua',
	  config = function ()
	  	require('legendary').setup()
	  end
  }
  -- ------------------------------------------------------------------
  -- Indent
  use {
	  'lukas-reineke/indent-blankline.nvim',
	  config = function ()
	  	vim.opt.list = true
		vim.opt.listchars:append 'eol:↴'
		require('indent_blankline').setup {
			show_end_of_line = true
		}
	  end
  }
  -- ------------------------------------------------------------------
  -- Comment
  use {
	  'numToStr/Comment.nvim',
	  config = function ()
	  	require('Comment').setup()
	  end
  }
  -- ------------------------------------------------------------------
  -- Brackets
  use {
	  'windwp/nvim-autopairs',
	  event = 'VimEnter',
	  config = function ()
		  require('nvim-autopairs').setup {}
	  end
  }
  use {
	  'andymass/vim-matchup',
	  setup = function ()
	  	vim.g.matchup_matchparen_offscreen = { method = 'popup' }
	  end
  }
  -- ------------------------------------------------------------------
  -- Code outline
  use {
	  'stevearc/aerial.nvim',
	  config = function ()
	  	require('aerial').setup()
	  end
  }
  -- ------------------------------------------------------------------
  -- Git
  use {
	  'TimUntersberger/neogit',
	  requires = 'nvim-lua/plenary.nvim',
	  config = function ()
	  	require('neogit').setup {}
	  end
  }
  use {
	  'sindrets/diffview.nvim',
	  requires = 'nvim-lua/plenary.nvim'
  }
  use {
	  'akinsho/git-conflict.nvim',
	  tag = '*',
	  config = function ()
	  	require('git-conflict').setup()
	  end
  }
  use {
	  'lewis6991/gitsigns.nvim',
	  config = function ()
	  	require('gitsigns').setup()
	  end
  }
  -- ------------------------------------------------------------------
  -- Markdown
  use {
	  'iamcco/markdown-preview.nvim'
  }
end)
