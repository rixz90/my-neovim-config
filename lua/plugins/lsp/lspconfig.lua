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

      -- Vue config
      local vue_language_server_path = vim.fn.stdpath("data")
          .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

      local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }

      local vue_plugin = {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
        configNamespace = "typescript",
      }

      local ts_ls_config = {
        init_options = {
          plugins = {
            vue_plugin,
          },
        },
        filetypes = tsserver_filetypes,
        on_attach = on_attach,
      }

      local vue_ls_config = {
        capabilities = capabilities,
        on_attach = on_attach,
      }
      vim.lsp.config("vue_ls", vue_ls_config)
      vim.lsp.config("ts_ls", ts_ls_config)
      vim.lsp.enable({ "ts_ls", "vue_ls" }) -- If using `ts_ls` replace `vtsls` to `ts_ls`

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
      lspconfig.laravel_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.phpactor.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.tailwindcss.setup({
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
