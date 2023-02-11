-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("i", "jk", "<ESC>")
    
-- MOVE LINES UP AND DOWN
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- COPY TO SYSTEM CLIPBOARD
map("", "<leader>y", '"+y')
map("", "<leader>p", '"+p')


-- WINDOW NAVIGATION
map("n", "C-h>", "<C-w>h")
map("n", "C-j>", "<C-w>j")
map("n", "C-k>", "<C-w>k")
map("n", "C-l>", "<C-w>l")
