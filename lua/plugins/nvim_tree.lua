-- A side bar where to see files etc...
return {
	'nvim-tree/nvim-tree.lua',
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 30
			}
		})
		vim.keymap.set('n', '<leader>e', ":NvimTreeToggle<CR>", { silent = true })
		-- vim.keymap.set('n', '<leader>e', ":NvimTreeOpen<CR>", { silent = true })
	end,
}
