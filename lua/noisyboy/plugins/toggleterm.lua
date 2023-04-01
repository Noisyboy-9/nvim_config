local ok, toggleterm = pcall(require, "toggleterm")

if not ok then
    print("can't require toggleterm")
    return
end

toggleterm.setup()

