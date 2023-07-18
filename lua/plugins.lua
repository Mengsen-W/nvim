local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({ "git", "clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable", -- latest stable release
	lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.which_key"),
	require("plugins.lsp"),
	require("plugins.treeitter"),
	require("plugins.search"),
	require("plugins.editor"),
	require("plugins.vision"),
	require("plugins.git"),
	require("plugins.fun"),
	require("plugins.project"),
	require("plugins.toggleterm"),
	require("plugins.neotree"),
})


-- TODO plugins
-- dap
-- dap-ui
-- alphabet
-- todo-comment

