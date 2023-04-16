vim.g.mapleader = " "

local keymap = vim.keymap 

-- general keymaps
--

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>q", ":wq")
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab


-- plugin keymaps

keymap.set("n", "<leader>f", ":MaximizerToggle<CR>")
keymap.set("n", "<leader>e", ":NvimTreeToggle")

-- telescope
keymap.set("n", "<leader>cf", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>cs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>cc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>cb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>ch", "<cmd>Telescope help_tags<cr>")
