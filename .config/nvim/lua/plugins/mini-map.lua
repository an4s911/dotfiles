return {
	"echasnovski/mini.map",
	version = "*",
	config = function()
		local map = require("mini.map")

		local opts = {
			integrations = {
				map.gen_integration.gitsigns(),
			},
			window = {
				side = "right",
				focusable = false,
				show_integration_count = false,
			},
		}

		map.setup(opts)

		vim.keymap.set("n", "<Leader>mc", map.close)
		vim.keymap.set("n", "<Leader>mf", map.toggle_focus)
		vim.keymap.set("n", "<Leader>mo", map.open)
		vim.keymap.set("n", "<Leader>mr", map.refresh)
		vim.keymap.set("n", "<Leader>ms", map.toggle_side)
		vim.keymap.set("n", "<Leader>mt", map.toggle)
	end,
}
