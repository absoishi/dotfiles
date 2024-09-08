return{
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        formatting = {
          -- fields = {'abbr', 'kind', 'menu'},
          format = require("lspkind").cmp_format({
            with_text = true,
            menu = {
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              cmp_tabnine = "[TabNine]",
              copilot = "[Copilot]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[NeovimLua]",
              latex_symbols = "[LaTeX]",
              path = "[Path]",
              omni = "[Omni]",
              spell = "[Spell]",
              emoji = "[Emoji]",
              calc = "[Calc]",
              rg = "[Rg]",
              treesitter = "[TS]",
              dictionary = "[Dictionary]",
              mocword = "[mocword]",
              cmdline = "[Cmd]",
              cmdline_history = "[History]",
            },
          }),
        },
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),

          ['<CR>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                  if luasnip.expandable() then
                      luasnip.expand()
                  else
                      cmp.confirm({
                          select = true,
                      })
                  end
              else
                  fallback()
              end
          end),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.abort()
              luasnip.jump(1)
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.abort()
              luasnip.jupm(-1)
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
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
    'onsails/lspkind.nvim',
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = {'rafamadriz/friendly-snippets'},
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    'rafamadriz/friendly-snippets'
  },
}