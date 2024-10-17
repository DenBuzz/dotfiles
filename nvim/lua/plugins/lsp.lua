-- if true then
--   return {}
-- end

-- local lsp = vim.g.lazyvim_python_lsp or "pyright"
-- local ruff = vim.g.lazyvim_python_ruff or "ruff"

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              logLevel = "error",
              lint = { enable = false },
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
    },
  },
}
