local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

local function all_filetypes()
  return vim.fn.getcompletion('', 'filetype')
end

-- our picker function: colors
local file_type_picker = function(opts)
  opts = opts or {}
  pickers
    .new(opts, {
      prompt_title = 'Select file type for buffer',
      finder = finders.new_table {
        results = all_filetypes(),
      },
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(bufnr, _)
        actions.select_default:replace(function()
          actions.close(bufnr)
          local selection = action_state.get_selected_entry()
          if not selection or not selection[1] then
            return
          end
          local ft = selection[1]
          -- Prefer :setfiletype over :set ft=... (better hooks & no side effects)
          vim.cmd('setfiletype ' .. ft)
          -- vim.notify(('filetype → %s'):format(ft), vim.log.levels.INFO)
        end)
        return true
      end,
    })
    :find()
end

return file_type_picker
