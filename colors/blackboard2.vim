" Vim color scheme
"
" Name:         vibrantink.vim
" Maintainer:   Jo Vermeulen <jo.vermeulen@gmail.com> 
" Last Change:  30 Jul 2007 
" License:      public domain
" Version:      1.2
"
" This scheme should work in the GUI and in xterm's 256 color mode. It won't
" work in 8/16 color terminals.
"
" I based it on John Lam's initial VibrantInk port to Vim [1]. Thanks to a
" great tutorial [2], I was able to convert it to xterm 256 color mode. And
" of course, credits go to Justin Palmer for creating the original VibrantInk
" TextMate color scheme [3].
"
" [1] http://www.iunknown.com/articles/2006/09/04/vim-can-save-your-hands-too
" [2] http://frexx.de/xterm-256-notes/
" [3] http://encytemedia.com/blog/articles/2006/01/03/textmate-vibrant-ink-theme-and-prototype-bundle

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "vibrantink"

if has("gui_running")
    highlight Normal             guifg=#DDDDDD guibg=Black
    highlight Cursor             guifg=Black   guibg=Yellow
    highlight Keyword            guifg=#FF6600
    highlight Define             guifg=#FF6600
    highlight Comment            guifg=#9933CC
    highlight Type               guifg=White   gui=NONE
    highlight rubySymbol         guifg=#339999 gui=NONE
    highlight Identifier         guifg=White   gui=NONE
    highligh rubyStringDelimiter guifg=#66FF00
    highlight rubyInterpolation  guifg=White
    highlight rubyPseudoVariable guifg=#339999
    highlight Constant           guifg=#FFEE98
    highlight Function           guifg=#FFCC00 "gui=NONE
    highlight Include            guifg=#FFCC00 gui=NONE
    highlight Statement          guifg=#FF6600 gui=NONE
    highlight String             guifg=#66FF00
    highlight Search             guifg=White   guibg=#888888
    highlight CursorLine         guibg=#323300
    highlight LineNr             guifg=#888888 guibg=#111111
else
    set t_Co=256
    highlight Normal             ctermfg=250   ctermbg=233
    highlight Cursor             ctermfg=Black ctermbg=Yellow 
    highlight Keyword            ctermfg=019   ctermbg=052
		hi        StatusLine         ctermfg=253 ctermbg=Black
		hi        StatusLineNC       ctermfg=253 ctermbg=8
    highlight Define             ctermfg=011
    highlight Comment            ctermfg=239
    highlight Type               ctermfg=061 "White 
    highlight rubySymbol         ctermfg=66 
    highlight Identifier         ctermfg=250
    highlight Constant           ctermfg=228 
    highlight Function           ctermfg=203 
    highlight Include            ctermfg=220 
    highlight Statement          ctermfg=202
    highlight String             ctermfg=82 
    highlight Search             ctermbg=155 
    highlight CursorLine         cterm=NONE    ctermbg=235
    highlight LineNr             ctermfg=8     ctermbg=253

		hi        perlStatement      ctermfg=011
		hi        perlConditional    ctermfg=011
		hi        perlFunctionName   ctermfg=001
		hi        perlOperator       ctermfg=061

		hi        rubyFunction   ctermfg=001
    highlight rubyStringDelimiter ctermfg=82 
    highlight rubyInterpolation  ctermfg=061 "White 
    highlight rubyPseudoVariable ctermfg=66 

endif
