return {
    'folke/tokyonight.nvim',
    opts = {
        style = 'night',
        styles = {
            comments = { italic = false, underline = true },
            keywords = { italic = false }
        },
        on_colors = function (colors)
            colors.bg_visual = '#275378'
        end
    },
    config = function (_, opts)
        require('tokyonight').setup(opts)
        vim.cmd([[colorscheme tokyonight]])
        vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#80a0ff' })
        vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#292e42' })
    end
}
