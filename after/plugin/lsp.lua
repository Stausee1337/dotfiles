local lsp = vim.lsp;



require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'lua_ls', 'rust_analyzer'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})

-- lsp.preset("recommended")

-- lsp.ensure_installed({
-- 	'rust_analyzer',
-- })
-- 
-- Fix Undefined global 'vim'
-- lsp.nvim_workspace()
--

local map = function(m, lhs, rhs, desc)
    local key_opts = {desc = desc, nowait = true}
    vim.keymap.set(m, lhs, rhs, key_opts)
end

map('n', 'K', '<cmd>lua vim.lsp.buf.hover({border = vim.g.lsp_zero_border_style})<cr>', 'Hover documentation')
map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help({border = vim.g.lsp_zero_border_style})<cr>', 'Show function signature')

map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go to definition')
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go to declaration')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Go to implementation')
map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Go to type definition')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', 'Go to reference')
map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename symbol')
map('n', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', 'Format file')
map('x', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', 'Format selection')
map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Execute code action')


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = cmp.mapping.preset.insert({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-z>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

cmp.setup({
    mapping = cmp_mappings,
    sources = {
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    },
    formatting = {
        fields = {'abbr', 'menu', 'kind'},
        format = function(entry, item)
            local n = entry.source.name
            if n == 'nvim_lsp' then
                item.menu = '[LSP]'
            elseif n == 'nvim_lua'  then
                item.menu = '[nvim]'
            else
                item.menu = string.format('[%s]', n)
            end
            return item
        end,
    }
})

-- lsp.set_preferences({
-- 	suggest_lsp_servers = false, sign_icons = {
-- 		error = 'E',
-- 		warn = 'W',
-- 		hint = 'H',
-- 		info = 'I'
-- 	}
-- })
--
local function highlight_diagnostic(fn)
    local diagnostic = fn()
    if diagnostic then
        vim.api.nvim_win_set_cursor(0, { diagnostic.lnum + 1, diagnostic.col })
        vim.defer_fn(function ()
            vim.diagnostic.open_float({ border = 'rounded' })
        end, 0)
    end
end

vim.diagnostic.config({
    virtual_text = true,
    on_attach = function (client, bufnr)
        local opts = {buffer = bufnr, remap = false};

        vim.keymap.set("n", "<leader>vws", function () vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "]d", function () highlight_diagnostic(vim.diagnostic.get_next) end, opts)
        vim.keymap.set("n", "[d", function () highlight_diagnostic(vim.diagnostic.get_prev) end, opts)

        vim.keymap.set("n", "<leader>vca", function () vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function () vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function () vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function () vim.lsp.buf.signature_help() end, opts)
    end
})


