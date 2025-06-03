return {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    cond = function ()
        return vim.fs.find('.git', {
            upward = true,
            path = vim.api.nvim_buf_get_name(0)
        })[1] ~= nil
    end,
    opts = {
        on_attach = function () end
    }
}
