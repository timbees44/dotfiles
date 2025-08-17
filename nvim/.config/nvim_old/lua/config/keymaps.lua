-- require the obsidian.lua config
local obsidian = require("plugins.obsidian")

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move Lines
vim.keymap.del("n", "<A-j>", { desc = "Move down" })
vim.keymap.del("n", "<A-k>", { desc = "Move up" })
vim.keymap.del("i", "<A-j>", { desc = "Move down" })
vim.keymap.del("i", "<A-k>", { desc = "Move up" })
vim.keymap.del("v", "<A-j>", { desc = "Move down" })
vim.keymap.del("v", "<A-k>", { desc = "Move up" })

-- Workflows
-- navigate to vault
vim.keymap.set("n", "<leader>oo", ":cd $HOME/Documents/second_brain/")
--
-- strip date from note title and replace dashes with spaces
-- must have cursor on title
vim.keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")
--
-- search for files in full vault
vim.keymap.set("n", "<leader>os", ':Telescope find_files search_dirs={"$HOME/Documents/second_brain/"}<cr>')
vim.keymap.set("n", "<leader>oz", ':Telescope live_grep search_dirs={"$HOME/Documents/second_brain/"}<cr>')
--
-- search for files in projects
-- vim.keymap.set("n", "<leader>op", ':Telescope live_grep search_dirs={"$HOME/projects/"}<cr>')
vim.keymap.set("n", "<leader>op", function()
  require("telescope.builtin").find_files({
    search_dirs = { vim.fn.expand("$HOME") .. "/projects/" },
  })
end, { desc = "Open find files for projects" })

--
-- open daily note
vim.keymap.set("n", "<leader>ot", ":ObsidianToday")
--
-- for review workflow
-- move file in current buffer to zettelkasten folder
vim.keymap.set("n", "<leader>ok", ":!mv '%:p' $HOME/Documents/second_brain/zettelkasten<cr>:bd<cr>")
-- delete file in current buffer
vim.keymap.set("n", "<leader>odd", ":!rm '%:p'<cr>:bd<cr>")

vim.keymap.set("n", "<leader>on", function()
  vim.cmd("ObsidianNew")
end, { desc = "Create New Obsidian Note" })

vim.keymap.set("n", "<leader>oN", function()
  vim.cmd("ObsidianNewFromTemplate")
end, { desc = "Create New Obsidian Note" })
