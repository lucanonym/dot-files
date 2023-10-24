local lsp = require("lsp-zero")
lsp.preset("recommended")

require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "➜",
            package_uninstalled = "",
        }
    }
})

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'rust_analyzer',

})
local cmp = require('cmp')
local cmp_select = {behaviour = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<Enter>'] = cmp.mapping.confirm({select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})
lsp.set_preferences({
	sign_icons = { }
})
lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})
lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.open_float() end, opts)
	vim.keymap.set("n", "gn", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
end)
lsp.setup()

