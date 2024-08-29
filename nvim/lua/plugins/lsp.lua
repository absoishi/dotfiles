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
    config = function()
      require('lspsaga').setup({})
      vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
      vim.keymap.set('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>')
      vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>')
      vim.keymap.set('n', 'ga', '<cmd>Lspsaga code_action<CR>')
      vim.keymap.set('n', 'gn', '<cmd>Lspsaga rename<CR>')
      vim.keymap.set('n', 'ge', '<cmd>Lspsaga show_line_diagnostics<CR>')
      vim.keymap.set('n', '[e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
      vim.keymap.set('n', ']e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
    end,
	},
  {
    'folke/lsp-colors.nvim',
    config = true,
  },
  {
    'folke/trouble.nvim',
    dependencies = {'kyazdani42/nvim-web-devicons'},
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    'j-hui/fidget.nvim',
    config = true,
  },
}