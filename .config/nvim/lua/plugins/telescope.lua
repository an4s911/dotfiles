return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")

			-- Fuzzy finder
			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({ hidden = true })
			end, { desc = "Find Files" })

			-- Live grep
			vim.keymap.set("n", "<leader>lg", function()
				builtin.live_grep({ hidden = true })
			end, { desc = "Live Grep" })

			-- List buffers
			vim.keymap.set("n", "<leader>bf", function()
				builtin.buffers({ hidden = true })
			end, { desc = "List buffers" })

			-- Git Files
			vim.keymap.set("n", "<leader>fg", function()
				builtin.git_files({ hidden = true })
			end, { desc = "Telescope: Git Files" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				pickers = {
					buffers = {
						mappings = {
							n = {
								["bd"] = require("telescope.actions").delete_buffer,
							},
							i = {
								["<C-x>"] = require("telescope.actions").delete_buffer,
								["<C-h>"] = require("telescope.actions").select_horizontal,
							},
						},
					},
				},
				defaults = {
					mappings = {
						n = {
							["q"] = require("telescope.actions").close,
						},
					},
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},
}
