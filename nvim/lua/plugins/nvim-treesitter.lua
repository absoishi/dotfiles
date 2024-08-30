return{
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
        -- yati = {
        --   enable = true
        -- },
      })
    end,
  },
  -- {
  --   'yioneko/nvim-yati',
  --   version = "*",
  --   dependencies = {'nvim-treesitter/nvim-treesitter'},
  -- },
  {
    'nvim-treesitter/nvim-treesitter-context',
    'mrjones2014/nvim-ts-rainbow',
    'haringsrob/nvim_context_vt',
  },
}