local status, _ = pcall(vim.cmd, "colo nightfly")
if not status then
    print("Colorscheme not found")
    return
end
