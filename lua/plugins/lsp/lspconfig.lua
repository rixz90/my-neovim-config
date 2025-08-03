return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},

		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local options = { noremap = true, silent = true }
			local capabilities = cmp_nvim_lsp.default_capabilities()

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
			lspconfig.intelephense.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.valor.setup({
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
              globals = {"vim"}
            }
          }
        }
			})
		end,
	},
}
