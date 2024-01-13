local ok, tokyonight = pcall(require, "tokyonight")
if not ok then
    print("can't require tokyonight")
    return
end

tokyonight.setup({
    style = "storm",
    light_style = "day",
})

vim.cmd.colorscheme "tokyonight"
