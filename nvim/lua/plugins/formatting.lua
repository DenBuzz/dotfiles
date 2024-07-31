return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "isort", "ruff_format" },
      },
      formatters = {
        isort = {
          prepend_args = { "--line-length=120" },
        },
        ruff_format = {
          prepend_args = { "format", "--line-length=120" },
        },
      },
    },
  },
}
