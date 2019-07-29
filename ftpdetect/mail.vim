" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
   finish
endif
let b:did_ftplugin = 1

" safe and simple
setlocal nobackup
setlocal noswapfile
setlocal nowritebackup

let b:undo_ftplugin = "setl modeline< tw< fo< comments<"
" Don't use modelines in e-mail messages, avoid trojan horses and nasty
" "jokes" (e.g., setting 'textwidth' to 5).
setlocal nomodeline

" many people recommend keeping e-mail messages 72 chars wide
if &tw == 0
	setlocal tw=72
endif
setlocal colorcolumn=+1

" Set 'formatoptions' to break text lines and keep the comment leader ">".
" I promise I will learn what it does!
setlocal fo+=aw
setlocal fo+=tcql

setlocal expandtab
setlocal nosmartindent
setlocal noautoindent
setlocal linebreak
" start in INSERT mode right away
" works but is little difficult to leave INSERT
" setlocal insertmode
		:exe 'startinsert'

" if replying including email and not in empty file
" re-format message using some magic and par (brew info par)
" put cursor in above first line and start in INSERT mode
if line('$') > 1
		silent :g/^>\s\=--\s\=$/,$ delete
		silent :%!par w72q
		silent :%s/^.\+\ze\n\(>*$\)\@!/\0 /e
		silent :%s/^>*\zs\s\+$//e
		:1
		:put! =\"\n\"
		:1
"		:exe 'startinsert'
endif

" Add n:> to 'comments, in case it was removed elsewhere
setlocal comments+=n:>

set syntax=markdown
