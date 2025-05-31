-- 保存光标所在位置
vim.api.nvim_create_autocmd('BufReadPost', {
    callback = function()
        if vim.fn.line('\'"') > 0 and vim.fn.line('\'"') <= vim.fn.line('$') then
            vim.api.nvim_exec2('silent! normal! g`"zv', { output = false })
        end
    end,
})

-- 根据特定文件类型设置缩进
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'vue', 'typescript', 'javascript', 'html', 'css', 'json', 'xml', 'yaml' },
    callback = function ()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})

-- 高亮显示复制的区域
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function ()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
    end
})

-- 进入 Insert 模式后自动开启当前 buffer 的 paste 模式
-- 防止粘贴代码时误触发自动缩进、自动补全等功能时导致格式错乱
vim.api.nvim_create_autocmd('InsertEnter', {
    callback = function ()
        vim.opt_local.paste = false
    end
})

-- 离开 Insert 模式后自动关闭当前 buffer 的 paste 模式, 防止后续输入异常
vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function ()
        vim.opt_local.paste = false
    end
})

-- 根据特定文件类型决定是否展开 tab
vim.api.nvim_create_autocmd('FileType', {
    callback = function ()
        if vim.bo.filetype == 'make' then
            vim.opt_local.expandtab = false
        end
    end
})
