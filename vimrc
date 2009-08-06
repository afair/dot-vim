" --------------------------------------------------------------
" File:    .vimrc: vim editor customizations
" Author:  Allen Fair
" Date:    May 29, 2009
" License: Creative Commons
" Plugins:
"   matchit: http://www.vim.org/scripts/script.php?script_id=39
"   vcscommand: http://www.vim.org/scripts/script.php?script_id=90
"   blackboard theme: http://www.vim.org/scripts/script.php?script_id=2280
"   snippetsemu: http://www.vim.org/scripts/script.php?script_id=1318
"   nerdtree: http://www.vim.org/scripts/script.php?script_id=1658
"   fuzzyfinder: http://www.vim.org/scripts/script.php?script_id=1984
"   fuzzyfindertextmate: http://github.com/jamis/fuzzyfinder_textmate/tree/master
"     ./configure --prefix=$HOME/vim7 --enable-rubyinterp && make install
"     gem install --source=http://gems.github.com jamis-fuzzy_file_finder
" --------------------------------------------------------------

" Turn on Full-featured VIM
  set nocompatible                " We're running Vim, not Vi!
  syntax on                       " Enable syntax highlighting	
  syntax sync minlines=300        " How many lines to be used in to determine coloring
  filetype plugin indent on       " Enable filetype-specific indenting and plugins
  set hidden                      " Lets unsaved buffer be hidden

" Plugin initialization and mapping
  runtime! macros/matchit.vim     " matchit: Use % to locate begin/end matches
  filetype plugin indent on
  " NERDTree adds a file navigation tree pane on the left
  map <Leader>f :NERDTree<CR>
  " FuzzyFinderTextMate - Load a file by fuzzy naming (Like in Textmate)
  map <Leader>t :FuzzyFinderTextMate<CR> 

" Screen Setup
  set wrap                        " Line wrapping: wrap, nowrap
  set number                      " Line numbering: num, nonumber
  set showcmd                     " Show partial Command on last line
  set ruler                       " Show cursor position on last line: noruler
  set showtabline=1               " Tabs line: 0=Never 1=When >1 tabs open 2=Always
  set background=dark             " Adjust coloring: dark, light
  set virtualedit=                " Allows Cursor past EOL: '', block, insert, all, onemore
  map <Leader>n :set invnumber<CR>
  map <Leader>w :set invwrap<CR>

" GUI or Text Mode
  if has("giu_running")
    set guioptions-=T             " Turn off Toolbar
    "colorscheme railscasts
    "colorscheme vividchalk
    "set guifont=*                " MacVim: pops up font dialog
  else  
    set mouse=a                     " Mouse: n=normal v=visuali=insert c=cmdline a=all
    set clipboard=autoselect        " unamed=default, autoselect=system
    "colorscheme vibrantink
    "colorscheme elflord
    map <Leader>m :set mouse=<CR>
  endif

" Diff Mode
  if &diff                        " Only when vim started in diff mote (vimdiff, -d)
    set diffopt+=iwhite           " Ignore white space differences
    " Map \g to GET from other version, \p to PUT to other version
    map <Leader>g :diffget<CR>
    map <Leader>p :diffput<CR>
  endif

" Search Controls
  set hlsearch                    " Highlights search terms: hls, nohls
  set ignorecase                  " Ignore Case on search: ignorecase, noignorecase
  set smartcase                   " When searching with uppercase, turns off ignorecase
  set incsearch                   " Incremental search while you are typing
  map <Leader>h :set invhlsearch<CR>

" Indenting, Typing, and Pasting Controls
  set autoindent                  " Auto: autoindent, noautoindent
  set smartindent                 " For C-style languages: nosmartindent
  set wildmode=longest,full       " File tab completion like bash
  map <Leader>p :set invpaste<CR>

" Abbreviations and common typing error corrections 
  ab cofirm confirm
  ab subscibe subscribe
  ab subsciber subscriber
  ab subsc subscriber

" File Type Specific Settings
  augroup myfiletypes
    " Clear old autocmds in group
    autocmd!                      
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml,rhtml,erb set ai sw=2 sts=2 et
    autocmd FileType php,tpl,html set tabstop=2
    autocmd FileType perl,php set ai sw=2 sts=2 et smartindent
    autocmd FileType ruby,eruby,yaml,erb,rhtml set tabstop=2 smartindent
    autocmd FileType tpl,html set ai sw=2 sts=2 et smartindent tabstop=2
    autocmd FileType css set smartindent tabstop=2
    " Poor Man's Macros: def<cr> expands to full Ruby method definition
    autocmd FileType ruby iab def def<cr>end<esc>-A
  augroup END

" Completion

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

  " Map <F1> (or <Tab>) to trigger word completion
  inoremap <F1> <C-R>=SuperCleverTab()<cr>

