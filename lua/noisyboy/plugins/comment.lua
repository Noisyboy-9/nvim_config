local ok, comment = pcall(require, "Comment")
if not ok then
    print("can't require Comment")
    return
end

comment.setup()
