local ok, git = pcall(require, "lazygit")

if not ok then
    print("can't require lazygit")
end

lazygit.setup()
