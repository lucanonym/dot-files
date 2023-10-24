local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end


treesitter.setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "bash", "gitignore", "javascript", "typescript"},
	sync_install = false,
	auto_install = true,
	indent = { enable = true},
	autotag = { enable = true},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
