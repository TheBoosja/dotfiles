" Boosja's Neovim configuration

set foldmethod=marker
filetype off

" Plugins directory: ~/.local/share/nvim/plugged
call plug#begin()
Plug 'Mofiqul/vscode.nvim'
Plug 'TheBoosja/vim-bsj'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
" Plug 'plasticboy/vim-markdown'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

filetype plugin indent on

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-css'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

"if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"  let g:coc_global_extensions += ['coc-eslint']
"endif

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

function! ShowDocIfNoDiagnostic(timer_id)
	if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
		silent call CocAction('doHover')
	endif
endfunction

function! s:show_hover_doc()
	call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

let g:airline#extensions#tabline#enabled = 0
let g:airline_theme='term'

let NERDTreeShowHidden=1

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"
colorscheme vscode
set autochdir
set autoindent
set background=dark
set backspace=indent,eol,start
set clipboard=unnamedplus
set cmdheight=2
set completeopt=noinsert,menuone,noselect
set cursorline
set expandtab
set hidden
set laststatus=2
set noshowmode
set nowrap
set path+=**
set scrolloff=2
set shiftwidth=2
set shortmess+=c
set showbreak=\\\
set smartindent
set splitright
set tabstop=2
set title
set ttimeoutlen=0
set updatetime=300
set wildmenu

" Search
set incsearch
set ignorecase
set smartcase

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set number norelativenumber
augroup END

syntax on
set t_Co=256
set t_ut=
set termguicolors

if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=yes
else
  set signcolumn=yes
endif

autocmd VimResized * wincmd =

nnoremap <SPACE> <Nop>
let mapleader = " "
"inoremap <SPACE><SPACE> <Esc>

nnoremap <leader>q :x<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>s :source $MYVIMRC<CR>
nnoremap <leader>a :e $MYVIMRC<CR>

nnoremap <leader>b :buffers<CR>:buffer<SPACE>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<CR>
"nnoremap <silent> <space>s :<C-u>CocList -I symbols<CR>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ CheckBackspace() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Trigger completion
if has('nvim')
  inoremap <silent><expr> <C-SPACE> coc#refresh()
else
  inoremap <silent><expr> <C-@> coc#refresh()
endif

nmap <C-b> :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

