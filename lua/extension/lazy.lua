-- 快速安装并启动 lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'git@github.com:folke/lazy.nvim.git'
    local out = vim.fn.system({
        'git', 'clone', '--filter=blob:none', '--branch=stable',
        lazyrepo, lazypath
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim 相关配置
require('lazy').setup({
    spec = {{ import = 'extension.plugins' }},
    git = {
        log = { '-8' }, -- 插件仓库最近 8 条提交
        timeout = 180,
        url_format = 'git@github.com:%s.git',
        filter = true
    },
    change_detection = { notify = true },
    install = { missing = true }, -- 自动安装缺失插件
    ui = {
        wrap = true,
        border = 'rounded', -- lazy console 边框样式, 可选值请参阅 nvim_open_win()
        backdrop = 100,
        title = 'lazy console',
        title_pos = 'left'
    }
})

-- 快捷打开 Lazy 控制台
vim.keymap.set('n', '<leader>lc', '<cmd>Lazy<cr>', {
    desc = '打开 Lazy 控制台', silent = true
})
