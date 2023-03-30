local  ok, mason = pcall(require, "mason")
if not ok then
    print("can't require mason")
    return
end

local  ok, mason_lspconfig= pcall(require, "mason-lspconfig")
if not ok then
    print("can't require mason-lspconfig")
    return
end

mason.setup()
mason_lspconfig.setup({
    ensure_installed = {
        "gopls",
        "rust_analyzer",
        "lua_ls",
        "pylsp",
        "yamlls",
        "bashls",
        "dockerls",
        "docker_compose_language_service",
    },
    automatic_installation = true,
})
