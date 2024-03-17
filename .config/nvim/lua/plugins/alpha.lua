return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")

		startify.section.header.val = {
			[[     _   _       _               ]],
			[[    | \ | |_   _(_)_ __ ___      ]],
			[[    |  \| \ \ / / | '_ ` _ \     ]],
			[[    | |\  |\ V /| | | | | | |    ]],
			[[    |_| \_| \_/ |_|_| |_| |_|    ]],
			[[                                 ]],    
		}

		startify.section.bottom_buttons.val = {
			startify.button("q", " 󰅚  Quit NVIM", "<CMD>qa<CR>"),
			startify.button("rc", "  Nvim Config", "<CMD>e ~/.config/nvim/<CR>"),
			startify.button("i3", "  i3Config", "<CMD>e ~/.config/i3/config<CR>"),
			startify.button("pb", "󱒉  Polybar Config", "<CMD>e ~/.config/polybar/config.ini<CR>"),
			startify.button("al", "  Alacritty Config", "<CMD>e ~/.config/alacritty/alacritty.yml<CR>"),
			startify.button("br", "~/.bashrc", "<CMD>e ~/.bashrc<CR>"),
			startify.button("tc", "󱒉  Tmux Config", "<CMD>e ~/.config/tmux/tmux.conf<CR>"),
		}

		alpha.setup(startify.opts)

		-- Alpha (like startify)
		vim.api.nvim_set_keymap("n", "<Leader>st", "<CMD>tab Alpha<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<Leader>snt", "<CMD>Alpha<CR>", { noremap = true, silent = true })
	end,
}
