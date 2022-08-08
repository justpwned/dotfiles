local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.cmd [[packadd packer.nvim]]
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
    use "folke/tokyonight.nvim"

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    -- NVIM Lua API
    use "hrsh7th/cmp-nvim-lua"

    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"

    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "mfussenegger/nvim-dap-python"
    use "theHamsta/nvim-dap-virtual-text"

    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    use "nvim-telescope/telescope.nvim"

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
                disable_filetype = { "TelescopePrompt" },
            }

            local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
    }

    use {
        "windwp/nvim-ts-autotag",
        config = function()
            require('nvim-ts-autotag').setup()
        end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
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

    use "akinsho/toggleterm.nvim"

    use "mattn/emmet-vim"
    use "tpope/vim-commentary"


    if packer_bootstrap then
        require('packer').sync()
    end
end)
