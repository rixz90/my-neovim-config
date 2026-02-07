return {
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
    config = function()
      require 'nvim-treesitter.configs'.setup {
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
          "blade",
        },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = false },
        fold = { enable = true }, -- Enable Tree-sitter folding
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<leader>ss", -- set to `false` to disable one of the mappings
            node_incremental = "<leader>si",
            scope_incremental = "<leader>sc",
            node_decremental = "<leader>sd",
          },
        },

        textobjects = {
          select = {
            enable = true,
            lookahead = true,

            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
              ["@parameter.outer"] = "v", -- charwise
              ["@function.outer"] = "V", -- linewise
              ["@class.outer"] = "<c-q>", -- blockwise
            },
            include_surrounding_whitespace = true,
          },
        },
      }
    end
		},
}
