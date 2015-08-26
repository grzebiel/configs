
set nocompatible               " Be iMproved
"-----------------------------------------------------------
"---------  NeoBundle Scripts  -----------------------------
"-----------------------------------------------------------

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

" maximal timeout for installation process
let g:neobundle#install_process_timeout = 1500

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
" file system browser
NeoBundle 'scrooloose/nerdtree'
" status line for vim
NeoBundle 'bling/vim-airline'
" buffer display list (inegrated with airline)
NeoBundle 'bling/vim-bufferline'
" autoformat code using externals tools
NeoBundle 'Chiel92/vim-autoformat'
" ack (programmers grep) plugin
NeoBundle 'mileszs/ack.vim'
" file searcher (not only)
NeoBundle 'unite.vim'
" vimproc a luncher
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }

" shell implementation inside vim
NeoBundle 'Shougo/vimshell.vim'

" autocompletion
NeoBundle 'vim-scripts/OmniCppComplete'
"NeoBundle 'Valloric/YouCompleteMe'
", {
"
"     \ 'build' : {
"     \     'mac' : './install.sh --clang-completer --system-libclang --gocode-completer',
"     \     'unix' : './install.sh --clang-completer --system-libclang --gocode-completer',
"     \     'windows' : './install.sh --clang-completer --system-libclang --gocode-completer',
"     \     'cygwin' : './install.sh --clang-completer --system-libclang --gocode-completer'
"     \    }
"     \ }
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
"vim syntax highlighting based on ctags and auto tags generation
"Vim git support
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'flazz/vim-colorschemes'
"" unite.vim tags browser
""NeoBundle 'tsukkee/unite-tag'
"integrationo with tmux
NeoBundle 'benmills/vimux'
"
" Required:
call neobundle#end()
"
" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


"-----------------------------------------------------------
"---------  Must have  -------------------------------------
"-----------------------------------------------------------

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


"------------------------------------------------------------
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

" airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
set guifont=Source\ Code\ Pro\ for\ Powerline "make sure to escape the spaces in the name properly


" vim autoformat settings
let g:formatprg_cs="astyle"
let g:formatprg_args_cs="--indent=spaces=4 --suffix=none --unpad-paren --pad-oper --break-closing-brackets  --indent-labels --indent-cases --convert-tabs --indent-col1-comments --indent-preprocessor \"{}\" ;"

" vim as man viewer required:
let $PAGER=''


" ycm configuratioin
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'

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
nnoremap <silent> <c-p> :FZF<cr>
nnoremap <space>/ :Unite grep:.<cr>
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite buffer<cr>

"ack using ag
"
if executable('ag')
  let g:ackprg = 'ag --vimgrep --ignore "build*" --ignore "tags"'
endif

"fzf (bash fuzzy finder) vim plugin
set rtp+=~/.fzf

set guifont=Monospace\ 11

"completion Options
set completeopt=longest,menuone
"omnicpp config
set nocp
let OmniCpp_ShowAccess=1
let OmniCpp_ShowPrototypeInAbbr=1
