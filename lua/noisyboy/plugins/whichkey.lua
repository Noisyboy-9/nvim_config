-- integrate which-key with vim
local o = vim.o
o.timeout = true
o.timeoutlen = 300


local ok, whichkey = pcall(require, "which-key")
if not ok then
    print("can't require which-key")
    return
end

whichkey.setup {}
