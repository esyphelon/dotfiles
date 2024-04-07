local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"


if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    {
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup {
            icons = false,
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    },
    "nvim-treesitter/playground",
    "theprimeagen/harpoon",
    "theprimeagen/refactoring.nvim",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    {"lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
        end
    },
    "nvim-treesitter/nvim-treesitter-context",
    {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  dependencies = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
    },
    "folke/zen-mode.nvim",
    "github/copilot.vim",
    "eandrju/cellular-automaton.nvim",
    "laytan/cloak.nvim",
    "sainnhe/sonokai",
    "nvim-tree/nvim-web-devicons",
    {"nvim-tree/nvim-tree.lua",
        config = function()
            require('nvim-tree').setup({
                sort = { sorter = "case_sensitive" },
                view = { width  = 30},
                renderer = { group_empty = true },
                filters  = { dotfiles = true }
            })
        end
    },
}, {})
