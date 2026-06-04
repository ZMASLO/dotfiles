-- ── Opcje podstawowe ─────────────────────────────────────────────────────────
vim.opt.number         = true       -- numery linii
vim.opt.relativenumber = false
vim.opt.cursorline     = true       -- podświetl aktywną linię
vim.opt.termguicolors  = true       -- pełna paleta kolorów
vim.opt.signcolumn     = "yes"      -- kolumna ikon po lewej (diagnostyka, git)
vim.opt.scrolloff      = 8          -- zawsze 8 linii nad/pod kursorem

vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.smartindent    = true

vim.opt.wrap           = false
vim.opt.ignorecase     = true
vim.opt.smartcase      = true

vim.opt.splitright     = true
vim.opt.splitbelow     = true

vim.opt.updatetime     = 250
vim.opt.timeoutlen     = 400

vim.g.mapleader        = " "        -- leader = spacja

-- ── Skróty ───────────────────────────────────────────────────────────────────
local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

map("n", "<leader>w", "<cmd>w<cr>",  "Zapisz")
map("n", "<leader>q", "<cmd>q<cr>",  "Zamknij")
map("n", "<Esc>",     "<cmd>nohlsearch<cr>", "Wyczyść podświetlenie")

-- przemieszczanie po liniach wizualnych (przy zawijaniu)
map("n", "j", "gj")
map("n", "k", "gk")

-- motyw ładujemy przed lazy żeby nie było flashowania
vim.cmd("colorscheme edgerunner")

-- ── Bootstrap lazy.nvim ──────────────────────────────────────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ── Pluginy ──────────────────────────────────────────────────────────────────
require("lazy").setup({

  -- pasek statusu
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = {
            normal = {
              a = { fg = "#0d0e1a", bg = "#ff4d9e", gui = "bold" },
              b = { fg = "#e4e4f4", bg = "#2d2e4d" },
              c = { fg = "#a8a9c8", bg = "#1a1b2e" },
            },
            insert = {
              a = { fg = "#0d0e1a", bg = "#7dffaf", gui = "bold" },
            },
            visual = {
              a = { fg = "#0d0e1a", bg = "#b4a7e8", gui = "bold" },
            },
            replace = {
              a = { fg = "#0d0e1a", bg = "#ffd06b", gui = "bold" },
            },
            command = {
              a = { fg = "#0d0e1a", bg = "#8de8ff", gui = "bold" },
            },
            inactive = {
              a = { fg = "#6b6c8a", bg = "#0d0e1a" },
              b = { fg = "#6b6c8a", bg = "#0d0e1a" },
              c = { fg = "#6b6c8a", bg = "#0d0e1a" },
            },
          },
          component_separators = { left = "│", right = "│" },
          section_separators   = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- lepsze kolorowanie składni
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua", "python", "javascript", "typescript",
        "bash", "json", "yaml", "toml", "markdown",
        "c", "cpp", "rust", "go",
      },
      highlight    = { enable = true },
      indent       = { enable = true },
      auto_install = true,
    },
  },

  -- podświetlenie nawiasów
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup({})
    end,
  },

  -- wygładzanie wcięć (pionowe linie)
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent  = { char = "▏" },
        scope   = { enabled = true },
      })
    end,
  },

  -- automatyczne zamykanie nawiasów/cudzysłowów
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- komentowanie (gcc = komentuj linię, gc + ruch w trybie wizualnym)
  {
    "numToStr/Comment.nvim",
    config = true,
  },

  -- podgląd hex kolorów w kodzie (#ffffff, rgb(...))
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, { mode = "background" })
    end,
  },

}, {
  -- opcje lazy.nvim
  ui = { border = "rounded" },
  checker = { enabled = false },
})
