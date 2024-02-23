return {
	"windwp/nvim-ts-autotag",
	config = function()
		local autotag = require("nvim-ts-autotag")
		autotag.setup({
			autotag = {
				enable_rename = true,
			},
		})
	end,
}
