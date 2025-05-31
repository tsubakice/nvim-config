return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    build = ':TSUpdate',
    lazy = false,
    opts = {
        ensure_installed = {
            'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline'
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true -- 去除重复高亮
        },
        indent = { enable = true }
    },
    config = function (_, opts)

        -- 配置 parser 下载镜像
        local parsers = require('nvim-treesitter.parsers')
        for _, config in pairs(parsers.get_parser_configs()) do
            config.install_info.url = 'https://github.moeyy.xyz/' .. config.install_info.url
        end

        -- 修改并应用配置
        require('nvim-treesitter.install').compilers = { 'cc', 'gcc' }
        require('nvim-treesitter.configs').setup(opts)

        -- 配置代码折叠(zc 折叠, zo 打开)
        vim.wo.foldlevel = 100
        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end
}
