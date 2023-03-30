local ok, tree_sitter = pcall(require, "nvim-treesitter.configs")
if not ok then
    print("can't require nvim-treesitter.configs")
    return
end

tree_sitter.setup({
    ensure_installed = {"lua", "rust", "toml", "go" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting=false,
    },
    indent = {enable = true},
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
})
