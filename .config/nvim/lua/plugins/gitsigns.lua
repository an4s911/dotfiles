return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup({
            current_line_blame = true,
        })
		vim.keymap.set(
			"n",
			"<leader>gv",
			gitsigns.preview_hunk_inline,
			{ desc = "Gitsigns: Preview Hunk Inline", silent = true }
		)
		vim.keymap.set("n", "<leader>gV", gitsigns.preview_hunk, { desc = "Gitsigns: Preview Hunk", silent = true })
		vim.keymap.set("n", "<leader>gn", gitsigns.next_hunk, { desc = "Gitsigns: Next Hunk", silent = true })
		vim.keymap.set("n", "<leader>gp", gitsigns.prev_hunk, { desc = "Gitsigns: Prev Hunk", silent = true })
		vim.keymap.set("n", "<leader>gR", function()
			vim.ui.input({ prompt = "Revert back to last commit? [Y/n] ", default = "y" }, function(answer)
				if answer:lower() == "y" then
					gitsigns.reset_hunk()
				end
			end)
		end, { desc = "Gitsigns: Reset Hunk", silent = true })
	end,
}
