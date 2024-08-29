return{
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      require('mini.indentscope').setup({ symbol = '┆' })
      require('mini.pairs').setup({})
      require('mini.surround').setup({})
    end,
  }
}