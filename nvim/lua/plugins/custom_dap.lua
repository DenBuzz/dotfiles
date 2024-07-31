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
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup() -- ("/opt/venv/bin/python")
      require("dap.ext.vscode").load_launchjs()
    end,
  },
}
