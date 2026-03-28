-- Leader key
vim.g.mapleader = " "

-- ======================
-- BASIC SETTINGS
-- ======================
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
-- ======================
-- BOOTSTRAP LAZY.NVIM
-- ======================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ======================
-- PLUGINS
-- ======================
require("lazy").setup({

    -- 🌙 Theme
    {
        "morhetz/gruvbox",
        config = function()
            vim.o.background = "dark"
            vim.cmd("colorscheme gruvbox")
        end,
    },

    -- 🌳 Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "cpp", "lua", "python" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },

    -- 🔍 Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- 🌲 File explorer
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup()
        end,
    },

    -- ⚡ LSP
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("clangd", {
                cmd = {
                    "clangd",
                    "--fallback-style={BasedOnStyle: LLVM, BreakBeforeBraces: Attach}",
                },
            })
            vim.lsp.enable("clangd")
        end,
    },

    -- 🤖 Autocomplete
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                mapping = {
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = "nvim_lsp" },
                },
            })
        end,
    },

    -- 🧠 LeetCode
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            lang = "cpp",
            hooks = {
                ["question_enter"] = function()
                    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

                    for _, line in ipairs(lines) do
                        if line:find("ONLINE_JUDGE") then
                            return
                        end
                    end

                    vim.api.nvim_buf_set_lines(0, -1, -1, false, {
                        "",
                        "#ifndef ONLINE_JUDGE",
                        "#include <bits/stdc++.h>",
                        "using namespace std;",
                        "",
                        "int main() {",
                        "    ios::sync_with_stdio(false);",
                        "    cin.tie(NULL);",
                        "",
                        "    Solution sol;",
                        "",
                        "    // 🔥 Write your test here",
                        "",
                        "    return 0;",
                        "}",
                        "#endif",
                    })
                end,
            },
        },
    },

})

-- ======================
-- TERMINAL
-- ======================
vim.keymap.set("n", "<leader>t", function()
    vim.cmd("belowright split")
    vim.cmd("resize 10")
    vim.cmd("terminal")
    vim.cmd("startinsert")
end)

-- ======================
-- RUN C++ CODE
-- ==================
vim.keymap.set("n", "<leader>r", function()
    vim.cmd("w")
    vim.cmd("!clear && /opt/homebrew/bin/g++-15 -std=c++17 % -O2 -o out && ./out")
end)
vim.keymap.set("n", "<leader><CR>", function()
    vim.cmd("w")
    vim.cmd([[!sh -c '/opt/homebrew/bin/g++-15 -std=c++17 % -O2 -o %:r && ./%:r < in.txt > out.txt && cat out.txt']])
end)
-- ======================
-- KEYBINDINGS
-- ======================
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>")

vim.keymap.set("t", "<leader>z", [[<C-\><C-n><C-w>w]])
vim.keymap.set("n", "<leader>z", "<C-w>w")

-- LSP keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "K", vim.lsp.buf.hover)

-- Move lines
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==", { silent = true })

vim.keymap.set("v", "<leader>j", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<leader>k", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>+", "<cmd>vertical resize +5<cr>")
vim.keymap.set("n", "<leader>-", "<cmd>vertical resize -5<cr>")
-- PATH fix (Mac)
vim.env.PATH = "/opt/homebrew/bin:" .. vim.env.PATH
