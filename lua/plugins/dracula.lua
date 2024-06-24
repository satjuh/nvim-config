-- The dracula theme
return {
	lazy = false,
	'Mofiqul/dracula.nvim',
	priority = 1000,
	config = function()
		vim.cmd.colorscheme 'dracula'
	end,
}
