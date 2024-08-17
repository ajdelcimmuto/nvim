local dap, dapui = require("dap"), require("dapui")
dap.adapters.brightscript = {
	type = 'executable',
	command = 'npx',
	args = { '--verbose', 'roku-debug', '--dap' },
}
dap.adapters.lldb = {
	type = 'executable',
	command = '/opt/homebrew/opt/llvm/bin/lldb-dap', -- adjust as needed, must be absolute path
	name = 'lldb'
}
dap.configurations.cpp = {
	{
		name = 'Launch',
		type = 'lldb',
		request = 'launch',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {},
	},
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = {
	{
		type = 'lldb',
		request = 'launch',
		name = 'Launch',
		program = function()
			vim.fn.jobstart('cargo build')
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {},
		runInTerminal = true,
		-- ... other configuration options ...
	}
}
dap.configurations.brs = {
	{
		type = 'brightscript',
		request = 'launch',
		name = "Debug app",
		rootDir = "${workspaceFolder}",
		files = {
			"manifest",
			"source/**/*.*",
			"components/**/*.*",
			"images/**/*.*",
			"locale/**/*.*"
		},
		host = "192.168.1.222",
		remotePort = 8060,
		password = "pluto",
		injectRaleTrackerTask = true,
		outDir = "${workspaceFolder}/out/",
		enableDebugProtocol = true,
		fileLogging = false,
		enableVariablesPanel = true,
		logLevel = "off"
	},
}
require("neodev").setup({
	library = { plugins = { "nvim-dap-ui" }, types = true }
})
-- Initialize DAP UI
dapui.setup({
	icons = { 
		expanded = "▾",
		collapsed = "▸",
		breakpoint = "🔴",
	},
	mappings = {
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.25 },
				{ id = "breakpoints", size = 0.25 },
				{ id = "stacks", size = 0.25 },
				{ id = "watches", size = 0.25 },
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 25,
			position = "bottom",
		},
	},
	floating = {
		max_height = nil,
		max_width = nil,
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
})
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
