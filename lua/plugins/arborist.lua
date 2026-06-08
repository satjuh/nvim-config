return {
  'arborist-ts/arborist.nvim',
  config = function()
    require('arborist').setup {
      ignore = { 'Nvimtree', 'conf', 'DiffviewFiles' },
    }
  end,
}
