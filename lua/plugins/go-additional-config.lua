return {
  -- nvim-dap config
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "delve" } },
      },
      {
        "leoluz/nvim-dap-go",
        opts = {},
      },
    },
  },

  -- neotest-golang config
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "fredrikaverpil/neotest-golang",
    },
    opts = {
      adapters = {
        ["neotest-golang"] = {
          -- Here we can set options for neotest-golang, e.g.
          -- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
          dap_go_enabled = true, -- requires leoluz/nvim-dap-go
        },
      },
    },
  },

  -- mini.icons config
  {
    "nvim-mini/mini.icons",
    opts = {
      file = {
        [".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
      },
      filetype = {
        gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
      },
    },
  },

  -- none-ls config
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "gomodifytags", "impl" } },
      },
    },
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.gofumpt,
      })
    end,
  },

  -- nvim-lint config
  {
    "mfussenegger/nvim-lint",
    optional = true,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "golangci-lint" } },
      },
    },
    opts = {
      linters_by_ft = {
        go = { "golangcilint" },
      },
    },
  },

  -- conform.nvim config
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
      },
    },
  },
}
