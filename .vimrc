call plug#begin()
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdtree' |
     \ Plug 'Xuyuanp/nerdtree-git-plugin'|
     \ Plug 'ryanoasis/vim-devicons'
  Plug 'rust-lang/rust.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'dense-analysis/ale'
  Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
call plug#end()

let g:gitgutter_sign_column_always = 1

set encoding=UTF-8

colorscheme gruvbox
set bg=dark

let g:airline_theme = 'base16'

autocmd VimEnter * NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swp$']

set number

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

inoremap <expr> ) getline('.')[col('.')-1] == ')' ? "\<Right>" : ")"
inoremap <expr> ] getline('.')[col('.')-1] == ']' ? "\<Right>" : "]"
inoremap <expr> } getline('.')[col('.')-1] == '}' ? "\<Right>" : "}"
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

nnoremap <C-Right> :vertical resize +2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>

syntax enable
filetype plugin indent on

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

let g:NERDTreeGitStatusUseNerdFonts = 1

command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.json,*.md,*.vue,*.html,*.yaml,*.yml,*.svelte :Prettier


