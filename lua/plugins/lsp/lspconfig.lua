return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local options = { noremap = true, silent = true }

			local on_attach = function(_, bufnr)
				options.buffer = bufnr

				options.desc = "See available code action"
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, options)

				options.desc = "Show documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, options)

				options.desc = "Show definition"
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, options)
			end

			lspconfig.html.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.stimulus_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.volar.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.laravel_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.phpactor.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
	},
}
