" PATHOGEN
execute pathogen#infect()
filetype plugin on

" COLORSCHEME
set background=light           
colorscheme vim-material       
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
	
call togglebg#map("<F5>")
syntax on


imap <C-]> <C-o>:SearchNotes<CR>
nmap <C-]> :SearchNotes<CR>
map <C-n> :NERDTreeToggle<CR>

" VIM_NOTES PLUGIN
let g:notes_directories = ['~/Dropbox/Apps/neutriNote']

" BASICS
set number
set omnifunc=htmlcomplete#CompleteTags
" set textwidth=70
" set fo= 

" Source the vimrc file after saving it
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif
nmap <leader>v :edit $MYVIMRC<CR>

" linebreak:
command! -nargs=* Wrap set wrap linebreak nolist

" MARKDOWN
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.txt set filetype=markdown
au BufRead,BufNewFile *.md syntax match StrikeoutMatch '\~\~.*\~\~'   
"au BufRead,BufNewFile *.md syntax match muspieces '--.*/'
"au BufRead,BufNewFile *.md syntax match images '<).*/'

" FOLDING
set nocompatible
    if has("autocmd")
      filetype plugin indent on
    endif

let g:markdown_fold_style= 'nested'

" INVISIBLES
set list
set listchars=tab:›\ ,eol:¬
nnoremap <C-s> :%S/\S\+$//e<CR>

" TABLES
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
	let p = '^\s*|\s.*\s|\s*$'
	if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
	let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
	let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
	Tabularize/|/l1
	normal! 0
	call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
	endif
 endfunction

" SCROLLING
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

" CYRILLIC LANGMAP BINDINGS
"set langmap=йцукенгшщзхъфывапролджэячсмитьбю/ЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ/;qwertyuiop[]asdfghjkl;'zxcvbnm,./QWERTYUIOP[]ASDFGHJKL:'ZXCVBNM,./

"set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

"map ё `
"map й q
"map ц w
"map у e
"map к r
"map е t
"map н y
"map г u
"map ш i
"map щ o
"map з p
"map х [
"map ъ ]
"
"map ф a
"map ы s
"map в d
"map а f
"map п g
"map р h
"map о j
"map л k
"map д l
"map ж ;
"map э '
"
"map я z
"map ч x
"map с c
"map м v
"map и b
"map т n
"map ь m
"map б ,
"map ю .
"
"map Ё ~
"map Й Q
"map Ц W
"map У E
"map К R
"map Е T
"map Н Y
"map Г U
"map Ш I
"map Щ O
"map З P
"map Х {
"map Ъ }
"
"map Ф A
"map Ы S
"map В D
"map А F
"map П G
"map Р H
"map О J
"map Л K
"map Д L
"map Ж :
"map Э "
"
"map Я Z
"map Ч X
"map С C
"map М V
"map И B
"map Т N
"map Ь M
"map Б <
"map Ю >

set iskeyword=@,48-57,_,192-255

" OTHER MAPPINGS
let mapleader = ","

" BUBBLING TEXT
nmap <C-k> ddkP
nmap <C-j> ddp
vmap <C-k> xkP'[V']
vmap <C-j> xp'[V']

"REMAP ESCAPE
nnoremap uo <Esc>
vnoremap uo <Esc>gV
onoremap uo <Esc>
inoremap uo <Esc>`^

nnoremap гщ <Esc>
vnoremap гщ <Esc>gV
onoremap гщ <Esc>
inoremap гщ <Esc>`^

"MAP (.) FOR VISUAL MODE
vnoremap . :norm.<CR>

:cd /Users/mac/Dropbox/Apps/neutriNote

" process and view PDF of a ly file
" nmap <Leader>l :call LilyPondCompileOpen()<CR>
nmap <Leader>l :shell ~/bin/Lilypond % <CR>
"
" " open this file's corresponding pdf
" nmap <Leader>p :call Open_PDF()<CR>
"
" " :: change a file's extension
function! ChangeExt(name, ext)
         let name = substitute(a:name, "\.[a-zA-Z0-9_]*$", "\.".a:ext, "")
        return name
endfunction

" :: compile and open a LilyPond file
function! LilyPondCompileOpen()
         write

	let pdfname = ChangeExt(expand("%"), "pdf")

                exe "!/Applications/Lilypond.app/Contents/Resources/bin/lilypond -
dno-point-and-click --pdf '%' && open '" . pdfname . "'"
endfunction

                " :: open the PDF associated with this file (used for ly, tex)
function! Open_PDF()
        silent exe ":!open '".ChangeExt(expand("%"), "pdf'")
endfunction

"==============LILYPOND
set runtimepath+=/usr/share/lilypond/2.12.3/vim/ 

"================TEX
inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
inoremap ;ch \chapter{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap ;sc \section{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap ;su \subsection{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap ;ss \subsubsection*{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap ;BQ \quote{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap ;Q \cite{@}<++><Esc>?@}<Enter>a
inoremap ;F \footnote{}<Enter><++><Esc>?{}<Enter>a

inoremap ;B \textbf{}<++><Esc>?{}<Enter>a
inoremap ;I \textit{}<++><Esc>?{}<Enter>a

vnoremap ;F <Esc><Esc>`<i\footnote{<Esc>`>5la}<Space>
vnoremap ;BQ <Esc><Esc>`<i\quote{<Esc>`>4la}<Space>
vnoremap ;B <Esc><Esc>`<i\textbf{<Esc>`>5la}<Space>
vnoremap ;I <Esc><Esc>`<i\textit{<Esc>`>5la}<Space>

"~~~~~~tables
inoremap ;TL \begin{center}<Enter>\begin{tabular}{<Space><bar>c<bar>c<bar><Space>}<Enter>\hline<Enter><++><Space>&<Space><++><Space>\\<Enter>\hline\hline<Enter><++><Space>&<Space><++><Space>\\<Enter><++><Space>&<Space><++><Space>\\<Enter>\hline<Enter>\end{tabular}<Enter>\end{center}<Esc>8kf<bar>Ea
inoremap жЕД \begin{center}<Enter>\begin{tabular}{<Space><bar>c<bar>c<bar><Space>}<Enter>\hline<Enter><++><Space>&<Space><++><Space>\\<Enter>\hline\hline<Enter><++><Space>&<Space><++><Space>\\<Enter><++><Space>&<Space><++><Space>\\<Enter>\hline<Enter>\end{tabular}<Enter>\end{center}<Esc>8kf<bar>Ea
"new row
inoremap ;TR <Esc>o<Space><bar><Space>&<Space><++><Space>\\<Esc>F<bar>vc
inoremap жЕК <Esc>o<Space><bar><Space>&<Space><++><Space>\\<Esc>F<bar>vc

"~~~~~~lists
inoremap ;il <Esc>o\begin{itemize}<Enter>\item<Enter>\end{itemize}<Esc>kA<Space>
inoremap ;it <Esc>o\item<Space>

inoremap жшд <Esc>o\begin{itemize}<Enter>\item<Space>
inoremap жше <Esc>o\item<Space>

"--------TEX_RUS_MAPPINGS:
inoremap жср \chapter{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap жыс \section{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap жсг \subsection{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap жыы \subsubsection*{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap жИЙ \quote{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap жЙ \cite{@}<++><Esc>?@}<Enter>a
inoremap жА \footnote{}<Enter><++><Esc>?{}<Enter>a

inoremap жИ \textbf{}<++><Esc>?{}<Enter>a
inoremap жШ \textit{}<++><Esc>?{}<Enter>a

vnoremap жА <Esc><Esc>`<i\footnote{<Esc>`>5la}<Space>
vnoremap жИЙ <Esc><Esc>`<i\quote{<Esc>`>4la}<Space>
vnoremap жИ <Esc><Esc>`<i\textbf{<Esc>`>5la}<Space>
vnoremap жШ <Esc><Esc>`<i\textit{<Esc>`>5la}<Space>

"-------LATEX-PREVIEW
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'


"-----NEW CYRILLIC BINDINGS

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set imdisable
highlight ICursor guifg=NONE guibg=Red
cmap <silent> <C-s> <C-^>
imap <silent> <C-s> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
nmap <silent> <C-s> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
vmap <silent> <C-s> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv

"---- NEW HIGHLIGHTS KEYWORDS
highlight markdownQuote guifg=red guibg=green
syntax match markdownQuote /\[@[^\]]+\]/
