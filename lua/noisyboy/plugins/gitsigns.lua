local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
    print("can't require gitsigns")
    return
end

gitsigns.setup()
