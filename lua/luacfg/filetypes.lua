vim.filetype.add {
    extension = {
        cly = 'clyde',
        lalrpop = 'lalrpop',
        c3 = 'c3',
        gn = 'gn',
        gni = 'gn'
    }
}

vim.treesitter.language.register('clyde', 'clyde')
vim.treesitter.language.register('c', 'c3')
vim.treesitter.language.register('gn', 'gn')

