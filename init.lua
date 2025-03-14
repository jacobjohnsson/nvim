-- 'lua/settings.lua' contains all native nvim options
require("settings")

-- Lazy is our plugin manager
-- lua/config/lazy.lua
require("config.lazy")

-- --- Everything after this line requires Lazy ---
vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { link = "Grey" })
