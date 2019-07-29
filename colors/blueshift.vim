" Blueshift color scheme
" by Jan Zwiener, mail: jan@zwiener.org
" Based upon the pyte color scheme by Henning Hasemann
"
" 2010/11/16: Version 1.0
"

set background=light

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "blueshift"

" Taglist colors
hi MyTagListFileName    guifg=black   guibg=#c0d0e0
hi MyTagListTagName     guifg=black   guibg=#ffbc29

if version >= 700
  hi CursorLine     guibg=#f6f6f6
  hi CursorColumn   guibg=#f6f6f6
  hi MatchParen     guifg=black     guibg=#dfdfdf

  hi TabLine        guifg=black     guibg=#b0b8c0
  hi TabLineFill    guifg=#9098a0
  hi TabLineSel     guifg=black     guibg=#f0f0f0 gui=bold

  hi Pmenu          guifg=white     guibg=#808080
  hi PmenuSel       guifg=black     guibg=#ffbc29
endif

hi Title        guifg=#202020   gui=none
hi Underlined   guifg=#202020   gui=underline

hi Normal       guifg=black     guibg=white
hi ModeMsg      guifg=black     guibg=white
hi Cursor       guifg=#f0f0f0   guibg=#101010
hi LineNr       guifg=#ffffff   guibg=#c0d0e0
hi Visual       guifg=white     guibg=#5381bc
hi WildMenu     guifg=black     guibg=#ffbc29
hi IncSearch    guibg=black     guifg=#ffbc29
hi Question     guifg=black     guibg=#ffbc29

hi StatusLine   guifg=white     guibg=#8090a0 gui=bold
hi StatusLineNC guifg=#708090   guibg=#ced5db gui=none
hi VertSplit    guifg=#a0b0c0   guibg=#a0b0c0 gui=none

hi NonText      guifg=#bebebe   guibg=#f2f2f2
hi Comment      guifg=#008000   gui=italic
hi Folded       guifg=#708090   guibg=#c0d0e0
hi Folded       guifg=#708090   guibg=#c0d0e0
hi FoldColumn   guifg=#708090   guibg=#c0d0e0

hi Constant     guifg=black
hi Number       guifg=black
hi Float        guifg=black
hi Boolean      guifg=#0048ff
hi String       guifg=#4070a0   gui=none

hi Statement    guifg=#0048ff   gui=none
hi Type         guifg=#0048ff   gui=none
hi Structure    guifg=#0048ff   gui=none
hi Identifier   guifg=#0048ff   gui=none
hi Function     guifg=#0048ff   gui=none
hi Repeat       guifg=#0048ff   gui=bold
hi Conditional  guifg=#0048ff   gui=bold
hi Operator     guifg=black

hi PreProc      guifg=#1060a0   gui=none
hi Define       guifg=#1060a0   gui=bold
hi Include      guifg=#1060a0   gui=none

hi Error        guifg=red       guibg=white     gui=bold,underline
hi Todo         guifg=white     guibg=#1060a0   gui=bold
hi SpecialKey	guifg=#1060a0   guibg=white
hi Special      guifg=black     guibg=white

" Diff
hi DiffChange   guifg=NONE      guibg=#e0e0e0   gui=bold
hi DiffText     guifg=NONE      guibg=#f0c8c8   gui=bold
hi DiffAdd      guifg=NONE      guibg=#c0e0d0   gui=bold
hi DiffDelete   guifg=NONE      guibg=#f0e0b0   gui=bold


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
