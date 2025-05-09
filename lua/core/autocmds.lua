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

-- 创建高级 lsp 进度
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd('LspProgress', {
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        local value = event.data.params.value
        if not client or type(value) ~= 'table' then
            return
        end
        local p = progress[client.id]

        for i = 1, #p + 1 do
            if i == #p + 1 or p[i].token == event.data.params.token then
                p[i] = {
                    token = event.data.params.token,
                    msg = ('[%3d%%] %s%s'):format(
                        value.kind == 'end' and 100 or value.percentage or 100,
                        value.title or '',
                        value.message and (' **%s**'):format(value.message) or ''
                    ),
                    done = value.kind == 'end',
                }
                break
            end
        end

        local msg = {}
        progress[client.id] = vim.tbl_filter(function(v)
            return table.insert(msg, v.msg) or not v.done
        end, p)

        local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
        vim.notify(table.concat(msg, '\n'), vim.log.levels.INFO, {
            id = 'lsp_progress',
            title = client.name,
            opts = function(notif)
                notif.icon = #progress[client.id] == 0 and ' '
                or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            end,
        })
    end,
})
