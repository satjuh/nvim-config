-- Setup git diffview
return {
	'sindrets/diffview.nvim',
	config = function()
		require('diffview').setup({
			enhanced_diff_hl = true,
			file_panel = {
				listing_style = "list"
			}
		})

		-- Set the highlight colors correctly
		vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#415e44" });
		vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#8f3c3f" });
		vim.api.nvim_set_hl(0, "DiffviewStatusDeleted", { bg = "#8f3c3f" });
		vim.api.nvim_set_hl(0, "DiffviewDiffChange", { bg = "#3f473c" });
		vim.api.nvim_set_hl(0, "DiffviewDiffText", { bg = "#415e44" });
		vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDelete", { bg = "#53222b" });
	end,

	enabled = function()
		local output = vim.fn.systemlist('git rev-parse --is-inside-work-tree 2>/dev/null')
		return #output ~= 0
	end,

	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},

	keys = {
		{ "<leader>gd", "<cmd> DiffviewOpen <CR>",        desc = "Open diffview working tree head" },
		{ "<leader>gc", "<cmd> DiffviewClose <CR>",       desc = "Close diff view" },
		{ "<leader>gh", "<cmd> DiffviewFileHistory <CR>", desc = "Open file history view" },
		{ "<leader>gm", "<cmd> DiffviewOpen master <CR>", desc = "Open diff view against master" },
	}
}
