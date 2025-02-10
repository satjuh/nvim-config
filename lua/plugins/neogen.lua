return {
	"danymat/neogen",
	config = true,
	-- Uncomment next line if you want to follow only stable versions
	-- version = "*"
	keys = {
		{ "<leader>cc", ":lua require('neogen').generate()<CR>" }
	}
}
