
set nocompatible               " Be iMproved
"---------  dein Scripts  -----------------------------

" Required:
set runtimepath^=/home/grzebiel/.vim/bundle//repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/home/grzebiel/.vim/bundle/'))

" Let dein manage dein
call dein#add('Shougo/dein.vim')


" Add or remove your Bundles here:
" file system browser
call dein#add('scrooloose/nerdtree')
    "toggle nerdtree using space-n
    nnoremap <space>n :NERDTreeToggle<cr>
    let g:NERDTreeWinPos='right'

" status line for vim
call dein#add('bling/vim-airline')
    " airline settings
    let g:airline_powerline_fonts = 1


" buffer display list (inegrated with airline)
"call dein#add('bling/vim-bufferline')
" autoformat code using externals tools
call dein#add('Chiel92/vim-autoformat')
    " vim autoformat settings
    let g:formatprg_cs="astyle"
    let g:formatprg_args_cs="--indent=spaces=4 --suffix=none --unpad-paren --pad-oper --break-closing-brackets  --indent-labels --indent-cases --convert-tabs --indent-col1-comments --indent-preprocessor \"{}\" ;"

" ack (programmers grep) plugin
call dein#add('mileszs/ack.vim')
    "ack using ag
    if executable('ag')
      let g:ackprg = 'ag --vimgrep --ignore "build*" --ignore "tags"'
    endif

" file searcher (not only)
call dein#add('unite.vim')
" vimproc a luncher
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
" shell implementation inside vim
call dein#add('Shougo/vimshell.vim')

" autocompletion
call dein#add('vim-scripts/OmniCppComplete')
    set completeopt=longest,menuone
    "omnicpp config
    set nocp
    let OmniCpp_ShowAccess=1
    let OmniCpp_ShowPrototypeInAbbr=1

"Vim git support
call dein#add('tpope/vim-fugitive')

"vim show line changed in according to git
call dein#add('airblade/vim-gitgutter')

"syntax external checker
call dein#add('scrooloose/syntastic')
    "syntastic (syntax checker) Options
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_javascript_checkers = ['jshint']

    "C++ lags
    let g:syntastic_cpp_compiler = "clang++"
    let g:syntastic_cpp_compiler_options = '-std=c++14'"

"sending commands to the tmux split
call dein#add('benmills/vimux')

"project configuration
call dein#add('tpope/vim-projectionist')
    let g:projectionist_heuristics = {
      \   "*.cpp": {
      \     "alternate": "{}.hpp",
      \     "type": "source"
      \   },
      \   "*.hpp": {
      \     "alternate": "{}.cpp",
      \     "type": "header"
      \   },
      \ }

"support for rust lang
call dein#add('wting/rust.vim')

"bar of interpreted tags from ctags
call dein#add('majutsushi/tagbar')

"snippets manager
call dein#add('SirVer/ultisnips')

    " Snippets are separated from the engine. Add this if you want them:
    call dein#add('honza/vim-snippets')

    " Trigger configuration.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

"
" Required:
call dein#end()
"
" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
if dein#check_install()
    call dein#install()
endif
"End NeoBundle Scripts-------------------------


"-----------------------------------------------------------
"---------  Must have  -------------------------------------
"-----------------------------------------------------------
" Colorscheme that works nice with vimdiff
set background=dark

" Enable syntax highlighting
syntax on

" Reuse window for saved and unsaved files in diferrent buffers.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" keep the indent
set autoindent

" Stop certain movements from always going to the first character of a line.
set nostartofline

" Display the cursor position
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" dialogue asking if you wish to save changed files.
set confirm

" disable all bells
set visualbell
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Indentation settings for using 4 spaces instead of tabs.
set shiftwidth=4
set softtabstop=4
set expandtab

" cursor line highlingh
set cursorline
" cursorline number set
hi CursorLineNr cterm=bold ctermfg=Yellow gui=bold guifg=Yellow
hi CursorLine cterm=bold ctermbg=234

" always show few top or bottom lines around cursor
set scrolloff=5


"-----------------------------------------------------------
"---------  Mappings ---------------------------------------
"-----------------------------------------------------------

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Map <space>w for :w
nnoremap <space>w :w<CR>


" vim as man pager required
runtime! ftplugin/man.vim

" rfc syntax
 if expand('%:t') =~? 'rfc\d\+'
      setfiletype rfc
 endif

" color all whitespace but non-tailing space
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

" vim using 256 bit colors
set t_Co=256

" vim as man viewer required:
let $PAGER=''

nnoremap <silent> <c-p> :FZF<cr>
"fzf (bash fuzzy finder) vim plugin
set rtp+=~/.fzf

"Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#custom#source('file_rec/async','sorters','sorter_rank', )
"replacing unite with ctrl-p
let g:unite_source_file_rec_max_cache_files=5000
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_prompt='» '
let g:unite_split_rule = 'botright'
"use ag instead of grep
if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4 --ignore "build*" --ignore "tags"'
    let g:unite_source_grep_recursive_opt=''
endif
nnoremap <space>/ :Unite grep:.<cr>
"unite grep for search under cursor
nnoremap <space>g "zyiw<space>:Unite grep:.<CR><C-r>z<CR>
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite buffer<cr>

