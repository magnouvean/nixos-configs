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

-- Comment
require('Comment').setup {}

-- Lualine
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'dracula-nvim',
	}
}

-- Theme
require('dracula').setup { transparent_bg = (not vim.g.neovide) }
vim.cmd [[colorscheme dracula-soft]]

-- Setup language servers.
local lspconfig = require('lspconfig')

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		local opts = { buffer = ev.buf }
		vim.keymap.set('n', '<f12>', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gD', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gH', function()
			vim.lsp.buf.hover()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set('n', '<f2>', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<C-.>', vim.lsp.buf.code_action, opts)
	end
})

local servers = {
	'gdscript', 'rust_analyzer', 'pylsp', 'rnix', 'texlab', 'r_language_server', 'lua_ls'
}
local capabilitites = require('cmp_nvim_lsp').default_capabilities()
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup { capabilties = capabilitites }
end

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- R
vim.api.nvim_create_autocmd('filetype R', {
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', '<C-Enter>', "<Plug>RDSendLine", opts)
		vim.keymap.set('n', '<C-c><C-c>', "<Plug>RDSendLine", opts)
		vim.keymap.set('v', '<C-Enter>', "<Plug>REDSendSelection", opts)
		vim.keymap.set('v', '<C-c><C-c>', "<Plug>REDSendSelection", opts)
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
	sources = { { name = 'nvim_lsp' }, { name = 'luasnip' } }
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
	vim.keymap.set('n', 'gu', function() api.tree.change_root('../') end,
		opts('CD to ../'))
	vim.keymap.set('n', 'gw', require('telescope').extensions.project.project, opts('Change workspace'))
	vim.keymap.set('n', '<M-e>', api.tree.close, opts('Close'))
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

-- Autopairing
require('nvim-autopairs').setup {}

-- GUI settings
vim.o.guifont = 'FiraCode Nerd Font:h11'

-- Neovide settings
if vim.g.neovide then vim.g.neovide_transparency = 0.80 end

-- Terminal support
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
	vim.keymap.set('t', '<M-t>', [[<Cmd>ToggleTerm<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
require('toggleterm').setup {}

-- Bindings for launching various things
vim.keymap.set('n', '<M-e>', ':NvimTreeFocus<CR>')
vim.keymap.set('n', '<M-g>', ':Git<CR>')
vim.keymap.set('n', '<M-f>', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<M-t>', ':ToggleTerm<CR>')
