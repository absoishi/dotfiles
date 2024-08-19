-- Emacs style
vim.keymap.set("c", "<C-a>", "<Home>", { noremap = true, silent = false })
if not vim.g.vscode then
	vim.keymap.set("c", "<C-e>", "<End>", { noremap = true, silent = false })
end
vim.keymap.set("c", "<C-f>", "<right>", { noremap = true, silent = false })
vim.keymap.set("c", "<C-b>", "<left>", { noremap = true, silent = false })
vim.keymap.set("c", "<C-d>", "<DEL>", { noremap = true, silent = false })
-- vim.keymap.set('c', '<C-h>', '<BS>', {noremap = true, silent = true})
vim.keymap.set("c", "<C-s>", "<BS>", { noremap = true, silent = false })
vim.keymap.set("i", "<C-a>", "<Home>", { noremap = true, silent = false })
vim.keymap.set("i", "<C-e>", "<End>", { noremap = true, silent = false })
vim.keymap.set("i", "<C-f>", "<right>", { noremap = true, silent = false })
vim.keymap.set("i", "<C-b>", "<left>", { noremap = true, silent = false })
vim.keymap.set("i", "<C-h>", "<left>", { noremap = true, silent = false })
vim.keymap.set("i", "<C-l>", "<right>", { noremap = true, silent = false })
vim.keymap.set("i", "<C-k>", "<up>", { noremap = true, silent = false })
vim.keymap.set("i", "<C-j>", "<down>", { noremap = true, silent = false })
