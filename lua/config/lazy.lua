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
        "sainnhe/everforest",
        config = function()
            vim.cmd.colorscheme("everforest")
            vim.api.nvim_set_hl(0, 'Comment', { link = 'Grey' })
        end,
    },
    {
        "https://codeberg.org/andyg/leap.nvim",
        config = function()
            vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
            vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
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
            require('local-highlight').setup({
                animate = {
                    enabled = false,
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "markdown",
                    "markdown_inline",
                    "python",
                },

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = false,

                highlight = {
                    enable = true,
                },
                incremental_selection = {
                    enable = false,
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        config = function()
            require("nvim-treesitter.configs").setup({
                select = {
                    lookahead = true,
                },
            })
            -- select
            vim.keymap.set({ "x", "o" }, "af", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "if", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "ac", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "ic", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
            end)
            -- keymaps
            vim.keymap.set("n", "<leader>wp", function()
                require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
            end)
            vim.keymap.set("n", "<leader>wP", function()
                require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
            end)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function ()
            require("treesitter-context").setup({
                enable = true,
            })
        end,
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
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            vim.lsp.config("*", {})
            vim.lsp.enable({
                "clangd",
                "pyright"
            })
            vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { link = "Grey" })
        end,
    },
    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',

        version = '0.12.4',

        config = function()
            require("blink.cmp").setup({
                keymap = { 
                    preset = 'default',
                    ['<Up>'] = { 'select_prev', 'fallback' },
                    ['<Down>'] = { 'select_next', 'fallback' },
                    ['<Right>'] = { 'accept', 'fallback' },
                },

                appearance = {
                    use_nvim_cmp_as_default = true,
                    nerd_font_variant = 'mono'
                },
                completion = {
                    ghost_text = { enabled = true },
                },
                signature = { enabled = true },
            })
            vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { link = "Grey" })
        end,
    },
    {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim"
        },
        opts = { lsp = { auto_attach = true } }
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
        },
        config = function ()
            require("telescope").setup()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            vim.keymap.set('n', '<leader>ft', builtin.treesitter, { desc = 'Telescope treesitter' })
            vim.keymap.set('n', '<leader>fp', builtin.planets, { desc = 'Telescope telescope' })
            vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = 'Telescope man pagez' })

            vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Telescope git branches' })
            vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Telescope git commits' })
            vim.keymap.set('n', '<leader>gh', builtin.git_status, { desc = 'Telescope git hunks' })
        end,
    },
    {
        'TheNoeTrevino/haunt.nvim',
        init = function()
            local haunt = require("haunt.api")
            local map = vim.keymap.set
            local prefix = "<leader>a"

            -- annotations
            map("n", prefix .. "a", function()
                haunt.annotate()
            end, { desc = "Annotate"})

            map("n", prefix .. "t", function()
                haunt.toggle_annotation()
            end, { desc = "Toggle annotation" })

            map("n", prefix .. "T", function()
                haunt.toggle_all_lines()
            end, { desc = "Toggle all annotations" })

            map("n", prefix .. "d", function()
                haunt.delete()
            end, { desc = "Delete bookmark" })

            map("n", prefix .. "D", function()
                haunt.clear_all()
            end, { desc = "Delete all bookmarks" })

            map("n", prefix .. "p", function()
                haunt.prev()
            end, { desc = "Previous bookmark" })

            map("n", prefix .. "n", function()
                haunt.next()
            end, { desc = "Next bookmark" })
        end

    },
})

