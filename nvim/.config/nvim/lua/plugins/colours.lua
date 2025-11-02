-- lua/plugins/colorscheme.lua
local colorscheme = "nord"

return {
	-- Gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			if colorscheme == "gruvbox" then
				require("gruvbox").setup({
					contrast = "hard",
					transparent_mode = true,
				})
				vim.cmd.colorscheme("gruvbox")
			end
		end,
	},

	-- Sonokai
	{
		"sainnhe/sonokai",
		priority = 1000,
		config = function()
			if colorscheme == "sonokai" then
				vim.g.sonokai_enable_italic = true
				-- vim.g.sonokai_style = "andromeda" -- optional, or "default"
				vim.g.sonokai_transparent_background = 1
				vim.cmd.colorscheme("sonokai")
			end
		end,
	},
	
	-- Nord
	{
		'AlexvZyl/nordic.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			if colorscheme == "nord" then
				require("nordic").setup({
					transparent = {
						bg = true,  -- Enable transparent background
						float = true, -- Enable transparency for floating windows
					},
				})
				vim.cmd.colorscheme("nordic")
			end
		end,
	},
}
