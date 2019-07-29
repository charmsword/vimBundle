" vim-material Theme v0.0.1

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "vim-material"

let s:gui = {}
let s:cterm = {}

"#25282C
let s:gui.background = { 'dark': '#3a3a3a', 'light': '#E4E4E4' }
let s:gui.foreground = { 'dark': '#B2CCD6', 'light': '#000000' }
let s:gui.none       = { 'dark': 'NONE', 'light': 'NONE' }
let s:gui.selection  = { 'dark': '#BAA181', 'light': '#BCBCBC' }
let s:gui.line       = { 'dark': '#212121', 'light': '#D0D0D0' }
let s:gui.comment    = { 'dark': '#49656F', 'light': '#5F5F5F' }
" let s:gui.selection  = { 'dark': '#455A64', 'light': '#BCBCBC' }

let s:gui.red          = { 'dark': '#FF5370', 'light': '#E53935' }
let s:gui.dark_red     = { 'dark': '#B71C1C', 'light': '#E53935' }
let s:gui.pink         = { 'dark': '#F07178', 'light': '#FF5370' }
let s:gui.orange       = { 'dark': '#BAA181', 'light': '#F76D47' }
let s:gui.yellow       = { 'dark': '#FFCB6B', 'light': '#FFB62C' }
let s:gui.green        = { 'dark': '#C3E88D', 'light': '#91B859' }
let s:gui.teal         = { 'dark': '#004D40', 'light': '#91B859' }
let s:gui.lighter_teal = { 'dark': '#00897B', 'light': '#91B859' }
let s:gui.pale_blue    = { 'dark': '#7E9AB1', 'light': '#8796B0' }
let s:gui.cyan         = { 'dark': '#89DDFF', 'light': '#39ADB5' }
let s:gui.blue         = { 'dark': '#82AAFF', 'light': '#6182B8' }
let s:gui.purple       = { 'dark': '#C792EA', 'light': '#7C4DFF' }
let s:gui.violet       = { 'dark': '#BB80B3', 'light': '#945EB8' }
let s:gui.brown        = { 'dark': '#AB7967', 'light': '#AB7967' }
"#F5DAAC
"#B2CCD6

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr)
  if s:gui(a:guifg) != ""
    exec "hi " . a:group . " guifg=" . s:gui(a:guifg)
  endif
  if s:gui(a:guibg) != ""
    exec "hi " . a:group . " guibg=" . s:gui(a:guibg)
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfunction

function! s:gui(color)
  if &background == "light"
    return a:color['light']
  else
    return a:color['dark']
  endif
endfunction

" Editor colors
call s:hi("CursorLine",   s:gui.none,       s:gui.line,       "", "", "")
call s:hi("ColorColumn",  s:gui.none,       s:gui.line,       "", "", "")
call s:hi("Cursor",       s:gui.background,     s:gui.cyan,               "", "", "")
call s:hi("CursorColumn", s:gui.none,       s:gui.line,       "", "", "")
call s:hi("LineNr",       s:gui.comment,    "",               "", "", "")
call s:hi("CursorLine",   s:gui.none,       s:gui.line,       "", "", "")
call s:hi("CursorLineNr", s:gui.cyan,       s:gui.line,       "", "", "")
call s:hi("Directory",    s:gui.blue,       "",               "", "", "")
call s:hi("FoldColumn",   "",               s:gui.background, "", "", "")
call s:hi("Folded",       s:gui.orange,    s:gui.line,       "", "", "")
call s:hi("PMenu",        s:gui.foreground, s:gui.line,       "", "", "")
call s:hi("PMenuSel",     s:gui.cyan,       s:gui.selection,  "", "", "bold")
call s:hi("ErrorMsg",     s:gui.red,        s:gui.none,       "", "", "")
call s:hi("Error",        s:gui.red,        s:gui.none,       "", "", "")
call s:hi("WarningMsg",   s:gui.orange,     "",               "", "", "")
call s:hi("VertSplit",    s:gui.background, s:gui.foreground, "", "", "")
call s:hi("Conceal",      s:gui.comment,    s:gui.background, "", "", "")

call s:hi("DiffAdd",     "",             s:gui.teal,         "", "", "")
call s:hi("DiffAdded",   s:gui.green,    "",                 "", "", "")
call s:hi("DiffChange",  "",             s:gui.teal,         "", "", "")
call s:hi("DiffRemoved", s:gui.dark_red, "",                 "", "", "")
call s:hi("DiffDelete",  s:gui.red,      s:gui.dark_red,          "", "", "")
call s:hi("DiffText",    "",             s:gui.lighter_teal, "", "", "")


call s:hi("NonText",     s:gui.comment,    "",               "", "", "")
call s:hi("helpExample", s:gui.blue,       "",               "", "", "")
call s:hi("MatchParen",  "",               s:gui.selection,  "", "", "")
call s:hi("Title",       s:gui.cyan,       "",               "", "", "")
call s:hi("Comment",     s:gui.comment,    "",               "", "", "italic")
call s:hi("String",      s:gui.green,      "",               "", "", "")
call s:hi("Normal",      s:gui.foreground, s:gui.background, "", "", "")
call s:hi("Visual",      s:gui.background,               s:gui.selection,  "", "", "")
call s:hi("Constant",    s:gui.pink,       "",               "", "", "")
call s:hi("Type",        s:gui.yellow,     "",               "", "", "")
call s:hi("Define",      s:gui.cyan,       "",               "", "", "")
call s:hi("Statement",   s:gui.cyan,       "",               "", "", "")
call s:hi("Function",    s:gui.blue,       "",               "", "", "")
call s:hi("Conditional", s:gui.cyan,       "",               "", "", "")
call s:hi("Float",       s:gui.red,        "",               "", "", "")
call s:hi("Number",      s:gui.red,        "",               "", "", "")
call s:hi("Identifier",  s:gui.pink,       "",               "", "", "")
call s:hi("Operator",    s:gui.cyan,       "",               "", "", "")
call s:hi("PreProc",     s:gui.blue,       "",               "", "", "")
call s:hi("Search",      s:gui.none,       s:gui.none,       "", "", "underline")
call s:hi("InSearch",    s:gui.background, s:gui.foreground, "", "", "")
call s:hi("Todo",        s:gui.red,        s:gui.none,       "", "", "")
call s:hi("Special",     s:gui.orange,     "",               "", "", "")
call s:hi("Keyword",     s:gui.yellow,     "",               "", "", "bold")



" Ruby colors
call s:hi("rubySymbolDelimiter", s:gui.cyan, "", "", "", "")
call s:hi("rubyKeywordAsMethod", s:gui.blue, "", "", "", "")

" Elixir colors
call s:hi("elixirKeyword", s:gui.blue, "", "", "", "")

" Javascript colors
call s:hi("javascriptVariable",    s:gui.purple, "", "", "", "")
call s:hi("javascriptObjectLabel", s:gui.blue, "", "", "", "")
call s:hi("javascriptProperty",    s:gui.cyan, "", "", "", "")
call s:hi("javascriptBraces",      s:gui.cyan, "", "", "", "")
call s:hi("javascriptBrackets",    s:gui.cyan, "", "", "", "")

" Markdown colors
call s:hi("markdownBlockquote", s:gui.pale_blue, "", "", "", "italic")
call s:hi("markdownCode", s:gui.cyan, "", "", "", "bold")
call s:hi("markdownCodeDelimiter", s:gui.pale_blue, "", "", "", "")
call s:hi("markdownFootnote", s:gui.background, s:gui.foreground, "", "", "")
call s:hi("markdownId", "", "", "", "", "")
call s:hi("markdownIdDeclaration", "", "", "", "", "")
call s:hi("markdownH1", s:gui.yellow, "", "", "", "bold")
call s:hi("markdownLinkText", s:gui.blue, "", "", "", "")
call s:hi("markdownUrl", s:gui.blue, "", "", "", "")
call s:hi("markdownListMarker", s:gui.cyan, "", "", "", "bold")
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter markdownListMarker
hi! link markdownBold markdownCode

"+--- Attributes ---+
" call s:hi("Bold", s:gui.cyan, "", "", "", "bold")
call s:hi("markdownItalic", s:gui.cyan, "", "", "", "italic")
call s:hi("Underline", s:gui.yellow, "", "", "", "underline")

call s:hi("yamlBlockMappingKey", s:gui.cyan, "", "", "", "bold")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

hi! link StrikeoutColor Comment
hi link StrikeoutMatch StrikeoutColor

call s:hi("muspiecesColor", s:gui.cyan, s:gui.line, "", "", "")
hi link muspieces muspiecesColor

call s:hi("imagesColor", s:gui.orange, s:gui.line, "", "", "")
hi link images imagesColor

call s:hi("htmlUnderline", s:gui.yellow, s:gui.line, "", "", "underline")

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
