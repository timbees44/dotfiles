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
					file_ignore_patterns = {}, -- don’t ignore anything
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
						"--no-ignore", -- don’t respect .gitignore
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
	},

	-- Mason (installs LSP servers)
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason LSP Config + LSPConfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "nvim-lspconfig", "williamboman/mason.nvim" },
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")

			-- List of servers to install and configure
			local servers = { "pyright", "lua_ls", "ruff" }

			-- Ensure Mason installs them
			mason_lspconfig.setup({ ensure_installed = servers })

			-- Reusable on_attach function for format-on-save
			local on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr, async = false })
						end,
					})
				end
			end

			-- Setup each server
			for _, server in ipairs(servers) do
				lspconfig[server].setup({ on_attach = on_attach })
			end
		end,
	},
}
