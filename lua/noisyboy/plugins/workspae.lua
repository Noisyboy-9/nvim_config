local ok, workspace = pcall(require, "workspaces")
if not ok then
   print("can't require workspaces")
    return
end

workspace.setup({
    hooks = {
        open = { "NvimTreeOpen", "Telescope find_files" },
    }
})
