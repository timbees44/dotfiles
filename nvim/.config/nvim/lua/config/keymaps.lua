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
