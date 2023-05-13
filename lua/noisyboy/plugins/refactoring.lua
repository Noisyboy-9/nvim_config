local ok, refactoring = pcall(require, 'refactoring')
if not ok then
    print("can't require refactoring.nvim")
    return
end

refactoring.setup({
    prompt_func_return_type = {
        go = true,
        cpp = true,
        c = true,
    },
    prompt_func_param_type = {
        go = true,
        cpp = true,
        c = true,
    },
    printf_statements = {},
    print_var_statements = {},
})
