return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
  },
  opts = {
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
    },
    strategies = {
      chat = {
        keymaps = {
          send = {
            modes = { n = "<CR>", i = "<C-S>" },
            opts = {},
          },
          close = {
            modes = { n = "<C-c>", i = "<esc>" },
            opts = {},
          },
          -- Add further custom keymaps here
        },
      },
    },
    display = {
      chat = {
        window = {
          layout = "vertical",
          position = "right",
          height = 0.6,
          width = 0.3,
        },
      },
    },
  },
}
