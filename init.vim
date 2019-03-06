" Setup dein  ---------------------------------------------------------------{{{
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.dein/')
  call dein#begin('~/.dein/')

  " Let dein manage dein
  " Required:
  call dein#add('~/.dein/repos/github.com/Shougo/dein.vim')

  "------------------------------------------
  " Add or remove your plugins here:
  "------------------------------------------
  call dein#add('rust-lang/rust.vim')
  call dein#add('w0rp/ale')
  call dein#add('Valloric/YouCompleteMe')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('Yggdroot/indentLine')
  call dein#add('liuchengxu/space-vim-dark')
  call dein#add('scrooloose/nerdtree') " Purely for aesthetics, native netrw works fine
  call dein#add('ryanoasis/vim-devicons')
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
set termguicolors
set mouse=a
syntax enable
set noshowmode          " Remove -- INSERT -- or NORMAL ... it's in the status bar now
set clipboard=unnamed   " Use system clipboard
set encoding=utf8       " Set standard file encoding
set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set tabstop=4 "convert tabs to 4 spaces
set shiftwidth=4 "shift/indent also to 4 spaces
set ai"auto indent (pressing enter, will indent)

"check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
set autoread
au CursorHold * checktime

" whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$/ containedin=ALL

" Undefined Marks
highlight UndefinedMarks ctermfg=yellow
autocmd Syntax * syn match UndefinedMarks /???/ containedin=ALL

" Better split character
" Override color scheme to make split them black
" set fillchars=vert:\|
set fillchars=vert:│
set colorcolumn=101
set cursorline
set title
colorscheme space-vim-dark

hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

" Keymaps
let mapleader="\<SPACE>"
nmap <Leader><Leader> <c-^>             " Return to the last file opened
nnoremap <Tab> :bnext!<CR>              " Next Buffer
nnoremap <A-Tab> :bprev!<CR><Paste>     " Previous Buffer
nnoremap <C-t> :sp term://bash<CR>      " Open terminal
nnoremap <C-o> :NERDTreeToggle<CR>      " Open File Director
" nnoremap <C-o> :Vex<CR>               " Open File Director
nnoremap <C-s> :w<CR>                   " Save
nnoremap <C-n> %<CR>                    " New File
nnoremap <C-x> :qa!<CR>                  " Exit
nnoremap <F2> :vsp<CR>                  " Vertical Split
nnoremap <F3> :sp<CR>                   " Horizontal Split

set splitright
nnoremap <leader>s :split<cr>
set splitbelow

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Enable plugins
let g:indentLine_enabled = 1
let g:indentLine_char = "|"
let g:rustfmt_autosave = 1
let g:ale_linters = {'rust': ['rls']}
let g:airline_theme='violet'
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:airline_powerline_fonts = 1
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" If you ever randomly get any errors
" :call dein#clear_state()
" :call dein#recache_runtimepath()
