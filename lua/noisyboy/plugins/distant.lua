local ok, distant = pcall(require, "distant")
if not ok then
    print("can't require distant")
    return
end

distant.setup({
    ['*'] = require('distant.settings').chip_default()
})
