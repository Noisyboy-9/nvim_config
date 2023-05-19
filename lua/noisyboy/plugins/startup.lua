local ok, startup = pcall(require, "startup")
if not ok then
    print("can't require nvim-startup")
    return
end

startup.setup({
    theme = "startify"
})
