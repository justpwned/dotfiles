local opts = { noremap = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.user_emmet_leader_key = '<C-A>'

-- keymap("", "q", "<Nop>", opts)
-- keymap("", "Q", "<Nop>", opts)
keymap("", "<C-A>", "<Nop>", opts)

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("c", "<c-j>", "<c-n>", opts)
keymap("c", "<c-k>", "<c-p>", opts)

keymap("n", "<leader>pr", "<cmd>PackerSync<cr>", opts)
keymap("n", "<leader>ps", "<cmd>source %<cr>", opts)
keymap("n", "<leader>s", "<cmd>update<cr>", opts)
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<leader>l", "<cmd>nohl<cr>", opts)
keymap("n", "<leader>q", "<cmd>qa!<cr>", opts)
keymap("n", "<leader>c", "<cmd>close<cr>", opts)
-- keymap("n", "K", "i<CR><Esc>", opts)
keymap("n", "Y", "y$", opts)

-- Preserve cursor location
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

keymap("n", "<C-h>", "<cmd>wincmd h<cr>", opts)
keymap("n", "<C-j>", "<cmd>wincmd j<cr>", opts)
keymap("n", "<C-k>", "<cmd>wincmd k<cr>", opts)
keymap("n", "<C-l>", "<cmd>wincmd l<cr>", opts)

keymap("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- Navigate buffers
-- keymap("n", "<S-l>", "<cmd>bnext<cr>", opts)
-- keymap("n", "<S-h>", "<cmd>bprevious<cr>", opts)

keymap("n", "<tab>", "gt", opts)
keymap("n", "<S-tab>", "gT", opts)

keymap("n", "<m-j>", "<cmd>m +1<cr>", opts)
keymap("n", "<m-k>", "<cmd>m -2<cr>", opts)

keymap("i", "<C-c>", "<Esc>", opts)
-- VISUAL --
-- Preserve visual selection while indenting text
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<m-j>", "<cmd>move '>+1<CR>gv-gv", opts)
keymap("v", "<m-k>", "<cmd>move '<-2<CR>gv-gv", opts)

-- Preserve clipboard contents when pasting
keymap("v", "p", '"_dP', opts)

-- LSP
keymap("n", "<leader>pp", "<cmd>LspInfo<CR>", opts)
keymap("n", "<leader>pi", "<cmd>Mason<CR>", opts)

-- Telescope
keymap("n", "<leader>f",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>"
    , opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>bl", "<cmd>Telescope buffers<cr>", opts)

keymap("n", "<leader>js", ":!node %<CR>", opts)

keymap("n", "<leader>v", "<cmd>lua _LIVESERVER_TOGGLE()<CR>", opts)
