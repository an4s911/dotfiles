return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local nvim_tree = require("nvim-tree")

		local function map(m, k, v, opts)
			vim.keymap.set(m, k, v, opts)
		end

		local my_on_attach = function(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			map("n", "<C-t>", "<CMD>NvimTreeToggle<CR>", opts("Toggle"))
			map("n", "t", api.node.open.tab, opts("Open: New Tab"))
			map("n", "<BS>", api.tree.change_root_to_parent, opts("Up"))
			map("n", ".", api.tree.change_root_to_node, opts("CD"))
			map("n", "<leader>h", api.node.open.horizontal, opts("Open: Horizontal Split"))
			map("n", ";", api.node.run.cmd, opts("Run Command"))
		end

		local opts = {
			on_attach = my_on_attach,
			view = {
				side = "right",
				width = 40,
			},
			filters = {
				git_ignored = false,
			},
			git = {
				enable = true,
			},
			diagnostics = {
				enable = true,
			},
			sync_root_with_cwd = true,
			renderer = {},
		}

		nvim_tree.setup(opts)

		-- Open nvim-tree when not in nvim-tree
		vim.api.nvim_set_keymap(
			"n",
			"<C-t>",
			"<CMD>NvimTreeFocus<CR>",
			{ noremap = true, silent = true, desc = "Toggle NvimTree" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<C-s>",
			"<CMD>NvimTreeClose<CR>",
			{ noremap = true, silent = true, desc = "Close NvimTree" }
		)
	end,
	dependencies = {
		{
			"nvim-tree/nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup({})
			end,
		},
	},
}
