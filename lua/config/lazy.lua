-- Bootstrap lazy.nvim (Copied from https://lazy.folke.io/installation)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        -- Color Scheme :D
        "rebelot/kanagawa.nvim",
        -- config = function()
        --     vim.cmd.colorscheme("kanagawa-wave")
        --     vim.api.nvim_set_hl(0, 'Comment', { link = 'Grey' })
        -- end,
    },
    {
        "sainnhe/gruvbox-material",
    --     config = function()
    --         vim.cmd.colorscheme("gruvbox-material")
    --         vim.api.nvim_set_hl(0, 'Comment', { link = 'Grey' })
    --     end
    },
    {
        "sainnhe/everforest",
        config = function()
            vim.cmd.colorscheme("everforest")
            vim.api.nvim_set_hl(0, 'Comment', { link = 'Grey' })
        end,
    },
    {
        "ggandor/leap.nvim",
        config = function()
            require'leap'.create_default_mappings()
            vim.keymap.set({'n', 'o'}, 'gs', function ()
                require('leap.remote').action()
            end)
        end,
    },
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function ()
            require("mini.pairs").setup({})
        end,
    },
    {
        "airblade/vim-gitgutter",
        -- config = function ()
        --     require("mini.pairs").setup({})
        -- end,
    },
    {
        "vim-airline/vim-airline",
        config = function()
            -- Remove the encoding field, why would I ever need it?
            vim.g['airline_section_y'] = ''
        end,
    },
    {
        "vim-airline/vim-airline-themes",
        config = function()
            vim.g['airline_theme'] = "deus"
        end,
    },
    {
        "tzachar/local-highlight.nvim",
        config = function()
            require('local-highlight').setup()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python" },

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = false,

                highlight = {
                    enable = true,
                },
                incremental_selection = {
                    enable = false,
                    -- keymaps = {
                    --     init_selection = "<Leader>ss",
                    --     node_incremental = "<Leader>si",
                    --     scope_incremental = "<Leader>sc",
                    --     node_decremental = "<Leader>sd",
                    -- },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                            ["lh"] = "@assignment.inner",
                            ["rh"] = "@assignment.rhs",
                        },
                        include_surrounding_whitespace = true,
                    },
                    swap = {
                        enable = true,
                        lookahead = true,
                        swap_next = {
                            ["<Leader>wp"] = "@parameter.inner",
                            ["<Leader>wf"] = "@function.outer",
                        },
                        swap_previous = {
                            ["<Leader>wP"] = "@parameter.inner",
                            ["<Leader>wF"] = "@function.outer",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["<Leader>mf"] = "@function.outer",
                        },
                        goto_previous_start = {
                            ["<Leader>mF"] = "@function.outer",
                        },
                    },
                    playground = {
                        enable = true,
                    },
                },
            }
        end,
    },
    { "nvim-treesitter/playground" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "nvim-treesitter/nvim-treesitter-context" },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        lazy = false,
    },
    {
        "junegunn/fzf.vim"
    },
    {
        "junegunn/fzf",
        config = function()
            vim.api.nvim_set_keymap('n', '<C-f>', ':Files<CR>', {})
            vim.api.nvim_set_keymap('n', '<C-g>', ':Lines<CR>', {})
            vim.api.nvim_set_keymap('n', '<C-h>', ':Changes<CR>', {})
            vim.api.nvim_set_keymap('n', '<C-c>', ':Commits<CR>', {})
        end,
    },
    {
        "tpope/vim-fugitive",
    },
    -- LSP
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lsp = require("lspconfig")
            lsp.clangd.setup{} -- intall clangd lsp
        end,
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        config = function()
            require('cmp_nvim_lsp').default_capabilities()
        end,
    },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    {
        "hrsh7th/nvim-cmp",
        config = function(args)
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    -- Use the built in neovim snippet engine.
                    -- vim.snippet.expand(args.body)
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                      ['<C-d>'] = cmp.mapping.open_docs(),
                      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                      ['<C-f>'] = cmp.mapping.scroll_docs(4),
                      ['<C-Space>'] = cmp.mapping.complete(),
                      ['<C-e>'] = cmp.mapping.abort(),
                      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    -- { name = 'vsnip' }, -- For vsnip users.
                    -- { name = 'luasnip' }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                }, {
                  { name = 'buffer' },
                })
            })
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })
        end,
    },
})
