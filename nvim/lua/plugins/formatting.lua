return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["python"] = { "ruff", "ruff_format" },
        ["json"] = { "fixjson" },
      },
    },
  },
}
