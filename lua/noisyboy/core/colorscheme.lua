local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
    print("can't require catppuccin")
    return
end

catppuccin.setup({
    flavour = "latte"
})

vim.cmd.colorscheme "catppuccin"
