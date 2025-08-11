vim.opt.winborder = "rounded"
vim.opt.tabstop = 2
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.signcolumn = "yes"

vim.g.mapleader = ' '


vim.pack.add({
	{ src = 'https://github.com/echasnovski/mini.pick' },
	{ src = 'https://github.com/folke/which-key.nvim' },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/EdenEast/nightfox.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/fang2hou/blink-copilot" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim" },
})

require 'mason'.setup()
require 'mini.pick'.setup()
require 'oil'.setup({
	show_hidden = true,
	float = {
		max_width = 60,
		-- Place the floating window on the left side
		override = function(conf)
			conf.col = 0 -- Align to the left edge of the editor
			return conf
		end,
	},
})
require 'which-key'.setup()

require 'copilot'.setup {
	filetypes = {
		markdown = true,
		terraform = true,
		yaml = true,
		javascript = true,
		typescript = true,
	},
}

require 'blink-cmp'.setup({
	completion = {
		documentation = { auto_show = true },
	},
	sources = {
		default = { "copilot", "lsp", "snippets", "path", "buffer", "omni" },
		providers = {
			copilot = {
				name = "copilot",
				module = "blink-copilot",
				score_offset = 100,
				async = true,
			},
		},
	},
	keymap = {
		preset = "default",
		['<Tab>'] = { 'select_next', 'fallback' },
		['<S-Tab>'] = { 'select_prev', 'fallback' },
		['<CR>'] = { 'accept', 'fallback' },
	},
})

require 'nvim-treesitter.configs'.setup({
	ensure_installed = { 'c', 'lua', 'python', 'rust', 'terraform', 'toml', 'vim', 'vimdoc', 'yaml' },
	sync_install = true,
	auto_install = true,
	highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
})

require 'lualine'.setup({})

require 'CopilotChat'.setup({
	window = {
		layout = 'float',
		border = "rounded", -- Border style for the chat window
		height = 40, -- Height of the chat window
		width = 80, -- Width of the chat window
		zindex = 100, -- Z-index for the chat window
		title = "Copilot Chat", -- Title for the chat window
	},
	headers = {
		user = '👤 You: ',
    assistant = '🤖 Copilot: ',
    tool = '🔧 Tool: ',
	},
})


local map = vim.keymap.set

map('n', '<leader>w', ':write<CR>', { desc = 'Write changes' })
map('n', '<leader>o', ':source<CR>', { desc = 'Source the current file' })
map('n', '<leader>,', ':WhichKey<CR>', { desc = 'Show keys' })
map('n', '<leader>e', ':Oil --float<CR>', { desc = 'Open Oil (float)' })
map('n', '<leader>lf', vim.lsp.buf.format, { desc = 'Format file' })
map('n', '<leader>ff', ':Pick files<CR>', { desc = 'Find files' })
map('n', '<leader>fg', ':Pick grep_live<CR>', { desc = 'Find in files (grep_live)' })
map('n', '<leader>x', '<C-w>d', { desc = 'Show cursor diagnostic message', noremap = true, silent = true })
map('n', '<leader>t', ':bot term<CR>', { desc = 'Open the terminal', noremap = true, silent = true })
map('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode', noremap = true, silent = true })
map('n', '<C-h>', '<C-w>h', { desc = 'Move to the window on the left', noremap = true, silent = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to the window on the bottom', noremap = true, silent = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to the window on the top', noremap = true, silent = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to the window on the right', noremap = true, silent = true })
map('n', '<leader>cc', ':CopilotChatToggle<CR>', { desc = 'Toggle CopilotChat', noremap = true, silent = true })

vim.diagnostic.config({
	virtual_text = false,    -- Show diagnostic messages as virtual text in the editor
	signs = true,            -- Show signs in the sign column
	underline = true,        -- Underline problematic code
	update_in_insert = false, -- Don't update diagnostics in insert mode
	severity_sort = true,    -- Sort diagnostics by severity
	float = {
		focusable = false,     -- Float window can be focused
		style = "minimal",     -- Minimal style for the floating window
		border = "rounded",    -- Rounded border for the floating window
		source = "always",     -- Always show the source of the diagnostic
		header = "",           -- No header
		prefix = "",           -- No prefix
	},
})

vim.lsp.enable({
	"lua_ls", "terraformls", "ruff", "yamlls", "pyright",
})

require 'nightfox'.setup({
	transparent = true,
})

vim.cmd("colorscheme duskfox")
