local default_opts = { noremap = true }

local update_opts = function(opts)
    return vim.tbl_extend("force", default_opts, opts or {})
end

local nmap = function(lhs, rhs, opts)
    vim.api.nvim_set_keymap("n", lhs, rhs, update_opts(opts))
end

local map = function(lhs, rhs, opts)
    vim.api.nvim_set_keymap("", lhs, rhs, update_opts(opts))
end

local imap = function(lhs, rhs, opts)
    vim.api.nvim_set_keymap("i", lhs, rhs, update_opts(opts))
end

local vmap = function(lhs, rhs, opts)
    vim.api.nvim_set_keymap("x", lhs, rhs, update_opts(opts))
end

vim.g.mapleader = " "
vim.g.maplocalleader = ";"
vim.g.user_emmet_leader_key = '<C-A>'

map("<C-c>", "<Esc>")
map("<C-A>", "<Nop>")
map("<Space>", "<Nop>")
-- Regural "map" doesn't remap in insert mode (see :help map-modes)
imap("<C-c>", "<Esc>")

-- nmap("<leader>e", "<cmd>Lexplore<cr>")
nmap("<leader>e", "<cmd>NvimTreeToggle<cr>")
nmap("<leader>s", "<cmd>update<cr>")
nmap("<leader>m", "<cmd>messages<cr>")
nmap("<cr>", "<cmd>noh<cr><cr>", { silent = true })
nmap("<leader>l", "<cmd>noh<cr><cr>", { silent = true })
nmap("<leader>q", "<cmd>qa!<cr>")
nmap("<leader>c", "<cmd>close<cr>")
nmap("<leader>a", "<cmd>keepjumps normal! ggVG<cr>")

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

nmap("<C-Up>", "<cmd>resize +2<cr>")
nmap("<C-Down>", "<cmd>resize -2<cr>")
nmap("<C-Left>", "<cmd>vertical resize -2<cr>")
nmap("<C-Right>", "<cmd>vertical resize +2<cr>")

-- Preserve visual selection after indenting
vmap("<", "<gv")
vmap(">", ">gv")

-- Preserve clipboard contens when pasting in visual mode
vmap("p", '"_dP')

-- Reload packer file
nmap("<leader>ps", "<cmd>exe 'source' stdpath('config') .. '/lua/core/packer.lua' <bar> PackerSync<cr>")
-- nmap("<leader>ps", "<cmd>source $MYVIMRC <bar> PackerSync<cr>")
nmap("<leader>pi", "<cmd>Mason<cr>")
nmap("<leader>pp", "<cmd>LspInfo<cr>")


nmap('<leader>ff', "<cmd>Telescope find_files<cr>")
nmap('<leader>fg', "<cmd>Telescope live_grep<cr>")
nmap('<leader>fb', "<cmd>Telescope buffers<cr>")
nmap('<leader>fh', "<cmd>Telescope help_tags<cr>")

