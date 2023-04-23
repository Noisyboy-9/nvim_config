-- setup packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local ok, packer = pcall(require, "packer")
if not ok then
    print("packer can't be required")
    return
end

return packer.startup({
    function(use)
        --basic
        use("wbthomason/packer.nvim")
        use("natecraddock/workspaces.nvim")
        use({ "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" })
        use("nvim-lua/plenary.nvim")
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
        use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
        use("nvim-tree/nvim-web-devicons")
        use("windwp/nvim-autopairs")
        use("tpope/vim-surround")
        use("numToStr/Comment.nvim")
        use("kwkarlwang/bufjump.nvim")
        use("nanozuki/tabby.nvim")
        use({ "akinsho/toggleterm.nvim", tag = "*" })

        -- colorscheme
        use({ "rose-pine/neovim", as = "rose-pine" })
        use("xiyaowong/transparent.nvim")

        -- git
        use({ "kdheepak/lazygit.nvim" })
        use({ "lewis6991/gitsigns.nvim" })

        use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } })

        -- nvim telescope
        use({
            "nvim-telescope/telescope.nvim",
            tag = "0.1.1",
            requires = { { "nvim-lua/plenary.nvim" } },
        })
        use("debugloop/telescope-undo.nvim")
        use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons" } })
        use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
        use({
            "nvim-telescope/telescope-file-browser.nvim",
            requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        })
        use("theprimeagen/harpoon")
        -- lsp
        use({
            "VonHeikemen/lsp-zero.nvim",
            branch = "v2.x",
            requires = {
                { "williamboman/mason-lspconfig.nvim" },
                { "neovim/nvim-lspconfig" },
                {
                    "williamboman/mason.nvim",
                    run = function()
                        pcall(vim.cmd, "MasonUpdate")
                    end,
                },

                -- autocomplete
                { "hrsh7th/nvim-cmp" },
                { "hrsh7th/cmp-buffer" },
                { "hrsh7th/cmp-path" },
                { "saadparwaiz1/cmp_luasnip" },
                { "hrsh7th/cmp-nvim-lsp" },
                { "hrsh7th/cmp-nvim-lua" },
                { "hrsh7th/cmp-cmdline" },

                -- snippets
                { "L3MON4D3/LuaSnip" },
                { "onsails/lspkind.nvim" },
            },
        })

        use("simrat39/rust-tools.nvim")
        use("hrsh7th/cmp-nvim-lsp-signature-help")

        -- golang
        use("ray-x/go.nvim")
        use("ray-x/guihua.lua")

        -- formatters
        use({ "mhartington/formatter.nvim" })

        if packer_bootstrap then
            require("packer").sync()
        end
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})
