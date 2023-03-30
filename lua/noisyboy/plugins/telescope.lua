local ok, telescope = pcall(require, "telescope")

if not ok then 
    print("can't require telescope")
    return
end

local ok, actions = pcall(require, "telescope.actions")
if not ok then 
    print("can't require telescope-actions")
    return
end

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<leader>k"] = actions.move_selection_previous, 
                ["<leader>j"] = actions.move_selection_next, 
                ["<leader>q"] = actions.send_selected_to_qflist + actions.open_qflist, 
              },
        }
    },

    extensions = {
        fzf = {
          fuzzy = true,                    
          override_generic_sorter = true,  
          override_file_sorter = true,    
          case_mode = "smart_case",       
        },
      }
})

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
telescope.load_extension('project')

