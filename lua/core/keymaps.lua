-- 设置主键
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 合并两个 tab
local kmerge = function (t1, t2)
    return vim.tbl_deep_extend('force', t1, t2)
end

-- 静默命令输出
local opts = { silent = true }

-- 配置插入模式快捷回退到普通模式
vim.keymap.set('i', 'jk', '<esc>', opts)

-- 使用 shift+insert 在 insert 模式下进行粘贴
vim.keymap.set('i', '<c-v>', '<cmd>echo \'请使用 shift+insert 进行粘贴\'<cr>', opts)
vim.keymap.set('i', '<s-insert>', '<esc>"+pa', opts)

-- insert 模式下移动光标
vim.keymap.set('i', '<c-h>', '<left>', opts)
vim.keymap.set('i', '<c-j>', '<down>', opts)
vim.keymap.set('i', '<c-k>', '<up>', opts)
vim.keymap.set('i', '<c-l>', '<right>', opts)

-- 禁用上下左右键
vim.keymap.set('i', '<left>', '<cmd>echo \'请使用 ctrl+h 移动光标\'<cr>', opts)
vim.keymap.set('i', '<down>', '<cmd>echo \'请使用 ctrl+j 移动光标\'<cr>', opts)
vim.keymap.set('i', '<up>', '<cmd>echo \'请使用 ctrl+k 移动光标\'<cr>', opts)
vim.keymap.set('i', '<right>', '<cmd>echo \'请使用 ctrl+l 移动光标\'<cr>', opts)
vim.keymap.set({ 'n', 'v' }, '<left>', '<cmd>echo \'请使用 h 移动光标\'<cr>', opts)
vim.keymap.set({ 'n', 'v' }, '<down>', '<cmd>echo \'请使用 j 移动光标\'<cr>', opts)
vim.keymap.set({ 'n', 'v' }, '<up>', '<cmd>echo \'请使用 k 移动光标\'<cr>', opts)
vim.keymap.set({ 'n', 'v' }, '<right>', '<cmd>echo \'请使用 l 移动光标\'<cr>', opts)

-- 配置视觉模式下单行或多行移动
vim.keymap.set('v', 'J', ':m \'>+2<cr>gv=gv', opts)
vim.keymap.set('v', 'K', ':m \'<-1<cr>gv=gv', opts)
vim.keymap.set('v', 'H', '<gv', opts)
vim.keymap.set('v', 'L', '>gv', opts)

-- 快捷移动到行头行尾
vim.keymap.set({ 'n', 'v' }, '<', '^', opts)
vim.keymap.set({ 'n', 'v' }, '>', '$', opts)

-- 配置一行内上下移动(不影响行与行之间的移动)
vim.keymap.set('n', 'j', [[v:count ? 'j' : 'gj']], kmerge(opts, { expr = true }))
vim.keymap.set('n', 'k', [[v:count ? 'k' : 'gk']], kmerge(opts, { expr = true }))

-- 在多个窗口间快捷跳转
vim.keymap.set('n', '<c-h>', '<c-w>h', opts)
vim.keymap.set('n', '<c-j>', '<c-w>j', opts)
vim.keymap.set('n', '<c-k>', '<c-w>k', opts)
vim.keymap.set('n', '<c-l>', '<c-w>l', opts)

-- 是否开启自动换行
vim.keymap.set('n', '<a-z>', function ()
    vim.opt_local.wrap = not vim.opt_local.wrap
end, opts)

-- 增加/减少 数字
vim.keymap.set('n', '+', '<c-a>', opts)
vim.keymap.set('n', '-', '<c-x>', opts)

-- 调整 window 大小
vim.keymap.set('n', '<a-k>', '<cmd>resize +2<cr>', opts)
vim.keymap.set('n', '<a-j>', '<cmd>resize -2<cr>', opts)
vim.keymap.set('n', '<a-h>', '<cmd>vertical resize +2<cr>', opts)
vim.keymap.set('n', '<a-l>', '<cmd>vertical resize -2<cr>', opts)

-- window 管理
vim.keymap.set('n', '<leader>wv', '<c-w>v', kmerge(opts, { desc = '垂直切割当前窗口' }))
vim.keymap.set('n', '<leader>wh', '<c-w>s', kmerge(opts, { desc = '水平切割当前窗口' }))
vim.keymap.set('n', '<leader>we', '<c-w>=', kmerge(opts, { desc = '调整窗口大小至相同' }))
vim.keymap.set('n', '<leader>wo', '<c-w>o', kmerge(opts, { desc = '关闭其他窗口' }))
vim.keymap.set('n', '<leader>wd', '<cmd>close<cr>', kmerge(opts, { desc = '关闭当前窗口' }))

-- 快捷取消高亮
vim.keymap.set('n', '<leader>nh', '<cmd>nohlsearch<cr>', kmerge(opts, { desc= '取消搜索高亮' }))
