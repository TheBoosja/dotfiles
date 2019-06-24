" =========================================== "
" ======[ Master Boosja's vimrc file ]======= "
" ====[ http://www.github.com/TheBoosja ]==== "
" =========================================== "

set foldmethod=marker
filetype off

" ==[ PLUGINS ]== {{{"

call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'tomasiser/vim-code-dark'		" Color scheme
Plug 'tpope/vim-commentary'			" gcc
Plug 'tpope/vim-fugitive'			" Git
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'		" Increment datetimes
Plug 'tpope/vim-surround'
Plug 'vim-scripts/Wombat'			" Color scheme
Plug 'w0rp/ale'						" Linting

call plug#end()

filetype plugin indent on

set laststatus=2
set noshowmode

let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\	'left': [ [ 'mode', 'paste' ],
	\		[ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\ 	'gitbranch': 'fugitive#head'
	\ },
	\ }

" }}}
" ==[ SETTINGS ]== {{{"

set encoding=utf-8
if !exists("g:syntax_on")
	syntax enable
endif
set t_Co=256
set t_ut=
colorscheme codedark

augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set number norelativenumber
augroup END

augroup TxtFile
	autocmd!
	autocmd FileType text setlocal wrap
augroup END

" System
set wildmenu		" :autocomplete
set path+=**		" recursive path
set splitright		" split to right
set autoread		" on ext change, autoread file
set scrolloff=2		" scroll 5 lines from top/bottom
set cursorline		" show cursorline
set autochdir		" change working dir to curr file
set showbreak=\\\
set backspace=indent,eol,start 	" Allow deleting indent and line breaks
set nowrap
" set directory=$HOME/vimfiles/tmp//
autocmd VimResized * wincmd =	" resizes splits on drag

" Search
set incsearch
set ignorecase
set smartcase

" " Session
" set sessionoptions+=resize,winpos
" autocmd VimEnter * :source $HOME/vimfiles/session.vim
" autocmd VimLeave * :mksession! $HOME/vimfiles/session.vim

" Indentation
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

" netrw
nnoremap <leader>o :Vexplore<CR>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 0

" 81st column
highlight ColorColumn ctermbg=black
call matchadd('ColorColumn', '\%81v', 100)

" }}}
" ==[ MAPPINGS ]== {{{"

" Remap <leader>
let mapleader = "\<Space>"

nnoremap <leader>rv :write<CR>:source $MYVIMRC<CR>
nnoremap <leader>av :call OpenVimrc()<CR>
function! OpenVimrc() abort
	if line('$') == 1 && getline(1) == ''  " if not empty, new tab
		:edit $MYVIMRC
	else
		:vsplit $MYVIMRC
	endif
endfunction

" System
nnoremap <leader>w :write<CR>|		" Write file
nnoremap <leader>q :xit<CR>|		" Quit/SaveQuit file
nnoremap - :|						" Command Mode
nnoremap <leader>c <C-W><C-W>|  	" Cycle through windows

" Tabs
nnoremap <leader>n :tabnew
nnoremap <leader>x :tabclose<CR>
nnoremap <leader>h :tabfirst<CR>
nnoremap <leader>j :tabnext<CR>
nnoremap <leader>k :tabprev<CR>
nnoremap <leader>l :tablast<CR>

" Braces & Quotes
inoremap {<CR> {<CR><BS>}<Esc>O
inoremap (<CR> (<CR><BS>)<Esc>O
inoremap [<CR> [<CR><BS>]<Esc>O
" inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

nnoremap , ;|		" f/F next
nnoremap ; ,|		" f/F prev
nnoremap n nzz|		" center next match

" }}}
