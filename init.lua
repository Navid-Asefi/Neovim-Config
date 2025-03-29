require("core.keymaps")
require("core.options")

--Installed Lazy here
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Split lines settings
vim.o.laststatus = 3

--Installed all my plugins here
require("lazy").setup({
	require("plugins.neotree"),
	require("plugins.colortheme"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.fidget"),
	require("plugins.LSP"),
	require("plugins.autocompletion"),
	require("plugins.autoformatting"),
	require("plugins.indent-lines"),
	require("plugins.misc"),
	require("plugins.comment"),
	require("plugins.alpha"),
	require("plugins.toggleterm"),
	require("plugins.boilerplate"),
	require("plugins.lazygit"),
	require("plugins.trouble"),
})
