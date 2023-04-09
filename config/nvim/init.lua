-- FIXME: Can't move <space><w><l> move right in split

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

-- Options
vim.g.mapleader = " "
vim.g.maplocalleader = " ,"

local options = {
    number = true,
    relativenumber = true,
    numberwidth = 3,
    ruler = true,
    smartcase = true,
    autoindent = true,
    expandtab = true,
    termguicolors = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    smartindent = true,
}

-- FIXME: some options like smartcase are not working
-- NOTE: nui got cleaned for some reason
for k, v in pairs(options) do
    vim.opt[k] = v
end

require("lazy").setup({
    {
        "projekt0n/github-nvim-theme",
        -- "folke/tokyonight.nvim",
        branch = "0.0.x",
        priority = 1000,
        config = function()
            require("github-theme").setup({
                theme_style = "light_colorblind",
                -- transparent = true,
                -- theme_style = "dark_colorblind",
            })
        end,
    },
    {
        'marko-cerovac/material.nvim',
        config = function()
            vim.g.material_style = "deep ocean"
            -- vim.cmd 'colorscheme material'
        end
    },
    {
        "github/copilot.vim",
    },
    {
        -- FIXME: Completions don't work for references
        -- TODO: some sort of snippet system
        "lervag/vimtex",
        ft = { "tex", "bib" },
        config = function()
            vim.g.vimtex_view_method = "zathura"
        end,
    },
    {
        "goolord/alpha-nvim",
        config = function()
            local alpha = require("alpha")
            local theme = require("alpha.themes.startify")
            theme.section.header.val = {
                " ██░ ██ ▓█████  ██▓     ██▓     ▒█████      ██░ ██  █    ██  ███▄    █ ▄▄▄█████▓▓█████  ██▀███   ",
                "▓██░ ██▒▓█   ▀ ▓██▒    ▓██▒    ▒██▒  ██▒   ▓██░ ██▒ ██  ▓██▒ ██ ▀█   █ ▓  ██▒ ▓▒▓█   ▀ ▓██ ▒ ██▒ ",
                "▒██▀▀██░▒███   ▒██░    ▒██░    ▒██░  ██▒   ▒██▀▀██░▓██  ▒██░▓██  ▀█ ██▒▒ ▓██░ ▒░▒███   ▓██ ░▄█ ▒ ",
                "░▓█ ░██ ▒▓█  ▄ ▒██░    ▒██░    ▒██   ██░   ░▓█ ░██ ▓▓█  ░██░▓██▒  ▐▌██▒░ ▓██▓ ░ ▒▓█  ▄ ▒██▀▀█▄   ",
                "░▓█▒░██▓░▒████▒░██████▒░██████▒░ ████▓▒░   ░▓█▒░██▓▒▒█████▓ ▒██░   ▓██░  ▒██▒ ░ ░▒████▒░██▓ ▒██▒ ",
                " ▒ ░░▒░▒░░ ▒░ ░░ ▒░▓  ░░ ▒░▓  ░░ ▒░▒░▒░     ▒ ░░▒░▒░▒▓▒ ▒ ▒ ░ ▒░   ▒ ▒   ▒ ░░   ░░ ▒░ ░░ ▒▓ ░▒▓░ ",
                " ▒ ░▒░ ░ ░ ░  ░░ ░ ▒  ░░ ░ ▒  ░  ░ ▒ ▒░     ▒ ░▒░ ░░░▒░ ░ ░ ░ ░░   ░ ▒░    ░     ░ ░  ░  ░▒ ░ ▒░ ",
                " ░  ░░ ░   ░     ░ ░     ░ ░   ░ ░ ░ ▒      ░  ░░ ░ ░░░ ░ ░    ░   ░ ░   ░         ░     ░░   ░  ",
                " ░  ░  ░   ░  ░    ░  ░    ░  ░    ░ ░      ░  ░  ░   ░              ░             ░  ░   ░      ",
                "                                                                                                 ",
            }
            theme.section.header.opts.position = "center"
            theme.section.header.opts.hl = "Error"
            alpha.setup(theme.opts)
        end,
    },
    {
        --FIXME: need to install
        -- https://github.com/s1n7ax/nvim-window-picker
        -- before I can move windows out of tree with it open
        -- which is so wack why do they break things
        --
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        -- Worse, this has weird keybindings that I don't want to learn
        -- "nvim-tree/nvim-tree.lua",
        -- dependencies = {
        -- 	"nvim-tree/nvim-web-devicons",
        -- },
        -- config = function()
        -- 	require("nvim-tree").setup()
        -- end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    component_separators = "|",
                    section_separators = "",
                    disabled_filetypes = { "NeoTree" },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                },
            })
        end,
    },
    {
        "akinsho/nvim-bufferline.lua",
        config = function()
            require("bufferline").setup()
        end,
    },
    {
        "folke/which-key.nvim",
        config = function()
            -- TODO: get vim lsp for lua
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            local wk = require("which-key")
            wk.register({
                f = {
                    name = "file",
                    f = { "<cmd>Telescope find_files<cr>", "Find files" },
                    b = { "<cmd>Telescope buffers<cr>", "Find buffers" },
                    h = { "<cmd>Telescope oldfiles<cr>", "Find history" },
                    g = { "<cmd>Telescope live_grep<cr>", "Find by grep" },
                    e = { "<cmd>Telescope file_browser<cr>", "File explorer" },
                    m = { "<cmd>Telescope man_pages sections=ALL<cr>", "Manual Pages" },
                    p = { "<cmd>Telescope project<cr>", "Find projects" },
                },
                -- BUG: for some reason this particular prefix does not pick up leader
                -- a = {
                -- 	name = "AI",
                -- 	p = { "<cmd>Copilot panel<cr>", "Open copilot panel" },
                -- 	d = { "<cmd>Copilot disable<cr><cmd>lua print('Copilot disabled')<cr>", "Disable copilot" },
                -- 	e = { "<cmd>Copilot enable<cr><cmd>lua print('Copilot enabled')<cr>", "Enable copilot" },
                -- 	s = { "<cmd>Copilot status<cr>", "Copilot status" },
                -- },
                c = {
                    name = "code",
                    w = { "<cmd>:w !wc -w<cr>", "Word Count" },
                    d = { "<cmd>ToggleDiag<cr>", "Toggle Diagnostics" },
                },
                w = {
                    name = "window",
                    h = { "<C-w>h", "Go to left window" },
                    j = { "<C-w>j", "Go to down window" },
                    k = { "<C-w>k", "Go to up window" },
                    l = { "<C-w>l", "Go to right window" },
                    H = { "<C-w>H", "Move window left" },
                    J = { "<C-w>J", "Move window down" },
                    K = { "<C-w>K", "Move window up" },
                    L = { "<C-w>L", "Move window right" },
                    s = { "<C-w>s", "Split window horizontally" },
                    v = { "<C-w>v", "Split window vertically" },
                    x = { "<C-w>x", "Swap current window with next" },
                    q = { "<C-w>q", "Quit current window" },
                    w = { "<C-w>w", "Switch windows" },
                },
                b = {
                    name = "buffer",
                    h = { "<cmd>BufferLineCyclePrev<cr>", "cycle view buffer left" },
                    l = { "<cmd>BufferLineCycleNext<cr>", "cycle view buffer right" },
                    b = { "<cmd>BufferLinePick<cr>", "Pick buffer to go" },
                    d = { "<cmd>Bdelete<cr>", "Close current buffer" },
                    x = { "<cmd>BufferLinePickClose<cr>", "Pick buffer to close" },
                },
                o = {
                    name = "open",
                    t = { "<cmd>Neotree toggle<cr>", "Toggle File Tree" },
                    -- FIXME: this doesn't work if the tree is open
                    -- t = { "<cmd>NvimTreeToggle<cr>", "Toggle File Tree" },
                },
                { prefix = "<leader>" },
            })
            wk.setup({})
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("todo-comments").setup()
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        requires = { "nvim-treesitter/nvim-treesitter-textobjects" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "cpp",
                    "css",
                    "go",
                    "json",
                    "julia",
                    "lua",
                    "latex",
                    "llvm",
                    "haskell",
                    "html",
                    "markdown",
                    "cmake",
                    "make",
                    "python",
                    "norg",
                    "nix",
                    "rust",
                    "sql",
                    "toml",
                    "yaml",
                    "vim",
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },
    {
        "moll/vim-bbye",
    },
    {
        "RRethy/vim-illuminate",
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Setup language servers.
            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup({})
            lspconfig.lua_ls.setup({})
            lspconfig.texlab.setup({})
            lspconfig.julials.setup({})

            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
            vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<space>cf", function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)
                end,
            })
        end,
    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end,
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    function()
                        return null_ls.builtins.formatting.prettier.with({
                            extra_args = function()
                                return { "--prose-wrap", "always", "--print-width", "80" }
                            end,
                        })
                    end,

                    -- lua
                    -- TODO: get it so vim stuff doesn't flag
                    null_ls.builtins.formatting.stylua,

                    -- TODO: check if shell features are maxed out
                    -- null_ls.builtins.code_action.shellcheck,
                    null_ls.builtins.diagnostics.shellcheck,
                    null_ls.builtins.formatting.shellharden,
                    null_ls.builtins.formatting.shfmt,

                    -- python
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.diagnostics.mypy,

                    -- non-code
                    null_ls.builtins.formatting.fixjson,
                    -- null_ls.builtins.diagnostics.yamllint,
                },
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            require("luasnip/loaders/from_vscode").lazy_load()
            local check_backspace = function()
                local col = vim.fn.col(".") - 1
                return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
            end
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                    ["<C-e>"] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                    -- Accept currently selected item. If none selected, `select` first item.
                    -- Set `select` to `false` to only confirm explicitly selected items.
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expandable() then
                            luasnip.expand()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif check_backspace() then
                            fallback()
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                },
                sources = {
                    -- FIXME: these don't seem right as they aren't helpful
                    -- should have friendlysnips
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "luasnip" },
                },
            })
            -- FIXME: search completion no longer works
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    {
                        name = "buffer",
                        name = "cmp-cmdline",
                    },
                },
            })
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })
        end,
    },

    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("trouble").setup({})
        end,
    },
    {
        "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
        config = function()
            require("toggle_lsp_diagnostics").init()
        end,
    },
    {
        "p00f/clangd_extensions.nvim",
        config = function()
            require("clangd_extensions").setup()
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-project.nvim",
        },
        config = function()
            require("telescope").setup({})
            -- require("telescope").load_extension("fzf")
            require("telescope").load_extension("file_browser")
            require("telescope").load_extension("project")
        end,
    },

    {
        "tpope/vim-fugitive",
    },
    {
        -- FIXME: folds don't work unless *.norg opened directly
        -- FIXME: folds don't work unless file is reloaded directly
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.norg.concealer"] = {},
                    -- ["core.export.markdown"] = {},
                    -- ["core.integrations.telescope"] = {}
                },
            })
        end,
    },
})

-- infuriating fix for clang
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end
    notify(msg, ...)
end

vim.cmd("source $XDG_CONFIG_HOME/nvim/copilot.vim")
-- NOTE: only needed for wayland
-- vim.cmd("source $XDG_CONFIG_HOME/nvim/clipboard.vim")
