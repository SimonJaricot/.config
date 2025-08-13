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
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = '1' -- Show fold column
vim.opt.foldtext = ""
vim.opt.foldlevel = 99   -- Set a high fold level to keep folds open by default
vim.opt.foldlevelstart = 1

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
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/echasnovski/mini.nvim",          version = "stable" },
	{ src = "https://github.com/norcalli/nvim-colorizer.lua" },
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
require 'colorizer'.setup {
	'*',
}

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
		enable = true, -- false will disable the whole extension
		additional_vim_regex_highlighting = false,
	},
})

require 'lualine'.setup({})

require 'CopilotChat'.setup({
	window = {
		layout = 'float',
		border = "rounded",   -- Border style for the chat window
		height = 40,          -- Height of the chat window
		width = 80,           -- Width of the chat window
		zindex = 100,         -- Z-index for the chat window
		title = "Copilot Chat", -- Title for the chat window
	},
	headers = {
		user = '👤 You: ',
		assistant = '🤖 Copilot: ',
		tool = '🔧 Tool: ',
	},
})

require 'mini.pairs'.setup()
require 'mini.surround'.setup({
	mappings = {
		add = 'sa',
		delete = 'sd',
		find = 'sf',
		find_left = 'sF',
		replace = 'sr',
		surround = '',
	},
})

require 'mini.icons'.setup()
require 'mini.tabline'.setup({
	show_icons = true,
})

require('mini.starter').setup({
	header = [[
                                             ___
                                          ,o88888
                                       ,o8888888'
                 ,:o:o:oooo.        ,8O88Pd8888"
             ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"
           ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"
          , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"
         , ..:.::o:ooOoOO8O888O8O,COCOO"
        , . ..:.::o:ooOoOOOO8OOOOCOCO"
         . ..:.::o:ooOoOoOO8O8OCCCC"o
            . ..:.::o:ooooOoCoCCC"o:o
            . ..:.::o:o:,cooooCo"oo:o:
         `   . . ..:.:cocoooo"'o:o:::'
         .`   . ..::ccccoc"'o:o:o:::'
        :.:.    ,c:cccc"':.:.:.:.:.'
      ..:.:"'`::::c:"'..:.:.:.:.:.'
    ...:.'.:.::::"'    . . . . .'
   .. . ....:."' `   .  . . ''
 . . . ...."'
 .. . ."'
.
  ]],
	footer = "Press :q to quit.",
	items = {
		{ action = "edit ~/.config/nvim/init.lua", name = "Edit config", section = "Config" },
		{ action = "Pick files",                   name = "Find files",  section = "Pick" },
		{ action = "Pick grep_live",               name = "Grep live",   section = "Pick" },
	},
	content_hooks = {
		require('mini.starter').gen_hook.adding_bullet("» "),
		require('mini.starter').gen_hook.aligning("center", "center"),
	},
})
require 'mini.notify'.setup()

local map = vim.keymap.set

map('n', '<leader>w', ':write<CR>', { desc = 'Write changes' })
map('n', '<leader>o', ':source<CR>', { desc = 'Source the current file' })
map('n', '<leader>,', ':WhichKey<CR>', { desc = 'Show keys' })
map('n', '<leader>e', ':Oil --float<CR>', { desc = 'Open Oil (float)' })
map('n', '<leader>lf', vim.lsp.buf.format, { desc = 'Format file' })
map('n', '<leader>ff', ':Pick files<CR>', { desc = 'Find files' })
map('n', '<leader>fg', ':Pick grep_live<CR>', { desc = 'Find in files (grep_live)' })
map('n', '<leader>x', '<C-w>d', { desc = 'Show cursor diagnostic message', noremap = true, silent = true })
map('n', '<leader>te', ':bot term<CR>', { desc = 'Open the terminal', noremap = true, silent = true })
map('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode', noremap = true, silent = true })
map('n', '<C-h>', '<C-w>h', { desc = 'Move to the window on the left', noremap = true, silent = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to the window on the bottom', noremap = true, silent = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to the window on the top', noremap = true, silent = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to the window on the right', noremap = true, silent = true })
map('n', '<leader>cc', ':CopilotChatToggle<CR>', { desc = 'Toggle CopilotChat', noremap = true, silent = true })
-- redefine [b (tab nabigation) to another keymap <Tab> to use mini.tabline
map('n', '<Tab>', ':bnext<CR>', { desc = 'Next tab', noremap = true, silent = true })
map('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous tab', noremap = true, silent = true })
map('n', '<leader>d', ':bdelete<CR>', { desc = 'Delete current buffer', noremap = true, silent = true })

local gitsigns = require('gitsigns')

map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'Preview hunk inline' })
map('n', '<leader>hb', function()
	gitsigns.blame_line({ full = true })
end, { desc = "Blame in line" })

map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff this hunk' })

map('n', '<leader>hD', function()
	gitsigns.diffthis('~')
end, { desc = 'Diff this hunk with the previous commit' })

map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, { desc = 'Set quickfix list with all hunks' })
map('n', '<leader>hq', gitsigns.setqflist, { desc = 'Set quickfix list with current hunk' })

-- Toggles
map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle current line blame' })
map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'Toggle word diff' })

-- Text object
map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'Select hunk' })


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
