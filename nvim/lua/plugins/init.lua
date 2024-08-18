return {
  -- ------------------------------------------------------------------
  -- ColorScheme
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme nightfox]])
    end,
  },
  -- ------------------------------------------------------------------
  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require('lualine').setup()
    end,
  },
  -- ------------------------------------------------------------------
  -- telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      require('telescope').load_extension('file_browser')
    end,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>")
    end,
  },
  -- ------------------------------------------------------------------
  -- Auto Completion
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require'cmp'

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' }, -- For vsnip users.
          { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
          { name = 'nvim_lua' },
          { name = 'nvim_lsp_signature_help' },
        }, {
          { name = 'buffer' },
        })
      })
      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end,
  },
  {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-nvim-lua',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp-signature-help',
  },
  -- ------------------------------------------------------------------
  -- LSP
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
        },
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require("lspconfig").lua_ls.setup {}
    end,
  },
  {
		'nvimdev/lspsaga.nvim',
		config = function()
			require('lspsaga').setup({})
		end,
	},
  {
    'folke/lsp-colors.nvim',
    config = function()
      require('lsp-colors').setup()
    end,
  },
  {
    'folke/trouble.nvim',
    dependencies = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require('trouble').setup {}
    end,
  },
  {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup {}
    end,
  },
  -- ------------------------------------------------------------------
  -- mini
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      require('mini.indentscope').setup({ symbol = '┆' })
      require('mini.pairs').setup({})
      require('mini.surround').setup({})
    end,
  },
  -- ------------------------------------------------------------------
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        highlight = {
          enable = true,
          disable = {},
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
          },
        },
        indent = {
          enable = false
        },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = 300,
        },
        yati = {
          enable = true
        },
      })
    end,
  },
  -- {
  --   'yioneko/nvim-yati',
  --   version = "*",
  --   dependencies = {'nvim-treesitter/nvim-treesitter'},
  -- },
  {
    'nvim-treesitter/nvim-treesitter-context'
  },
  {
    'mrjones2014/nvim-ts-rainbow'
  },
  {
    'haringsrob/nvim_context_vt'
  },
  {
  'SmiteshP/nvim-gps',
    dependencies = {'nvim-treesitter/nvim-treesitter'},
  },
  -- ------------------------------------------------------------------
  -- bufferline
  {'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {'nvim-tree/nvim-web-devicons'},
  config = function()
		vim.opt.termguicolors = true
		require('bufferline').setup {}
  end,
  },
  -- ------------------------------------------------------------------
  -- Highlight
  {
    'RRethy/vim-illuminate'
  },
  {
    'folke/todo-comments.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      require('todo-comments').setup {}
    end,
  },
  {
    'mvllow/modes.nvim',
    config = function()
      require('modes').setup()
    end,
  },
  -- ------------------------------------------------------------------
  -- Sidebar
  {
    'sidebar-nvim/sidebar.nvim',
    config = function()
      local sidebar = require('sidebar-nvim')
      local opts = {open = true}
      sidebar.setup(opts)
    end,
  },
  -- ------------------------------------------------------------------
  -- Scrollbar
  {
    'petertriho/nvim-scrollbar',
    config = function()
      require('scrollbar').setup()
    end,
  },
  -- ------------------------------------------------------------------
  -- Yank
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      -- you'll need at least one of these
      {'nvim-telescope/telescope.nvim'},
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require('neoclip').setup()
    end,
  },
  -- ------------------------------------------------------------------
  -- Find
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup()
    end,
  },
  -- ------------------------------------------------------------------
  -- Filer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },
  -- ------------------------------------------------------------------
  -- Mapping
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  -- ------------------------------------------------------------------
  -- Quickfix
  {
    'kevinhwang91/nvim-bqf',
    config = function()
      require('bqf').setup()
    end,
  },
  -- ------------------------------------------------------------------
  -- Command
  {
    'jghauser/mkdir.nvim',
    config = function()
      require('mkdir')
    end,
  },
  -- ------------------------------------------------------------------
  -- Terminal
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require('toggleterm').setup()
    end,
  },
  -- ------------------------------------------------------------------
  -- CommandPalette
  {
    'folke/flash.nvim',
    keys = {
      {
        's',
        function()
          require('flash').jump()
        end,
        mode = { 'n', 'x', 'o' },
        desc = 'Jump forwards',
      },
      {
        'S',
        function()
          require('flash').jump({ search = { forward = false } })
        end,
        mode = { 'n', 'x', 'o' },
        desc = 'Jump backwards',
      },
    },
  },
  {
    'mrjones2014/legendary.nvim',
    version = 'v2.13.9',
    -- since legendary.nvim handles all your keymaps/commands,
    -- its recommended to load legendary.nvim before other plugins
    priority = 10000,
    lazy = false,
    config = function()
      require('legendary').setup({ extensions = { lazy_nvim = true } })
    end,
  },
  -- ------------------------------------------------------------------
  -- Indent
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
      require('ibl').setup()
    end,
  },
  -- ------------------------------------------------------------------
  -- Comment
  {
    'numToStr/Comment.nvim',
    config = function ()
      require('Comment').setup()
    end,
  },
  -- ------------------------------------------------------------------
  -- Brackets
  -- {
  --   'windwp/nvim-autopairs',
  --   event = 'InsertEnter',
  --   config = function ()
  --     require('nvim-autopairs').setup {}
  --   end,
  -- },
  -- {
  --   'andymass/vim-matchup',
  --   config = function ()
  --     vim.g.matchup_matchparen_offscreen = { method = 'popup' }
	--   end,
  -- },
  -- ------------------------------------------------------------------
  -- Code outline
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require('aerial').setup()
    end,
  },
  -- ------------------------------------------------------------------
  -- Git
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = function()
      require('neogit').setup {}
    end,
  },
  {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = function()
      require('git-conflict').setup()
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },
  -- ------------------------------------------------------------------
  -- REPL
  {
    'Vigemus/iron.nvim',
    config = function()
      local iron = require("iron.core")

      iron.setup {
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- Your repl definitions come here
          repl_definition = {
            sh = {
              -- Can be a table or a function that
              -- returns a table (see below)
              command = {"zsh"}
            },
            python = {
              command = { "python3" },  -- or { "ipython", "--no-autoindent" }
              format = require("iron.fts.common").bracketed_paste_python
            }
          },
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = require('iron.view').bottom(40),
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        keymaps = {
          send_motion = "<space>sc",
          visual_send = "<space>sc",
          send_file = "<space>sf",
          send_line = "<space>sl",
          send_paragraph = "<space>sp",
          send_until_cursor = "<space>su",
          send_mark = "<space>sm",
          mark_motion = "<space>mc",
          mark_visual = "<space>mc",
          remove_mark = "<space>md",
          cr = "<space>s<cr>",
          interrupt = "<space>s<space>",
          exit = "<space>sq",
          clear = "<space>cl",
        },
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = {
          italic = true
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      }

      -- iron also has a list of commands, see :h iron-commands for all available commands
      vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
      vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
      vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
      vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
    end,
  },
  -- ------------------------------------------------------------------
  -- Markdown
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
}
