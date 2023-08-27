require("shiro.set")
require("shiro.remap")

local augroup = vim.api.nvim_create_augroup
local ShiroGroup = augroup("Shiro", {})

local autocmd = vim.api.nvim_create_augroup
local yank_group = augroup("HighlightYank", {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = ShiroGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
