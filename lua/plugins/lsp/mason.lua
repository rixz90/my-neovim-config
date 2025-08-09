return {
	{
		"mason-org/mason-lspconfig.nvim",
		options = {
			ensure_installed = {
				"lua_ls",
				"html",
				"css",
				"tailwindcss",
				"emmet_language_server",
				"phpactor",
        "stimulus-language-server"
			},
			automatic_enable = true,
		},
	},
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
}
