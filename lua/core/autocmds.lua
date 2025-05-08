-- 根据特定文件类型取消 tab 展开
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'make',
    callback = function ()
        vim.opt_local.expandtab = false
    end
})

-- 根据特定文件类型设置自动折行
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown', 'text' },
    callback = function ()
        vim.opt_local.wrap = true
    end
})

-- 根据特定文件类型设置缩进
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'vue', 'typescript', 'javascript', 'css', 'html', 'json', 'xml', 'yaml' },
    callback = function ()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})

-- 高亮显示复制的区域
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function ()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 100 })
    end
})

-- 离开 Insert 模式后关闭当前 buffer 的 paste 模式
vim.api.nvim_create_autocmd('InsertLeave', {
    pattern = '*',
    callback = function ()
        vim.opt_local.paste = false
    end
})
