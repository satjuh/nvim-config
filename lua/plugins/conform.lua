return {
	'stevearc/conform.nvim',
	branch = "nvim-0.9",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				-- python = { "ruff" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				-- rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				javascript = { "prettier", stop_after_first = true },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback"
			}
			,
		})
	end
}
