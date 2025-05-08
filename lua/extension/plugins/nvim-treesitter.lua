return {
    'nvim-treesitter/nvim-treesitter',
    cmd = {  'TSInstallInfo', 'TSInstall', 'TSUpdate' },
    event = 'VeryLazy',
    build = ':TSUpdate',
    opts = {
        ensure_installed = {
            'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline'
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true -- 去除重复高亮
        },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<cr>',
                node_incremental = '<cr>',
                scope_incremental = '<tab>',
                node_decremental = '<bs>'
            }
        }
    },
    config = function (_, opts)
        require('nvim-treesitter.install').prefer_git = false
        require('nvim-treesitter.configs').setup(opts)
        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldlevel = 100
    end
}
