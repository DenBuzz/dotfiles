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
    config = function()
      -- load mason-nvim-dap here, after all adapters have been setup
      -- if LazyVim.has("mason-nvim-dap.nvim") then
      --   require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))
      -- end
      --
      -- vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
      --
      for name, sign in pairs(LazyVim.config.icons.dap) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end

      -- setup dap config by VsCode launch.json file
      local vscode = require("dap.ext.vscode")
      -- use a json5 compatible parser!
      vscode.json_decode = require("neoconf.json.jsonc").decode_jsonc

      -- Extends dap.configurations with entries read from .vscode/launch.json
      if vim.fn.filereadable(".vscode/launch.json") then
        vscode.load_launchjs()
      end
      -- print("DAP")
      local dap = require("dap")
      for _, entry in ipairs(dap.configurations.debugpy) do
        entry["cwd"] = "/opt/project/"
      end
      for _, entry in ipairs(dap.configurations.python) do
        entry["cwd"] = "/opt/project/"
      end
      -- print(vim.inspect(dap.configurations.python))
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup() -- ("/opt/venv/bin/python")
    end,
  },
}
