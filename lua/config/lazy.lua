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
        config = function()
            vim.cmd.colorscheme("kanagawa-wave")
        end,
    },
    { "sainnhe/gruvbox-material" },
    { "sainnhe/everforest" },
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
                },
            }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
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
})
