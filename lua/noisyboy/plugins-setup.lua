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
		use({ "ellisonleao/gruvbox.nvim" })
		use("nvim-tree/nvim-web-devicons")
		use("Pocco81/auto-save.nvim")
		use("windwp/nvim-autopairs")
		use("christoomey/vim-tmux-navigator")
		use("tpope/vim-surround")
		use("numToStr/Comment.nvim")
		use("kwkarlwang/bufjump.nvim")
		use("nanozuki/tabby.nvim")
		use({ "akinsho/toggleterm.nvim", tag = "*" })

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
		use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons" } })
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use({
			"nvim-telescope/telescope-file-browser.nvim",
			requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		})

		-- auto completion
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-cmdline")

		use("onsails/lspkind.nvim")
		use({
			"glepnir/lspsaga.nvim",
			branch = "main",
			requires = {
				{ "nvim-tree/nvim-web-devicons" },
				{ "nvim-treesitter/nvim-treesitter" },
			},
		})

		-- lsp server
		use("williamboman/mason.nvim")
		use("williamboman/mason-lspconfig.nvim")
		use("neovim/nvim-lspconfig")
		use("simrat39/rust-tools.nvim")
		use("hrsh7th/cmp-nvim-lsp-signature-help")

		-- snippets
		use({
			"L3MON4D3/LuaSnip",
			requires = {
				"saadparwaiz1/cmp_luasnip",
				"rafamadriz/friendly-snippets",
			},
		})

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
