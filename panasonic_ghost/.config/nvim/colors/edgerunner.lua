-- Edgerunner — motyw oparty na palecie Hyprland/foot użytkownika
-- Źródło kolorów: ~/.config/foot/foot.ini
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "edgerunner"
vim.opt.termguicolors = true

local c = {
  bg       = "#0d0e1a",
  bg1      = "#1a1b2e",  -- regular0 (czarny jasny)
  bg2      = "#2d2e4d",  -- bright0
  bg3      = "#3a3b5e",  -- nieco jaśniejszy
  fg       = "#e4e4f4",  -- foreground
  fg_dim   = "#a8a9c8",  -- regular7
  comment  = "#6b6c8a",  -- muted (placeholder z fuzzel)
  pink     = "#ff4d9e",  -- regular1 — główny akcent
  pink_br  = "#ff79b8",  -- bright1
  green    = "#7dffaf",  -- regular2
  green_br = "#9dffc4",  -- bright2
  yellow   = "#ffd06b",  -- regular3
  yellow_br= "#ffe08c",  -- bright3
  blue     = "#88c5e6",  -- regular4
  blue_br  = "#a8d6f0",  -- bright4
  lavender = "#b4a7e8",  -- regular5
  lav_br   = "#cdc1ff",  -- bright5
  cyan     = "#8de8ff",  -- regular6
  cyan_br  = "#b0f0ff",  -- bright6
}

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Podstawowe ────────────────────────────────────────────────────────────────
hi("Normal",       { fg = c.fg,      bg = c.bg })
hi("NormalNC",     { fg = c.fg,      bg = c.bg })
hi("NormalFloat",  { fg = c.fg,      bg = c.bg1 })
hi("FloatBorder",  { fg = c.lavender,bg = c.bg1 })
hi("ColorColumn",  { bg = c.bg1 })
hi("Conceal",      { fg = c.comment })
hi("CursorColumn", { bg = c.bg1 })
hi("CursorLine",   { bg = c.bg1 })
hi("CursorLineNr", { fg = c.pink,    bold = true })
hi("Directory",    { fg = c.blue })
hi("EndOfBuffer",  { fg = c.bg1 })
hi("ErrorMsg",     { fg = c.pink,    bold = true })
hi("FoldColumn",   { fg = c.comment, bg = c.bg })
hi("Folded",       { fg = c.comment, bg = c.bg1 })
hi("LineNr",       { fg = c.comment })
hi("MatchParen",   { fg = c.pink,    bg = c.bg2, bold = true })
hi("ModeMsg",      { fg = c.lavender })
hi("MoreMsg",      { fg = c.green })
hi("NonText",      { fg = c.bg2 })
hi("Pmenu",        { fg = c.fg,      bg = c.bg1 })
hi("PmenuSel",     { fg = c.bg,      bg = c.lavender, bold = true })
hi("PmenuSbar",    { bg = c.bg2 })
hi("PmenuThumb",   { bg = c.lavender })
hi("Question",     { fg = c.green })
hi("QuickFixLine", { bg = c.bg2 })
hi("Search",       { fg = c.bg,      bg = c.pink })
hi("IncSearch",    { fg = c.bg,      bg = c.yellow, bold = true })
hi("CurSearch",    { fg = c.bg,      bg = c.yellow, bold = true })
hi("SignColumn",   { fg = c.comment, bg = c.bg })
hi("SpecialKey",   { fg = c.bg2 })
hi("SpellBad",     { undercurl = true, sp = c.pink })
hi("SpellCap",     { undercurl = true, sp = c.blue })
hi("SpellLocal",   { undercurl = true, sp = c.cyan })
hi("SpellRare",    { undercurl = true, sp = c.lavender })
hi("StatusLine",   { fg = c.fg_dim,  bg = c.bg1 })
hi("StatusLineNC", { fg = c.comment, bg = c.bg1 })
hi("Substitute",   { fg = c.bg,      bg = c.pink })
hi("TabLine",      { fg = c.comment, bg = c.bg1 })
hi("TabLineFill",  { bg = c.bg })
hi("TabLineSel",   { fg = c.fg,      bg = c.bg2, bold = true })
hi("Title",        { fg = c.pink,    bold = true })
hi("VertSplit",    { fg = c.bg2,     bg = c.bg })
hi("WinSeparator", { fg = c.bg2,     bg = c.bg })
hi("Visual",       { bg = c.bg2 })
hi("VisualNOS",    { bg = c.bg2 })
hi("WarningMsg",   { fg = c.yellow })
hi("Whitespace",   { fg = c.bg2 })
hi("WildMenu",     { fg = c.bg,      bg = c.lavender })

-- ── Składnia ──────────────────────────────────────────────────────────────────
hi("Comment",      { fg = c.comment, italic = true })
hi("Constant",     { fg = c.yellow })
hi("String",       { fg = c.green })
hi("Character",    { fg = c.green })
hi("Number",       { fg = c.yellow })
hi("Boolean",      { fg = c.pink, bold = true })
hi("Float",        { fg = c.yellow })
hi("Identifier",   { fg = c.fg })
hi("Function",     { fg = c.blue })
hi("Statement",    { fg = c.pink, bold = true })
hi("Conditional",  { fg = c.pink, bold = true })
hi("Repeat",       { fg = c.pink, bold = true })
hi("Label",        { fg = c.lavender })
hi("Operator",     { fg = c.cyan })
hi("Keyword",      { fg = c.pink, bold = true })
hi("Exception",    { fg = c.pink })
hi("PreProc",      { fg = c.lavender })
hi("Include",      { fg = c.lavender })
hi("Define",       { fg = c.lavender })
hi("Macro",        { fg = c.lavender })
hi("PreCondit",    { fg = c.lavender })
hi("Type",         { fg = c.lav_br })
hi("StorageClass", { fg = c.pink })
hi("Structure",    { fg = c.lav_br })
hi("Typedef",      { fg = c.lav_br })
hi("Special",      { fg = c.cyan })
hi("SpecialChar",  { fg = c.cyan })
hi("Tag",          { fg = c.pink })
hi("Delimiter",    { fg = c.fg_dim })
hi("SpecialComment",{ fg = c.comment, italic = true })
hi("Debug",        { fg = c.pink })
hi("Underlined",   { underline = true })
hi("Error",        { fg = c.pink, bold = true })
hi("Todo",         { fg = c.bg, bg = c.yellow, bold = true })

-- ── Treesitter ────────────────────────────────────────────────────────────────
hi("@variable",              { fg = c.fg })
hi("@variable.builtin",      { fg = c.pink, italic = true })
hi("@variable.parameter",    { fg = c.blue_br })
hi("@variable.member",       { fg = c.blue })
hi("@constant",              { fg = c.yellow })
hi("@constant.builtin",      { fg = c.yellow, bold = true })
hi("@constant.macro",        { fg = c.lavender })
hi("@string",                { fg = c.green })
hi("@string.escape",         { fg = c.cyan })
hi("@string.special",        { fg = c.cyan })
hi("@character",             { fg = c.green })
hi("@number",                { fg = c.yellow })
hi("@boolean",               { fg = c.pink, bold = true })
hi("@float",                 { fg = c.yellow })
hi("@function",              { fg = c.blue })
hi("@function.builtin",      { fg = c.cyan })
hi("@function.macro",        { fg = c.lavender })
hi("@function.method",       { fg = c.blue })
hi("@function.method.call",  { fg = c.blue_br })
hi("@constructor",           { fg = c.lav_br })
hi("@operator",              { fg = c.cyan })
hi("@keyword",               { fg = c.pink, bold = true })
hi("@keyword.function",      { fg = c.pink, bold = true })
hi("@keyword.operator",      { fg = c.cyan })
hi("@keyword.return",        { fg = c.pink, bold = true })
hi("@keyword.import",        { fg = c.lavender })
hi("@keyword.type",          { fg = c.lav_br })
hi("@type",                  { fg = c.lav_br })
hi("@type.builtin",          { fg = c.lavender })
hi("@type.definition",       { fg = c.lav_br })
hi("@attribute",             { fg = c.lavender })
hi("@property",              { fg = c.blue })
hi("@punctuation.delimiter", { fg = c.fg_dim })
hi("@punctuation.bracket",   { fg = c.fg_dim })
hi("@comment",               { fg = c.comment, italic = true })
hi("@comment.todo",          { fg = c.bg, bg = c.yellow, bold = true })
hi("@comment.warning",       { fg = c.bg, bg = c.yellow, bold = true })
hi("@comment.error",         { fg = c.bg, bg = c.pink,   bold = true })
hi("@tag",                   { fg = c.pink })
hi("@tag.attribute",         { fg = c.lavender })
hi("@tag.delimiter",         { fg = c.fg_dim })
hi("@markup.heading",        { fg = c.pink, bold = true })
hi("@markup.link",           { fg = c.cyan, underline = true })
hi("@markup.italic",         { italic = true })
hi("@markup.strong",         { bold = true })
hi("@markup.raw",            { fg = c.green })

-- ── Diagnostyka ──────────────────────────────────────────────────────────────
hi("DiagnosticError",            { fg = c.pink })
hi("DiagnosticWarn",             { fg = c.yellow })
hi("DiagnosticInfo",             { fg = c.blue })
hi("DiagnosticHint",             { fg = c.lavender })
hi("DiagnosticUnderlineError",   { undercurl = true, sp = c.pink })
hi("DiagnosticUnderlineWarn",    { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo",    { undercurl = true, sp = c.blue })
hi("DiagnosticUnderlineHint",    { undercurl = true, sp = c.lavender })

-- ── Git (gitsigns itd.) ───────────────────────────────────────────────────────
hi("DiffAdd",    { fg = c.green,  bg = "#0d1f17" })
hi("DiffChange", { fg = c.yellow, bg = "#1f1a0d" })
hi("DiffDelete", { fg = c.pink,   bg = "#1f0d14" })
hi("DiffText",   { fg = c.yellow, bg = "#2d2500", bold = true })
