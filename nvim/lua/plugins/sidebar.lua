return{
  {
    'sidebar-nvim/sidebar.nvim',
    config = function()
      local sidebar = require('sidebar-nvim')
      local opts = {open = true}
      sidebar.setup(opts)
    end,
  },
}