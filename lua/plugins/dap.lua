return {
	"rcarriga/nvim-dap-ui", -- Debug UI for nvim-dap
	dependencies = {
		"mfussenegger/nvim-dap", -- Main dap plugin
		"nvim-neotest/nvim-nio", -- Test integration (optional)
	},
	config = function()
		-- Set up the nvim-dap-ui
		require("dapui").setup()
		local dap = require("dap")

		-- Configure the dap adapter for coreclr (netcoredbg)
		local netcoredbg_path = "C:/Users/shirazi/netcoredbg/netcoredbg/netcoredbg.exe"

		dap.adapters.coreclr = {
			type = "executable",
			command = netcoredbg_path, -- Use forward slashes for path
			args = { "--interpreter=vscode" },
		}

		-- Configure dap for .NET Core (C#) debugging
		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					local default_path = vim.fn.getcwd() .. "/bin/Debug/net8.0/"
					if vim.fn.isdirectory(default_path) == 0 then
						print("Directory not found: " .. default_path)
						return ""
					end
					local path = vim.fn.input("Path to dll", default_path, "file")
					print("Selected DLL path: " .. path) -- Debug output
					return path
				end,
			},
		}

		-- Debugger event listeners for feedback
	end,
}
