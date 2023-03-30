local setup, tree = pcall(require, 'nvim-tree')
if not setup then
    print("can't require nvim-tree")
    return
end

-- change color of arrows
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

tree.setup({
    renderer = {
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },

    view = {
        side = "right",
        width = 40
    },

    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
            quit_on_open = true,
            resize_window = true
        },
        change_dir = {
            enable = false,
            global = false, 
        }
    },
    disable_netrw = true,
    hijack_netrw = true,
    prefer_startup_root = false,
    sync_root_with_cwd = true,
})
