-- Use <Space> as leader
vim.g.mapleader = " "

-- show the relative line number for each line
vim.opt.rnu = true
vim.opt.nu = true

-- Open new windows at the bottom instead of top
vim.opt.splitbelow = true

-- Open new windows at the right instead of left
vim.opt.splitright = true

-- Wrap lines
vim.opt.wrap = false

-- Tabs instead of spaces
vim.opt.expandtab = true

-- Tabs are 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Always keep 6 lines above and below the cursor to the windows edge
vim.opt.scrolloff = 6

-- Visual block mode can select cells without characters
vim.opt.virtualedit = "block"

-- Open subsitution and other stuff in new window
vim.opt.inccommand = "split"

-- Ignore case on commands
vim.opt.ignorecase = true

vim.opt.termguicolors = true

-- Draw a column at 80
vim.opt.colorcolumn = "80"

-- Add a shortcut to cheatsheet.md
vim.api.nvim_create_user_command('Cheat', function()
    vim.cmd('pedit ' .. '/home/jacob/.config/nvim/cheatsheet.md')
end, { nargs = 0 })

-- Shorten the update time to make gitgutter feel responsive
vim.opt.updatetime = 100

-- Make <UP ARROW> and <DOWN ARROW> move the window instead of the cursor
vim.keymap.set('n', '<Down>', '<C-e>')
vim.keymap.set('n', '<Up>', '<C-y>')

-- Add a status line to every window
vim.opt.laststatus = 2
