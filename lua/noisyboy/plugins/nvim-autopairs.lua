local ok, autopair = pcall(require, "nvim-autopairs")

if not ok then
    print("can't require nvim-autopairs")
    return
end

autopair.setup()
