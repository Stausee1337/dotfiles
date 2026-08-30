vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  use 'wbthomason/packer.nvim'

  use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.2',
	-- or                            , branch = '0.1.x',
  	requires = { {'nvim-lua/plenary.nvim'} },
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  }

  use { "catppuccin/nvim", as = "catppuccin" }

  use { 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} }

  use {
	  'nvim-lualine/lualine.nvim',
	  vim.api.nvim_set_hl(0, "Normal", { bg = "none" }),
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

--  use {
--  	'VonHeikemen/lsp-zero.nvim',
--  	branch = 'v2.x',
--	requires = {
--		-- LSP Support
--		{'neovim/nvim-lspconfig'},             -- Required
--		{                                      -- Optional
--		'williamboman/mason.nvim',
--		run = function()
--			pcall(vim.cmd, 'MasonUpdate')
--		end,
--	},
--	{'williamboman/mason-lspconfig.nvim'}, -- Optional
--
--	-- Autocompletion
--	{'hrsh7th/nvim-cmp'},     -- Required
--	{'hrsh7th/cmp-nvim-lsp'}, -- Required
--	{'L3MON4D3/LuaSnip'},     -- Required
--}
--}

    use('neovim/nvim-lspconfig')

    use {                                      -- Optional
		'williamboman/mason.nvim',
		run = function()
			pcall(vim.cmd, 'MasonUpdate')
		end,
	}

    use {'williamboman/mason-lspconfig.nvim'}

    use('hrsh7th/nvim-cmp')     -- Required
    use('hrsh7th/cmp-nvim-lsp') -- Required
    use('L3MON4D3/LuaSnip')     -- Required

    use('tpope/vim-fugitive')


    use {
        "christoomey/vim-tmux-navigator"
    }
    use { "vim-utils/vim-man" }
    use { "maxbane/vim-asm_ca65" }

    use {
        'mg979/vim-visual-multi',
        branch = 'master'
    }


end)
