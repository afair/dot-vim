set nocompatible          " We're running Vim, not Vi!
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml,rhtml,erb set ai sw=2 sts=2 et
  autocmd FileType php,tpl,html set tabstop=2
augroup END

set autoindent
set showcmd
" highlight matches
set hlsearch

"indenting: note the commands to use before pasting code
"       autocmd FileType php,pl filetype plugin indent on
filetype plugin indent on
"set paste
"set nopaste

" From http://wiki.rubyonrails.org/rails/pages/HowtoUseVimWithRails
set nocompatible
filetype plugin indent on
" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim
augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType perl,php set ai sw=2 sts=2 et smartindent
  autocmd FileType ruby,eruby,yaml,erb,rhtml set ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml,erb,rhtml set tabstop=2 smartindent
  autocmd FileType tpl,html set ai sw=2 sts=2 et smartindent tabstop=2
" autocmd FileType tpl,html set tabstop=2
  autocmd FileType css set smartindent tabstop=2
  autocmd FileType ruby iab def def<cr>end<esc>-A
augroup END

" Sets F11 to invertpaste. so F11 + i + shift+insert/paste + Esc + F11
map <F11> :set invpaste<CR> 
map <F10> :set invnu<CR> 
map <F6> :set invnu<CR> 
map <F9> :w !perl -cw<CR> 
map <C-o> :w !perl -cw<CR> 
map <C-n> :set invnu<CR>
map <C-h> :set invhlsearch<CR>
map <C-p> :set invpaste<CR>
map <C-q> :NERDTree<CR>

set background=dark
"colorscheme vividchalk
"colorscheme vibrantink
"colorscheme elflord
"colorscheme railscasts

" Macbook key bindings
"set t_ku=[A
"set t_kd=[B
"set t_kr=[C
"set t_kl=[D

" Typo corrections, compliments of Omar
:ab cofirm confirm
:ab subscibe subscribe
:ab subsciber subscriber
:ab subsc subscriber

":syntax sync  minlines=100 maxlines=500
"autocmd BufEnter * :syntax sync fromstart
:syn sync minlines=300 

":set number
:set ruler
:set hidden " allows buffer to be in background without first saving, remembers undo history
:set ignorecase 
:set smartcase
:set showcmd
":set virtualedit=all " Allows cursor to pass thru fluidic space
:set incsearch "search as you type
":set showmatch " cursor hops to matching ({[ when closing ]}) is typed
:set mouse=a " enables mouse on terminals! c00l!
":set ww=<,>,[,]
:set wildmode=longest,full " File tab completion like bash

set hlsearch
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            "return "\<C-N>" "this searched for keyword in ALL incl files!
            return "\<C-X>\<C-P>"
        endif
    endif
endfunction

inoremap <F1> <C-R>=SuperCleverTab()<cr>
"inoremap <Tab> <C-R>=SuperCleverTab()<cr>
" For FuzzyFinder plaugin
"map <C-t> :FuzzyFinderFile<CR> 
" For FuzzyFinderTextMate plugin, requires --enable-rubyinterp, else use above
map <C-t> :FuzzyFinderTextMate<CR> 

