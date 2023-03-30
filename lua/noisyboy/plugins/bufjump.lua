local ok, bufjump = pcall(require, "bufjump")
if not ok then
    print("can't require bufjump")
    return
end

bufjump.setup({
    forward = "gd",
    backward = "gb",
    on_success = nil
})
