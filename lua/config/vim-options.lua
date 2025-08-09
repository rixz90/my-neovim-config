vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set completeopt=menu,menuone,noinsert,noselect,popup")

vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<CR>", ":noh<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("v", "s", "S")
vim.keymap.set("n", "-", "5<C-w>>")
vim.keymap.set("n", "+", "5<C-w><")

-- CodeCompanion
vim.keymap.set("n", "<leader>aa", ":CodeCompanion<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ac", ":CodeCompanionChat<CR>", { noremap = true, silent = true })

-- Harpoon
vim.keymap.set("n", "hx", ":lua require('harpoon.mark').add_file()<CR>", { silent = true })
vim.keymap.set("n", "hp", ":lua require('harpoon.ui').nav_prev()<CR>", { silent = true })
vim.keymap.set("n", "hn", ":lua require('harpoon.ui').nav_next()<CR>", { silent = true })
vim.keymap.set("n", "hm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", {})

-- Neotree
vim.keymap.set("n", "<leader>r", ":Neotree toggle<CR>", { silent = true })

-- Blade highlighting
vim.api.nvim_create_autocmd("FileType", {
	pattern = "blade",
	callback = function()
		vim.cmd("TSBufEnable highlight")
	end,
})
