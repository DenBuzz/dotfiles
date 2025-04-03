return {
  -- get rid of this junk...
  {
    "jay-babu/mason-nvim-dap.nvim",
    enabled = true,
    opts = {
      automatic_installation = false,
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
  },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("uv") -- ("/opt/venv/bin/python")
    end,
  },
}
