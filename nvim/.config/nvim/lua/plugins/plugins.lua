return {
	-- Plenary (required for Telescope)
	{ "nvim-lua/plenary.nvim" },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					hidden = true, -- show dotfiles
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden", -- include hidden files
					},
				},
				pickers = {
					find_files = {
						hidden = true,
						no_ignore = true,
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				-- Specify the languages you want installed
				ensure_installed = {
					"lua",
					"python",
					"javascript",
					"html",
					"css",
					"verilog",
					"bash",
					"markdown",
					"markdown_inline",
					"html",
					"yaml",
					"asm",
				}, -- add your languages here
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "markdown" },
				},
			})
		end,
	},

	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},

	-- autopairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup{
				check_ts = true,        -- enable treesitter integration
				enable_check_bracket_line = true,
				fast_wrap = {},         -- optional: enables wrapping with <M-e> by default
			}
		end
	},

	-- Mason
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason LSP + nvim-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			-- Mason installs these automatically
			local servers = { "lua_ls", "pyright", "ruff" }
			mason_lspconfig.setup({ ensure_installed = servers })

			local on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr, async = false })
						end,
					})
				end
			end


			-- Setup Mason-managed servers
			for _, server in ipairs(servers) do
				lspconfig[server].setup({ on_attach = on_attach })
			end
		end,
	}

}
