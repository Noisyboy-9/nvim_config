local ok, oil = pcall(require, "oil")
if not ok then
    print("can't require nvim-oil")
    return
end

oil.setup()
