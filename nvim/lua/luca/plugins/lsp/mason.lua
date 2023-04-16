local mason_status, mason = pcall(require, "mason")
if not mason_status then
	print("mason is not installed")
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	print("mason-lspconfig is not installed/ready")
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	print("mason-null-ls is not available")
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"emmet_ls",
		"tailwindcss",
		"tsserver",
		"html",
		"cssls",
		"clangd",
		"ltex",
		"vuels",
		"rust_analyzer",
	},
})

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
	},
})
