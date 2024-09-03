-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
	'lewis6991/gitsigns.nvim',
	opts = {
		-- See `:help gitsigns.txt`
		signs = {
			add = { text = '+' },
			change = { text = '~' },
			delete = { text = '_' },
			topdelete = { text = '‾' },
			changedelete = { text = '~' },
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map({ 'n', 'v' }, ']c', function()
				if vim.wo.diff then
					return ']c'
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return '<Ignore>'
			end, { expr = true, desc = 'Jump to next hunk' })

			map({ 'n', 'v' }, '[c', function()
				if vim.wo.diff then
					return '[c'
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return '<Ignore>'
			end, { expr = true, desc = 'Jump to previous hunk' })

			-- Actions
			-- visual mode
			map('v', '<leader>hs', function()
				gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
			end, { desc = 'stage git hunk' })
			map('v', '<leader>hr', function()
				gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
			end, { desc = 'reset git hunk' })
			-- normal mode
			map('n', '<leader>hs', gs.stage_hunk, { desc = 'Git Stage Hunk' })
			map('n', '<leader>hr', gs.reset_hunk, { desc = 'Git Reset Hunk' })
			map('n', '<leader>hS', gs.stage_buffer, { desc = 'Git Stage Buffer' })
			map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo Stage Hunk' })
			map('n', '<leader>hR', gs.reset_buffer, { desc = 'Git Reset Buffer' })
			map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview Git Hunk' })
			map('n', '<leader>hb', function()
				gs.blame_line { full = false }
			end, { desc = 'Git Blame Line' })
			map('n', '<leader>hd', gs.diffthis, { desc = 'Git Diff against index' })
			map('n', '<leader>hD', function()
				gs.diffthis '~'
			end, { desc = 'Git Diff Against Last Commit' })

			-- Toggles
			map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Toggle Git Blame Line' })
			map('n', '<leader>td', gs.toggle_deleted, { desc = 'Toggle Git Show Deleted' })

			-- Text object
			map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select Git Hunk' })
		end,
	},
}
