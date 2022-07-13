vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 2
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.showmode = true
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeoutlen = 1000
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17"
vim.cmd("colorscheme tokyonight")

vim.opt.shortmess:append "c"
vim.opt.iskeyword:append "-"
vim.opt.whichwrap:append "<,>,[,],h,l"

vim.g.netrw_banner=0


-------------------------------------------
-------------- KEYMAPS --------------------
-------------------------------------------

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.user_emmet_leader_key='<C-A>'

keymap("", "q", "<Nop>", opts)
keymap("", "Q", "<Nop>", opts)
keymap("", "<C-A>", "<Nop>", opts)

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- NORMAL --

keymap("n", "<leader>r", ":source $MYVIMRC<cr> | :PackerSync<cr>", opts)
keymap("n", "<leader>s", ":update<cr>", opts)
keymap("n", "<leader>e", ":Lex 30<cr>", opts)
keymap("n", "<leader>l", ":nohl<cr>", opts)
keymap("n", "<leader>q", ":qa!<cr>", opts)
keymap("n", "K", "i<CR><Esc>", opts)
keymap("n", "Y", "y$", opts)

-- Preserve cursor location for according actions
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

keymap("n", "<C-h>", ":wincmd h<cr>", opts)
keymap("n", "<C-j>", ":wincmd j<cr>", opts)
keymap("n", "<C-k>", ":wincmd k<cr>", opts)
keymap("n", "<C-l>", ":wincmd l<cr>", opts)

keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- VISUAL --
-- Preserve visual selection while indenting text
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)

-- Preserve clipboard contents when pasting
keymap("v", "p", '"_dP', opts)


----------------------------------------
------------ PLUGINS -------------------
----------------------------------------

-- Boostrapping packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require("packer").init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Plugin configuration

require('colorizer').setup()

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "folke/tokyonight.nvim"
    use "norcalli/nvim-colorizer.lua"
    use "tpope/vim-surround"
    use "mattn/emmet-vim"
    use "tpope/vim-commentary"
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins

    if packer_bootstrap then
        require('packer').sync()
    end
end)

