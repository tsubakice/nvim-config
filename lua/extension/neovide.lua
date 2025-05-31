-- neovide 相关配置
if vim.g.neovide then

    -- 字体及行号
    vim.o.guifont = 'CodeNewRoman Nerd Font:h12'

    -- 透明度
    vim.g.neovide_opacity = 1

    -- 窗口拆分的动画时长
    vim.g.neovide_position_animation_length = 0.2

    -- 键入时隐藏鼠标
    vim.g.neovide_hide_mouse_when_typing = true

    -- 设置主题
    vim.g.neovide_theme = 'dark'

    -- 全屏显示
    vim.g.neovide_fullscreen = true

    -- 启用光标闪烁
    vim.g.neovide_cursor_smooth_blink = true

    -- 粒子特效
    vim.g.neovide_cursor_vfx_mode = 'pixiedust'
end
