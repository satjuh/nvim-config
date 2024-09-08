-- Tmux integration to switch panels seamlessly
return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<a-h>", "<cmd>TmuxNavigateLeft<cr>" },
		{ "<a-j>", "<cmd>TmuxNavigateDown<cr>" },
		{ "<a-k>", "<cmd>TmuxNavigateUp<cr>" },
		{ "<a-l>", "<cmd>TmuxNavigateRight<cr>" },
	},
	enabled = function()
		local term = os.getenv("TMUX")
		return term and string.find(term, "tmux")
	end
}
