require('lazy-plugin-manager')

require('settings')

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {})
vim.g.mapleader = " "
require('mappings')

