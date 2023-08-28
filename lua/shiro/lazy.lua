-- This file can be loaded by calling `lua require("plugins")` from your init.vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

return require("lazy").setup({
    {
        "folke/which-key.nvim",
        config = function()
          require("user.config.whichkey").setup()
        end,
    },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    ({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end,
    }),

    ({
        'folke/trouble.nvim',
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end,
    }),

    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            local ts_update = require(
                'nvim-treesitter.install'
            )
            .update({ with_sync = true })

            ts_update()
        end,
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    },

    {
        'MixeroTN/presence.nvim',
        config = function()
            require("presence").setup({
                -- General options
                auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
                neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
                main_image          = "file",                     -- Main image display (either "neovim" or "file")
                client_id2          = "383226320970055681",       -- https://github.com/iCrawl/discord-vscode/blob/master/src/constants.ts
                client_id           = "793271441293967371",       -- [Original] Use your own Discord application client id (not recommended)
                log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
                debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
                enable_line_number  = false,                      -- Displays the current line number instead of the current project
                blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
                buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
                file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
                show_time           = true,                       -- Show the timer

                -- Rich Presence text options
                editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
                file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
                git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
                plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
                reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
                workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
                line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
            })
        end,
    },

    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-context",
    "theprimeagen/harpoon",
    "theprimeagen/refactoring.nvim",
    "mbbill/undotree",
    "tpope/vim-fugitive",

    "folke/zen-mode.nvim",
    "eandrju/cellular-automaton.nvim",
    "laytan/cloak.nvim",
})
