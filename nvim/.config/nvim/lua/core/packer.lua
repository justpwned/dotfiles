local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({ function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'

    use 'kyazdani42/nvim-web-devicons'
    use 'folke/tokyonight.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use "norcalli/nvim-colorizer.lua"

    use {
        "nvim-treesitter/nvim-treesitter",
        run = "TSUpdate"
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-telescope/telescope.nvim'

    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'mattn/emmet-vim'

    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"

    use "hrsh7th/cmp-nvim-lsp"
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lua"

    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"


    if packer_bootstrap then
        require('packer').sync()
    end
end,
config = {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end
    }
}
})
