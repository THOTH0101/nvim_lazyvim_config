-- lua/plugins/blink-cmp.lua
return {
  "saghen/blink.cmp",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  event = "InsertEnter",
  opts = {
    completion = {
      menu = {
        border = "rounded",
      },
    },
  },
}
