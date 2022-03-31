-- 
-- Tin's NeoVim plugin configuration
--
--

-- vim.g.mapleader = ","

-- Only required if packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


require("packer").startup({
  function(use)
        -- it is recommened to put impatient.nvim before any other plugins
	use {'lewis6991/impatient.nvim', config = [[require('impatient')]]}
	
	use({"wbthomason/packer.nvim", opt = true})
	
	use({"onsails/lspkind-nvim", event = "VimEnter"})
	
	use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
        -- use({ "neovim/nvim-lspconfig", config = [[require('config.lsp')]] })	
	use {
	    'phaazon/hop.nvim',
	    branch = 'v1', -- optional but strongly recommended
	    config = function()
	    -- you can configure Hop the way you like here; see :h hop-config
	    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
	    end}
	
	use {'kevinhwang91/nvim-hlslens'}
	
	
	use {
	  'nvim-telescope/telescope.nvim', cmd = 'Telescope',
	  requires = { {'nvim-lua/plenary.nvim'}, event = 'VimEnter' }
	}

	-- color themes
	use({"lifepillar/vim-gruvbox8", opt = true})
	use({"navarasu/onedark.nvim", opt = true})
	use({"sainnhe/edge", opt = true})
	use({"sainnhe/sonokai", opt = true})
	use({"sainnhe/gruvbox-material", opt = true})
	use({"shaunsingh/nord.nvim", opt = true})
	use({"NTBBloodbath/doom-one.nvim", opt = true})
	use({"sainnhe/everforest", opt = true})
	use({"EdenEast/nightfox.nvim", opt = true})
	use({"rebelot/kanagawa.nvim", opt = true})
	
	use {'kyazdani42/nvim-web-devicons', event = 'VimEnter'}
	
	use({ "tpope/vim-fugitive", event = "User InGitRepo" })
	
	use {'glepnir/dashboard-nvim'}
	
	-- use { 'roxma/nvim-completion-manager' }
	
	use { 'junegunn/vim-easy-align'}
	
	use {
	        'kyazdani42/nvim-tree.lua',
	        requires = {
	          'kyazdani42/nvim-web-devicons', -- optional, for file icon
	        },
	        config = function() require'nvim-tree'.setup {} end
	    }

	use {'romgrk/barbar.nvim'}
 

  end})

require('keybindings')
require('plugins/hlslens')
require('plugins/telescope')
require('plugins/nvimtree')
require('plugins/hop')
require('plugins/lsp')

-- Uncomment this only after Packer is installed/updated
require'lspconfig'.pyright.setup{}

-- Plug 'jiangmiao/auto-pairs'
-- Plug 'rust-lang/rust.vim'
-- Plug 'vim-syntastic/syntastic'
	-- use { 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }}


-- map the leader key
vim.g.mapleader = ','  -- 'vim.g' sets global variables


