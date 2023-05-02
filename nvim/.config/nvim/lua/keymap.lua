local default_opts = { noremap = true }

local update_opts = function(opts)
    return vim.tbl_extend("force", default_opts, opts or {})
end

local map = function(lhs, rhs, opts)
    vim.api.nvim_set_keymap("", lhs, rhs, update_opts(opts))
end

local nmap = function(lhs, rhs, opts)
    vim.api.nvim_set_keymap("n", lhs, rhs, update_opts(opts))
end

local imap = function(lhs, rhs, opts)
    vim.api.nvim_set_keymap("i", lhs, rhs, update_opts(opts))
end

local vmap = function(lhs, rhs, opts)
    vim.api.nvim_set_keymap("x", lhs, rhs, update_opts(opts))
end

local tmap = function(lhs, rhs, opts)
    vim.api.nvim_set_keymap("t", lhs, rhs, update_opts(opts))
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Regular "map" doesn't remap in insert mode (see :help map-modes)
map("<C-c>", "<Esc>")
imap("<C-c>", "<Esc>")
tmap("<Esc>", "<C-\\><C-n>")

map("<Space>", "<Nop>")

nmap("<leader>e", "<cmd>Neotree toggle dir=./<cr>")
nmap("<leader>s", "<cmd>update<cr>")
nmap("<leader>m", "<cmd>messages<cr>")
nmap("<leader>l", "<cmd>noh<cr>", { silent = true })
nmap("<leader>q", "<cmd>qa!<cr>")
nmap("<leader>c", "<cmd>close<cr>")

-- Center cursor location on next occurrence
nmap("<C-u>", "<C-u>zz")
nmap("<C-d>", "<C-d>zz")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")
nmap("J", "mzJ`z")

nmap("<C-h>", "<cmd>wincmd h<cr>")
nmap("<C-j>", "<cmd>wincmd j<cr>")
nmap("<C-k>", "<cmd>wincmd k<cr>")
nmap("<C-l>", "<cmd>wincmd l<cr>")

nmap("<C-Up>", "<cmd>resize +10<cr>")
nmap("<C-Down>", "<cmd>resize -10<cr>")
nmap("<C-Left>", "<cmd>vertical resize -10<cr>")
nmap("<C-Right>", "<cmd>vertical resize +10<cr>")

vmap("<", "<gv")
vmap(">", ">gv")
vmap("p", '"_dP')
nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
