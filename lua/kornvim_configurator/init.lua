-- lua/kornvim_configurator/init.lua
-- personal vim setting collection
local options = vim.opt
local options_local = vim.opt_local
local globals = vim.g
local M = {}

local function setBackupFolder()
  options.backupdir = '~/.config/nvim/backup'
end

local function setBaseCompletitionOptions()
  options.wildmode = 'longest,list'
  options.completeopt = 'menuone,noinsert,noselect'
end

local function setTheme()
  options.guifont = 'Fira Code Font:h14,Symbols Nerd Font'
  options.cmdheight = 3
  options.number = true
end

local function setEditorBehaviour()
  options.syntax = 'on'
  options.mouse = 'a'
  options.matchpairs = options.matchpairs .. ",<:>"
  options.splitright = true
  options.hlsearch = true
  options.incsearch = true

  -- shorten the messages in the message bar
  options.shortmess = options.shortmess .. 'c'
end

local function setGlobals()
  globals.mapleader = ","
  globals.loaded_python_provider = '0'
  globals.goyo_width = '80'
  _G.Original_folder = vim.loop.cwd()
end

local function setSpell()
  -- create the folder site/spell in the vim data folder
  vim.fn.mkdir(vim.fn.stdpath("data") .. "site/spell", "p")
  options.spelllang = { "en_us", "it" }
  options.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'
  options.spell = true
end

function M.setTab(tab)
  options.tabstop = tab
  options.shiftwidth = tab
  options.softtabstop = tab
  options.expandtab = true
end

function M.editorBaseConfiguration(columns, wrap_flag)
  wrap_flag = wrap_flag | false
  options_local.wrap = wrap_flag
  options.cc = columns
  options.virtualedit = 'all'
  options.autoindent = true
  options.encoding = "utf-8"
end

local function setClipboard()
  options.clipboard = options.clipboard .. 'unnamed,unnamedplus'
end

local function termOptions()
  options.termguicolors = true
  options.ttyfast = true
  options.termguicolors = true
end

function M.setup()
  setGlobals()
  setBackupFolder()
  M.editorBaseConfiguration('80')
  termOptions()
  M.setTab(2)
  setClipboard()
  setSpell()
  setBaseCompletitionOptions()
  setEditorBehaviour()
  setTheme()
end

return M
