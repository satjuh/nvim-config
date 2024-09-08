-- Create session from current working directory
return {
	'rmagatti/auto-session',
	config = function()
		require("auto-session").setup {
			auto_session_enable_last_session = false,
			auto_session_last_session_dir = "",
			auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
			auto_session_enabled = true,
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
		}
	end
}
