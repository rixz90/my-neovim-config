return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"html",
        "css",
        "scss",
        "javascript",
        "json",
        "vue",
        "query",
				"markdown",
				"markdown_inline",
        "php",
        "phpdoc",

			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
