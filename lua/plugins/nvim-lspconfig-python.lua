return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {},
      ruff = {
        cmd_env = { RUFF_TRACE = "messages" },
        init_options = {
          settings = {
            logLevel = "error",
          },
        },
        keys = {
          {
            "<leader>co",
            LazyVim.lsp.action["source.organizeImports"],
            desc = "Organize Imports",
          },
        },
      },
    },
    setup = {
      pyright = function(_, opts)
        opts.capabilities = require("blink.cmp").get_lsp_capabilities(opts.capabilities)
      end,
      ruff = function()
        Snacks.util.lsp.on({ name = "ruff" }, function(_, client)
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end)
      end,
    },
  },
}
