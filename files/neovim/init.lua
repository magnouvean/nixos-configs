-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'
-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- Keep selection when indenting with < or >
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
-- Enable spell checking
vim.opt.spell = true


-- Which-key
vim.opt.timeoutlen = 300
require('which-key').setup {}


-- Treesitter
require('nvim-treesitter.configs').setup {
	highlight = { enable = true, additional_vim_regex_highlighting = false },
	indent = { enable = true }
}
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false


-- Comments
require('Comment').setup {}


-- Bufferline
require('bufferline').setup {}


-- Autopairing
require('nvim-autopairs').setup {}


-- ToggleTerm
require('toggleterm').setup {}
vim.keymap.set('n', '<F12>', function() vim.cmd('ToggleTerm direction=float') end)
vim.keymap.set('t', '<F12>', function() vim.cmd('ToggleTerm') end)


-- REPL
local iron = require('iron.core')
iron.setup {
	config = {
		repl_definition = {
			python = {
				command = { "ipython", "--no-autoindent" }
			},
			sh = {
				command = { "zsh" }
			},
		},
		repl_open_cmd = require('iron.view').split.rightbelow('30%'),
	},
	keymaps = {
		send_motion = "<space>sc",
		visual_send = "<space>sc",
		send_file = "<space>sf",
		send_line = "<space>sl",
		send_until_cursor = "<space>su",
		send_mark = "<space>sm",
		mark_motion = "<space>mc",
		mark_visual = "<space>mc",
		remove_mark = "<space>md",
		cr = "<space>s<cr>",
		interrupt = "<space>s<space>",
		exit = "<space>sq",
		clear = "<space>cl",
	},
	ignore_blank_lines = true,
}
vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')


-- Theme
require("catppuccin").setup({
	flavour = "frappe",
	background = {
		light = "latte",
		dark = "frappe",
	},
	transparent_background = false,
	show_end_of_buffer = false,
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false,
	no_bold = false,
	no_underline = false,
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		which_key = true,
		cmp = true,
		gitsigns = true,
		notify = false,
		nvimtree = true,
		treesitter = true,
		markdown = true,
	},
})
vim.cmd.colorscheme "catppuccin"


-- Lualine
require('lualine').setup {
	options = {
		theme = "catppuccin",
		icons_enabled = true,
	}
}


-- Setup language servers.
local lspconfig = require('lspconfig')

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		vim.bo[ev.buf].formatexpr = nil
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

local servers = {
	'gdscript', 'rust_analyzer', 'pylsp', 'rnix', 'texlab', 'r_language_server', 'lua_ls'
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snipperSupport = true
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup { capabilities = capabilities }
end

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]


-- Markdown preview bindings
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'markdown',
	callback = function()
		vim.keymap.set('n', '<leader>mpp', '<CMD>MarkdownPreview<CR>', { silent = true, buffer = true })
		vim.keymap.set('n', '<leader>mps', '<CMD>MarkdownPreviewStop<CR>', { silent = true, buffer = true })
		vim.keymap.set('n', '<leader>mpt', '<CMD>MarkdownPreviewToggle<CR>', { silent = true, buffer = true })
	end
})


-- Snippets
local luasnip = require('luasnip')


-- Completion
local cmp = require('cmp')
cmp.setup {
	snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
	mapping = cmp.mapping.preset.insert({
		['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
		['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		}
	}),
	completion = {
		completeopt = "menu,menuone,noinsert"
	},
	sources = { { name = 'nvim_lsp' }, { name = 'nvim_lsp_signature_help' }, { name = 'luasnip' } }
}


-- File picker/tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
local function my_on_attach(bufnr)
	local api = require('nvim-tree.api')
	local function opts(desc)
		return {
			desc = 'nvim-tree: ' .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true
		}
	end

	local function vscode_like_collapse()
		local node = api.tree.get_node_under_cursor()
		if node.type == 'directory' and node.open then
			api.node.navigate.parent_close()
		else
			api.node.navigate.parent()
		end
	end
	vim.keymap.set('n', 'h', vscode_like_collapse, opts('Collapse'))
	vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
	vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
	vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
	vim.keymap.set('n', 'm', api.fs.cut, opts('Cut (Move)'))
	vim.keymap.set('n', 'c', api.fs.create, opts('Create file/folder'))
	vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
	vim.keymap.set('n', 'gd', api.tree.change_root_to_node, opts('CD'))
	vim.keymap.set('n', 'gh', function() api.tree.change_root('~/') end,
		opts('CD to ~/'))
	vim.keymap.set('n', 'gu', function()
			local parent_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":h")
			api.tree.change_root(parent_dir)
		end,
		opts('CD to ../'))
	vim.keymap.set('n', '<leader>e', api.tree.close, opts('Close'))
end
require('nvim-tree').setup {
	on_attach = my_on_attach,
	sync_root_with_cwd = true,
	actions = {
		change_dir = { enable = true, global = true, restrict_above_cwd = false }
	}
}


-- Telescope
require('telescope').setup { extensions = { project = { sync_with_nvim_tree = true } } }


-- GUI settings
vim.o.guifont = 'FiraCode Nerd Font:h11'


-- Bindings for launching various things
vim.keymap.set('n', '<leader>e', '<CMD>NvimTreeFocus<CR>')


-- Git bindings
vim.keymap.set('n', '<leader>gs', '<CMD>Git<CR>')


-- Telescope bindings
vim.keymap.set('n', '<leader>fg', '<CMD>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>ff', '<CMD>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fp', require('telescope').extensions.project.project)
