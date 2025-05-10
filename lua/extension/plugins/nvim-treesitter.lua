return {
    'nvim-treesitter/nvim-treesitter',
    cmd = { 'TSInstallInfo', 'TSInstall', 'TSUpdate' },
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

        -- 配置 parser 下载镜像
        local parsers = require('nvim-treesitter.parsers')
        for _, config in pairs(parsers.get_parser_configs()) do
            config.install_info.url = 'https://github.moeyy.xyz/' .. config.install_info.url
        end

        -- 修改并应用配置
        local install_config = require('nvim-treesitter.install')
        install_config.prefer_git = true
        install_config.compilers = { 'cc', 'gcc' }
        require('nvim-treesitter.configs').setup(opts)

        -- 配置代码折叠
        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldlevel = 100
    end
}
