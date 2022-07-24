" Boosja's Neovim configuration

filetype off

" Plugins directory: ~/.local/share/nvim/plugged
call plug#begin()
Plug 'tomasiser/vim-code-dark'
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

" filetype: enables filetype detection
" plugin: loads filetype's plugins
" indent: loads filetype's indentation
filetype plugin indent on

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-css'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Syntax highlighting of whole file
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

" Show hover info of symbol (documentation)
autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

let g:airline#extensions#tabline#enabled = 0
let g:airline_theme='codedark'

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Use .gitignore when fuzzy finding
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"
set background=dark
colorscheme codedark
" Change working directory when opening a file
"set autochdir
" Auto indents new lines
set autoindent
" Deletes tabs or spaces as you would expect
set backspace=indent,eol,start
" Access system clipboard in vim
set clipboard+=unnamedplus
" Command height set to 2 lines
set cmdheight=2
" Intellisence completion
" noinsert: Don't auto insert option in popup
" noselect: Don't auto select option in popup
" menuone: Show popup even with only one option
set completeopt=noinsert,menuone
"set completeopt=noinsert,menuone,noselect
" Highlights current line
set cursorline
" Inserts appropriate number of spaces in tab
set expandtab
" Buffers are hidden when left, instead off closed entirely
set hidden
" Always displays a status line in window
set laststatus=2
" Something with Replace and Visual mode in Insert mode
set noshowmode
" Don't wrap text
set nowrap
" Pattern when searching for files
set path+=**
" Line padding in top,bottom of file
set scrolloff=3
" Current line always in center
"set scrolloff=999
" Number of spaces per tab
set shiftwidth=2
" Short messages of 'commands'
set shortmess+=c
" String to put in front of wrapped lines
set showbreak=\\\
" Auto indentation, requires autoindent
set smartindent
" Split window to the right
set splitright
" Number of spaces a tab counts for
set tabstop=2
" Sets title of window
set title
" Timeout to wait for command to complete
set ttimeoutlen=0
" ms before swap file is written to disk
set updatetime=300
" Something to do with popup menu
set wildmenu
" GUI colors in terminal
set termguicolors
" Always display signcolumn (changes,errors,etc)
set signcolumn=yes


" Search
set incsearch
set ignorecase
set smartcase

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set number norelativenumber
augroup END

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
