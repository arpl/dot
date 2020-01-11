" Install Vim Plug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

augroup RemoveTrailingWhiteChars
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup end

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin()
  Plug 'morhetz/gruvbox'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-sensible'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'w0rp/ale'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'stefandtw/quickfix-reflector.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'ianks/vim-tsx'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-surround'
call plug#end()

set number
set relativenumber
set nowrap
set hlsearch
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set hidden
set confirm
set foldmethod=indent
set foldlevel=99
set wildignorecase
set ignorecase
set termguicolors
set mouse+=a

" FZF trickery
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --hidden --follow --glob "!.git/*" --color "always" '.<q-args>, 1, <bang>0)

let g:airline#extensions#tabline#enabled = 1

let g:ale_linters_explicit = 1
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'typescript': ['eslint']
      \}

let g:ale_fixers= {
      \   'javascript': ['prettier'],
      \   'typescript': ['prettier']
      \}

let g:ale_open_list = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✖'

" Highlight active window cursorline
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

xnoremap p pgvy
nnoremap <leader><space> za
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fs :Find<space>
nnoremap <leader>e :noh<cr>:<backspace>
nnoremap <leader>n :NERDTreeFind<cr>

nnoremap <c-p> :bprevious<cr>
nnoremap <c-n> :bnext<cr>

nnoremap <silent> <leader>d :bprevious\|bd#<cr>

noremap  <c-j> :cnext<cr>
noremap  <c-k> :cprev<cr>

colors gruvbox
colors custom

source ~/.config/nvim/settings/coc.vim
