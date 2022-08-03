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

vim.opt.shortmess:append "c"
vim.opt.iskeyword:append "-"
vim.opt.whichwrap:append "<,>,[,],h,l"

vim.g.netrw_banner=0
--
-------------------------------------------
-------------- KEYMAPS --------------------
-------------------------------------------

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.user_emmet_leader_key='<C-A>'

-- keymap("", "q", "<Nop>", opts)
-- keymap("", "Q", "<Nop>", opts)
keymap("", "<C-A>", "<Nop>", opts)

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- NORMAL --

keymap("n", "<leader>r", ":source $MYVIMRC<cr> | :PackerSync<cr>", opts)
keymap("n", "<leader>s", ":update<cr>", opts)
keymap("n", "<leader>e", ":Lex 25<cr>", opts)
keymap("n", "<leader>l", ":nohl<cr>", opts)
keymap("n", "<leader>q", ":qa!<cr>", opts)
keymap("n", "<leader>n", ":tabnew<cr>", opts)
keymap("n", "<leader>c", "<c-w>c", opts)
keymap("n", "K", "i<CR><Esc>", opts)
keymap("n", "Y", "y$", opts)

-- Preserve cursor location for according actions
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

keymap("n", "<C-h>", "<C-W>h<cr>", opts)
keymap("n", "<C-j>", "<C-W>j<cr>", opts)
keymap("n", "<C-k>", "<C-W>k<cr>", opts)
keymap("n", "<C-l>", "<C-W>l<cr>", opts)

keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "<tab>", "gt", opts)
keymap("n", "<S-tab>", "gT", opts)

keymap("n", "<m-j>", ":m +1<cr>", opts)
keymap("n", "<m-k>", ":m -2<cr>", opts)

keymap("i", "<C-c>", "<Esc>", opts)
-- VISUAL --
-- Preserve visual selection while indenting text
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<m-j>", ":move '>+1<CR>gv-gv", opts)
keymap("v", "<m-k>", ":move '<-2<CR>gv-gv", opts)

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

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"

    use "nvim-lua/plenary.nvim"
    use "tpope/vim-surround"
    use {
        "folke/tokyonight.nvim", 
        config = function()
            vim.cmd("colorscheme tokyonight")
        end
    }

    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"

    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    use {  
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            require("luasnip/loaders/from_vscode").lazy_load()

            local check_backspace = function()
                local col = vim.fn.col "." - 1
                return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
            end

            local kind_icons = {
                Text = "",
                Method = "m",
                Function = "",
                Constructor = "",
                Field = "",
                Variable = "",
                Class = "",
                Interface = "",
                Module = "",
                Property = "",
                Unit = "",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "",
                Event = "",
                Operator = "",
                TypeParameter = "",
            }
           
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = {
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                    ["<C-e>"] = cmp.mapping {
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    },
                    ["<CR>"] = cmp.mapping.confirm { select = true },
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expandable() then
                            luasnip.expand()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif check_backspace() then
                            fallback()
                        else
                            fallback()
                        end
                    end, {
                            "i",
                            "s",
                        }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, {
                            "i",
                            "s",
                        }),
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        -- Kind icons
                        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                        vim_item.menu = ({
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        })[entry.source.name]
                        return vim_item
                    end,
                },
                sources = {
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
            })
        end
    }

    use {
        "norcalli/nvim-colorizer.lua", 
        config = function()
            require("colorizer").setup()
        end
    }

    use { "windwp/nvim-autopairs",
        config = function() 
            require("nvim-autopairs").setup {
                check_ts = true,
                disable_filetype = {"TelescopePrompt"},
            } 

            local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
        end
    }

    use {  
        "windwp/nvim-ts-autotag",
        config = function()
            require('nvim-ts-autotag').setup()
        end
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = "lua",
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true
                },
                indent = {
                    enable = true,
                    disable = { "yaml" }
                },
                -- autotag = {
                --     enable = true
                -- }
            }
        end,
        run = "TSUpdate"
    }

    use "mattn/emmet-vim"
    use "tpope/vim-commentary"

    use "williamboman/nvim-lsp-installer"
    use "neovim/nvim-lspconfig"

    if packer_bootstrap then
        require('packer').sync()
    end
end)
