return {
	"MeanderingProgrammer/render-markdown.nvim",
	enabled = true,
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	event = { "BufReadPre *.md", "BufNewFile *.md" },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		render_modes = true,
		file_types = { "markdown", "quarto" },
		anti_conceal = {
			enabled = true,
			-- Which elements to always show, ignoring anti conceal behavior. Values can either be booleans
			-- to fix the behavior or string lists representing modes where anti conceal behavior will be
			-- ignored. Possible keys are:
			--  head_icon, head_background, head_border, code_language, code_background, code_border
			--  dash, bullet, check_icon, check_scope, quote, table_border, callout, link, sign
			ignore = {
				code_background = false,
				sign = true,
			},
			above = 0,
			below = 0,
		},
		bullet = { right_pad = 1 },
		heading = {
			position = "inline",
			width = "full",
			icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
			backgrounds = {
			},

		},
		checkbox = {
			right_pad = 1,
		},
		code = {
			enabled = true,
			style = "full",
			width = "block",
			language_icon = true,
			language_name = true,
		},
	},
}
