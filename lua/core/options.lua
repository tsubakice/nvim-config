-- 开启行号和相对行号
vim.opt.number = true
vim.opt.relativenumber = true

-- 关闭当前模式显示
vim.opt.showmode = false

-- 更好的处理 <tab> 和 <space>
vim.opt.tabstop = 4 -- 配置 <tab> 的显示长度为 4 个 <space>
vim.opt.softtabstop = 4 -- 配置 <tab> 的行为, 按下 <tab> 将插入 <tab> 和 <space> 的混合体
vim.opt.shiftwidth = 4 -- 配置一次自动缩进所使用的 <space> 的个数
vim.opt.expandtab = true -- 将 <tab> 展开为 <space>

-- 获取更好的缩进体验
vim.opt.autoindent = true -- 开辟新行时使用上一行的缩进方式
vim.opt.smartindent = true -- 处理类 C 编程语言的缩进, 一般也能满足其它编程语言的基本缩进要求
vim.opt.smarttab = true -- 行前的 <tab> 将会根据 shiftwidth 插入空白
vim.opt.shiftround = true -- 将缩进舍入为 shiftwidth 的倍数

-- 文本过长时是否自动折行
vim.opt.wrap = false

-- 高亮当前光标行
vim.opt.cursorline = true

-- hjkl 移动时光标周围保留 2 行/列
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2

-- 允许在块选择中选择文本不存在的区域
vim.opt.virtualedit = 'block'

-- 切割窗口时, 新窗口默认出现在右/下
vim.opt.splitright = true
vim.opt.splitbelow = true

-- 获取更好的搜索体验
vim.opt.hlsearch = true -- 高亮搜索结果
vim.opt.incsearch = true -- 输入时搜索
vim.opt.ignorecase = true -- 搜索时忽略字母大小写
vim.opt.smartcase = true -- 搜索大写字母时, 忽略小写字母

-- 配置光标闪烁
vim.opt.guicursor = {
    'n-v-c-t:block-blinkwait0-blinkon500-blinkoff500',
    'i-ci-ve:ver25-blinkwait0-blinkon500-blinkoff500'
}

-- 开启终端真颜色
vim.opt.termguicolors = true

-- 显示侧列
vim.opt.signcolumn = 'yes'

-- 设置最大编辑列数提示线
vim.opt.colorcolumn = '80'

-- 配置字符编码
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- 显示不可见字符
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- 设置快捷键等待时间, 以 ms 为单位
vim.opt.timeoutlen = 250

-- 启用鼠标
vim.opt.mouse:append('a')

-- 联通系统剪贴板
vim.opt.clipboard:append('unnamedplus')

-- 禁止创建备份/交换文件
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- 保存文件编辑信息, 并设定其存储路径
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.local/share/nvim/undo')

-- 允许 neovim 根据不同的环境额外使用不同的配置文件
-- 配置文件名: .nvim.lua, .nvimrc, .exrc
vim.opt.exrc = true

-- 关闭 neovim 自带的文件树
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 关闭某些程序对 neovim 模块的检测警告
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
