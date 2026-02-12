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

      -- Toggles
      map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Toggle Git Blame Line' })
      map('n', '<leader>td', gs.toggle_deleted, { desc = 'Toggle Git Show Deleted' })
      map('n', '<leader>gn', gs.next_hunk, { desc = 'Go to next git hunk' })
      map('n', '<leader>gp', gs.prev_hunk, { desc = 'Go to previous git hunk' })
      map('n', '<leader>gl', function()
        gs.setqflist 'all'
      end, { desc = 'Quick fix list of all files git hunks' })
      map('n', '<leader>gs', gs.show, { desc = 'Show the current file without any changes in the current buffer' })

      map('n', '<leader>hl', gs.setqflist, { desc = 'Quick fix list of git hunks' })
      map('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset the current hunk.' })

      -- Text object
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select Git Hunk' })
    end,
  },
}
