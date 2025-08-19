-- lua/kornvim_configurator/init.lua
-- personal vim setting collection
local options = vim.opt
local options_local = vim.opt_local
local legacy_options = vim.o
local globals = vim.g
local M = {}

M.tabSpace = 2
M.wrapFlag = false
M.columns = '80'

local function setBackupFolder()
  options.backupdir = '~/.config/nvim/backup'
end

local function setBaseCompletitionOptions()
  legacy_options.wildmode = 'longest,list'
  legacy_options.completeopt = 'menuone,noinsert,noselect'
end

local function setTheme()
  options.guifont = 'Fira Code Font:h14,Symbols Nerd Font'
  legacy_options.cmdheight = 3
  legacy_options.number = true
end

local function setEditorBehaviour()
  legacy_options.syntax = 'on'
  legacy_options.mouse = 'a'
  options.matchpairs:append("<:>")
  options.splitright = true
  legacy_options.hlsearch = true
  legacy_options.incsearch = true

  -- shorten the messages in the message bar
  legacy_options.shortmess = legacy_options.shortmess .. 'c'
end

local function setGlobals()
  globals.mapleader = ","
  globals.loaded_python_provider = '0'
  globals.goyo_width = M.columns
  _G.Original_folder = vim.loop.cwd()
end

local function setSessionOptions()
  options.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'
end

local function setSpell()
  -- create the folder site/spell in the vim data folder
  vim.fn.mkdir(vim.fn.stdpath("data") .. "site/spell", "p")
  options.spelllang = { "en_us", "it" }
  options.spell = true
end

function M.setTab(tab)
  tab = tab or M.tabSpace
  options.tabstop = tab
  options.shiftwidth = tab
  options.softtabstop = tab
  options.expandtab = true
end

function M.editorBaseConfiguration(columns, wrap_flag)
  wrap_flag = wrap_flag or M.wrapFlag
  columns = columns or M.columns
  options_local.wrap = wrap_flag
  legacy_options.cc = columns
  legacy_options.virtualedit = 'all'
  legacy_options.autoindent = true
  options.encoding = "utf-8"
end

local function setClipboard()
  legacy_options.clipboard = legacy_options.clipboard .. 'unnamed,unnamedplus'
  if vim.fn.has('wsl') == 1 then
    globals.clipboard = {
      name = 'WslClipboard',
      copy = {
        ['+'] = 'clip.exe',
        ['*'] = 'clip.exe',
      },
      paste = {
        ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      },
      cache_enabled = 0,
    }
  end
end

local function termOptions()
  options.termguicolors = true
  legacy_options.ttyfast = true
end

function M.setup()
  setGlobals()
  setBackupFolder()
  setSessionOptions()
  M.editorBaseConfiguration()
  termOptions()
  M.setTab()
  setClipboard()
  setSpell()
  setBaseCompletitionOptions()
  setEditorBehaviour()
  setTheme()
end

return M
