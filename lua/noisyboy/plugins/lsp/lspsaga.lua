local ok, saga = pcall(require, "lspsaga")
if not ok then
    print("can't require lspsaga")
    return
end

saga.setup({
    scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
    definition = {
    edit = "<CR>",
    },
    ui = {
        colors = {
          normal_bg = "#022746",
        },
    },
})
