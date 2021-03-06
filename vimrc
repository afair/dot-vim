" --------------------------------------------------------------
" File:    .vimrc: vim editor customizations
" Author:  Allen Fair
" Date:    May 29, 2009
" License: Creative Commons
" Plugins:
"   matchit:     http://www.vim.org/scripts/script.php?script_id=39
"   vcscommand:  http://www.vim.org/scripts/script.php?script_id=90
"   snipMate:    http://www.vim.org/scripts/script.php?script_id=2540
"   nerdtree:    http://www.vim.org/scripts/script.php?script_id=1658
"   syntastic:   http://www.vim.org/scripts/script.php?script_id=2736  
"   autoclose:   http://www.vim.org/scripts/script.php?script_id=1849
"   surround:    http://www.vim.org/scripts/script.php?script_id=1697
"   git:         http://www.vim.org/scripts/script.php?script_id=1654
"   endwise:     http://www.vim.org/scripts/script.php?script_id=2386
"   ack:         http://www.vim.org/scripts/script.php?script_id=2572
"   fuzzyfinder: http://www.vim.org/scripts/script.php?script_id=1984
"   fuzzyfindertextmate: http://github.com/jamis/fuzzyfinder_textmate/tree/master
"     ./configure --prefix=$HOME/vim7 --enable-rubyinterp && make install
"     Macports: sudo port intall vim +ruby
"     gem install --source=http://gems.github.com jamis-fuzzy_file_finder
"   blackboard theme: http://www.vim.org/scripts/script.php?script_id=2280
"   NERD Commenter http://www.vim.org/scripts/script.php?script_id=1218
"   VIM Taglist http://vim-taglist.sourceforge.net/
"   bufexplorer: http://www.vim.org/scripts/script.php?script_id=42
"   textobj-user: http://www.vim.org/scripts/script.php?script_id=2100
"   textobj-rubyblock: http://www.vim.org/scripts/script.php?script_id=3382
"   lusty-explorer: http://www.vim.org/scripts/script.php?script_id=1890
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
  " FuzzyFinderTextMate - Load a file by fuzzy naming (Like in Textmate) --
  map <Leader>t :tabnew<CR>:FuzzyFinderTextMate<CR> 
  map <Leader>T :FuzzyFinderTextMate<CR> 
  " NERDTree adds a file navigation tree pane on the left
  map <Leader>f :NERDTreeToggle<CR>
	" TagList Toggles on F2. Requires "Exuberent CTags" installed.
	map <F2> :TlistToggle<CR>
	" BufExplorer: \be \bs or \bv (exploror, h-split, v-split)
	map <F3> :BufExplorerVerticalSplit<CR>
	" NERD Commenter uses <Leader>c<Space> for this, I prefer Textmate's
	map <Leader>/ <Plug>NERDCommenterToggle
	map <Leader>s :set spell<CR>
	map <Leader>S :set nospell<CR>

" Syntastic: http://www.vim.org/scripts/script.php?script_id=2736
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%{fugitive#statusline()}
  set statusline+=%*
	let g:syntastic_enable_signs=1
	let g:syntastic_auto_loc_list=1
	map <Leader>e :Errors<CR>
	map <Leader>l :lNext<CR>
	let g:ruby_path = "/Users/allen/.rvm/rubies/default/bin"


" Screen Setup
  set wrap                        " Line wrapping: wrap, nowrap
  set number                      " Line numbering: num, nonumber
  set showcmd                     " Show partial Command on last line
  set ruler                       " Show cursor position on last line: noruler
  set showtabline=1               " Tabs line: 0=Never 1=When >1 tabs open 2=Always
  set background=dark             " Adjust coloring: dark, light
  set virtualedit=                " Allows Cursor past EOL: '', block, insert, all, onemore
  set title                       " Updates Terminal title bar
  set noerrorbells                " no beep
  map <Leader>n :set invnumber<CR>
  map <Leader>w :set invwrap<CR>
	" Tab Switching when <C-PgUp> isn't working on the Mac. nor is <C-,>
  map <Leader>, :tabprev<CR>
  map <Leader>. :tabnext<CR>
	" Jump to next error location
  map <Leader>l :lnext<CR>

  " GUI or Text Mode
    set t_Co=256
    set guifont=Monaco:h13          " MacVim: ":set guifont=*" pops up font dialog
    colorscheme vibrantink
  if has("giu_running")           " This test is failing for MacVim
    set guioptions-=T             " Turn off Toolbar
    "colorscheme blackboard
    "colorscheme railscasts
    "colorscheme vividchalk
    set guifont=Monaco:h13          " MacVim: ":set guifont=*" pops up font dialog
    map <Leader>+ :set guifont=Monaco:h13<CR>
  else  
    set mouse=a                     " Mouse: n=normal v=visuali=insert c=cmdline a=all
    set clipboard=autoselect        " unamed=default, autoselect=system
    colorscheme vibrantink
    "colorscheme elflord
    map <Leader>m :set mouse=<CR>
    map <Leader>M :set mouse=a<CR>
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

" Diff Mode
  if &diff                        " Only when vim started in diff mote (vimdiff, -d)
    set diffopt+=iwhite           " Ignore white space differences
    " Map \g to GET from other version, \p to PUT to other version
    map <Leader>g :diffget<CR>
    map <Leader>p :diffput<CR>
  endif

" Abbreviations and common typing error corrections 
  ab teh the
  ab cofirm confirm
  ab subscibe subscribe
  ab subsciber subscriber
  ab subsc subscriber
  ab privl privilege_level
  ab udpate update
  ab biglsit biglist

" File Type Specific Settings
  set tabstop=2
  augroup myfiletypes
    " Clear old autocmds in group
    autocmd!                      
    autocmd BufNewFile,BufRead *.html,*.tpl setf html
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml,rhtml,erb set ai sw=2 sts=2 et
    autocmd FileType php,tpl,html set tabstop=2
    autocmd FileType perl,php set ai sw=2 sts=2 et smartindent
    autocmd FileType ruby,eruby,yaml,erb,rhtml set tabstop=2 smartindent
    autocmd FileType tpl,html set ai sw=2 sts=2 et smartindent tabstop=2
    autocmd FileType css set smartindent tabstop=2
    autocmd FileType c,h set smartindent tabstop=8
    " Poor Man's Macros: def<cr> expands to full Ruby method definition
		" "autocmd FileType ruby iab def def<cr>end<esc>-A
  augroup END

"" " Completion: This is no longer needed with new version 
""  function! SuperCleverTab()
""    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
""        return "\<Tab>"
""    else
""        if &omnifunc != ''
""            return "\<C-X>\<C-O>"
""        elseif &dictionary != ''
""            return "\<C-K>"
""        else
""            "return "\<C-N>" "this searched for keyword in ALL incl files!
""            return "\<C-X>\<C-P>"
""        endif
""    endif
""  endfunction
"" 	"inoremap <F1> <C-R>=SuperCleverTab()<cr>
" set F1 as alternate Omnicompletion key (close to Textmate's Escape)
  "inoremap <F1> <C-P>
  inoremap <F1> <C-x><C-n>
	set include-=i
	set include=
	"inoremap dput dput();<Left><Left>

	" Define which ruby to use for syntastic with RVM
	let g:ruby_path = "/Users/allen/.rvm/rubies/default/bin"

" -------------------------------------------------------
" Stupid Vim Tricks
" -------------------------------------------------------
" Show tabs, trailing spaces and eol char on line, and show $ as red
  " set list listchars=tab:>>,trail:*,eol:$
	" hi nontext ctermfg=red
