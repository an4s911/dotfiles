-- Comment Toggle
function CommentToggle()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))

	local api = require("Comment.api")
	local line_content = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]

	local commentstring = vim.bo.commentstring
	local comment_chars = commentstring:match("^(.-)%%s"):gsub("^%s*(.-)%s*$", "%1")
	local comment_len = #comment_chars
	local comment_chars_formatted = comment_chars:gsub("-", "%%-")

	local newcol
	if line_content:match("^%s*" .. comment_chars_formatted) then
		newcol = col - comment_len - 1
	else
		newcol = col + comment_len + 1
	end

	api.toggle.linewise.current()

	vim.api.nvim_win_set_cursor(0, { row, newcol })
end

return {
	"numToStr/Comment.nvim",
	opts = {
		sticky = true,
		toggler = {},
	},
	config = function(_, opts)
		local Comment = require("Comment")

		Comment.setup(opts)

		vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { silent = true })

		vim.api.nvim_set_keymap("n", "<C-/>", "<CMD>lua CommentToggle()<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("v", "<C-/>", "gcgv", { silent = true })
		vim.api.nvim_set_keymap("i", "<C-/>", "<CMD>lua CommentToggle()<CR>", { noremap = true, silent = true })
	end,
	lazy = false,
}
