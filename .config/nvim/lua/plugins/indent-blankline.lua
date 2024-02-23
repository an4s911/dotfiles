return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		local ibl = require("ibl")
		local opts = {
			indent = {
				char = "│",
			},
			scope = {
				enabled = true,
				show_start = false,
				show_end = false,
				include = {
					node_type = {
						python = {
							"with_statement",
							"if_statement",
							"argument_list",
							"for_statement",
							"string",
						},
						lua = {
							"table_constructor",
						},
						java = {
							"class_declaration",
						},
					},
				},
			},
		}

		ibl.setup(opts)
	end,
}
