return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    lazy = false,
    config = function ()

        -- Unix 平台要求 cc 作为 c 编译器
        -- Windows 平台要求 cl.exe 作为 c 编译器

        -- 代码解析器
        local parsers = {
            'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline'
        }

        -- 安装代码解析器(最多等待 5 分钟)
        require('nvim-treesitter').install(parsers):wait(300000)

        -- 配置代码高亮
        vim.api.nvim_create_autocmd('FileType', {
            pattern = parsers,
            callback = function()
                vim.treesitter.start()
            end
        })

        -- 配置代码缩进(使用=缩进)
        vim.bo.indentexpr = 'v:lua.require\'nvim-treesitter\'.indentexpr()'

        -- 配置代码折叠(zc 折叠, zo 打开)
        vim.wo.foldlevel = 100
        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end
}
