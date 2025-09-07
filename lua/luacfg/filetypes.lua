vim.filetype.add {
    extension = {
        cly = 'clyde',
        lalrpop = 'lalrpop',
        c3 = 'c3',
        gn = 'gn',
        gni = 'gn',
        tq = 'torque',
        jsi = 'jsi'
    }
}

vim.treesitter.language.register('clyde', 'clyde')
vim.treesitter.language.register('c', 'c3')
vim.treesitter.language.register('gn', 'gn')
vim.treesitter.language.register('torque', 'torque')
vim.treesitter.language.register('jsi', 'jsi')

