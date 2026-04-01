-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
  config = {
    keywords = {
      FIXME = {
        color = 'error',
      },
    },
  },
  keys = {
    { '<leader>tl', '<cmd> TodoQuickFix <CR>', 'Quick fix list of comments' },
  },
}
