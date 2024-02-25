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
			python = require('iron.fts.python').ipython,
			rmd = {
				command = { "R" },
			},
			sh = {
				command = { "zsh" },
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
require("dracula").setup {}
vim.cmd.colorscheme 'dracula'

-- Lualine
require('lualine').setup {
	options = {
		theme = "dracula",
		icons_enabled = true,
	}
}

-- Setup language servers.
local lspconfig = require('lspconfig')
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		vim.bo[ev.buf].formatexpr = nil
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		local function opts(desc)
			return {
				buffer = ev.buf,
				desc = desc
			}
		end
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts('Go to declaration'))
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts('Go to definition'))
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts('Hover'))
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts('Go to implementation'))
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts('Signature Help'))
		vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts('Add workspace folder'))
		vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts('Remove workspace folder'))
		vim.keymap.set('n', '<leader>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts('List workspace folders'))
		vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts('To to type definition'))
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts('Rename'))
		vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts('Code action'))
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts('Go to references'))
		vim.keymap.set('n', '<leader>f', function()
			vim.lsp.buf.format { async = true }
		end, opts('Format'))
	end,
})
local servers = {
	'pylsp', 'texlab', 'r_language_server', 'lua_ls'
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snipperSupport = true
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup { capabilities = capabilities }
end
lspconfig.nil_ls.setup {
	capabilities = capabilities,
	settings = {
		['nil'] = {
			formatting = {
				command = { "nixpkgs-fmt" },
			},
		},
	},
}
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.py %!isort -]]

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
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
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
	local function natural_collapse()
		local node = api.tree.get_node_under_cursor()
		if node.type == 'directory' and node.open then
			api.node.navigate.parent_close()
		else
			api.node.navigate.parent()
		end
	end
	vim.keymap.set('n', 'h', natural_collapse, opts('Collapse'))
	vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
	vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
	vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
	vim.keymap.set('n', 'm', api.fs.cut, opts('Cut (Move)'))
	vim.keymap.set('n', 'c', api.fs.create, opts('Create file/folder'))
	vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
	vim.keymap.set('n', 'gd', api.tree.change_root_to_node, opts('Go to directory'))
	vim.keymap.set('n', 'gh', function() api.tree.change_root('~/') end,
		opts('Go to home-directory'))
	vim.keymap.set('n', 'gu', function()
			local parent_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":h")
			api.tree.change_root(parent_dir)
		end,
		opts('Go one directory up'))
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
require('telescope').setup {}

-- Bindings for launching various things
vim.keymap.set('n', '<leader>e', '<CMD>NvimTreeFocus<CR>')

-- Telescope bindings
vim.keymap.set('n', '<leader>fg', '<CMD>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>ff', '<CMD>Telescope find_files<CR>')
