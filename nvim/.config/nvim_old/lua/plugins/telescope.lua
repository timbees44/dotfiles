return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"venv",   -- ignores any folder named "venv"
					"env",    -- (optional) also ignore "env"
					"%.pyc",  -- ignore compiled python files
					"__pycache__", -- ignore pycache dirs
				},
			},
		})
	end
}
