" ==========================================
" ================ Plugins =================
" ==========================================
call plug#begin()
Plug 'nanotech/jellybeans.vim'
Plug 'sheerun/vim-polyglot'
Plug 'kaarmu/typst.vim'

Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'Chiel92/vim-autoformat'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()


" ==========================================
" =============== General ==================
" ==========================================
set nocompatible
set noerrorbells
set noswapfile
set vb t_vb=
set updatetime=300
set backspace=indent,eol,start
set foldmethod=syntax
set background=dark
set ts=4 sw=4
set number relativenumber
set laststatus=2
set autochdir
set autoread
set mouse=a
set ignorecase smartcase
set scrolloff=3

set guifont=MonoLisa:h16
set gcr=a:blinkon0

let mapleader = " "
filetype plugin on
colorscheme jellybeans


" ==========================================
" ============== UI Settings ===============
" ==========================================
highlight SignColumn guibg=NONE ctermbg=NONE
let g:lightline = { 'colorscheme': 'jellybeans' }


" ==========================================
" ============== Movement ==================
" ==========================================
nnoremap gh 0
nnoremap gl $
noremap <TAB> %

" Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Indent
nnoremap <A-h> <<
nnoremap <A-l> >>
vnoremap <A-h> <gv
vnoremap <A-l> >gv

" Window movement (insert mode)
" nnoremap <C-h> <Esc><C-w>h
" nnoremap <C-j> <Esc><C-w>j
" nnoremap <C-k> <Esc><C-w>k
" nnoremap <C-l> <Esc><C-w>l


" ==========================================
" ============== Buffers/Tabs ==============
" ==========================================
noremap [b :bp<CR>
noremap ]b :bn<CR>
nnoremap H :bprevious<CR>
nnoremap L :bnext<CR>
noremap [t :tabprevious<CR>
noremap ]t :tabnext<CR>


" ==========================================
" ============== FZF & Files ===============
" ==========================================
noremap <leader><space> :Files<CR>
noremap <leader>fb :Buffers<CR>
noremap <leader>e :Explore<CR>

" ==========================================
" ============== Buffer Actions ============
" ==========================================
noremap <leader>bd :bd<CR>
noremap <leader>bD :bd!<CR>
noremap <leader>va ggVG


" ==========================================
" ============== C++ Compile ===============
" ==========================================

noremap <leader>r1 :!mkdir -p executables && g++-15 -std=c++20 -O2 -Wall -o executables/%< % && timeout 1s ./executables/%< < inp <CR>
noremap <leader>r2 :!g++-15 -std=c++20 -O2 -Wall -o %< % && timeout 1s ./%<<CR>


" ==========================================
" ============== Formatting ================
" ==========================================

" ---- clang-format ----
let g:formatdef_clangformat = '"clang-format"'
let g:formatters_cpp = ['clangformat']
let g:formatters_c   = ['clangformat']

let g:formatdef_typstyle = '"typstyle"'
let g:formatters_typst = ['typstyle']
let g:formatters_typ   = ['typstyle']

" ---- asmfmt ----
let g:formatdef_asmfmt = '"asmfmt"'
let g:formatters_asm = ['asmfmt']
let g:formatters_s   = ['asmfmt']

autocmd BufRead,BufNewFile *.s set filetype=asm

" Manual format key
noremap <leader>fk :Autoformat<CR>


" ==========================================
" ================== Coc ===================
" ==========================================

let g:coc_global_extensions = ['coc-clangd']

" Diagnostics
nmap <silent><nowait> [d <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]d <Plug>(coc-diagnostic-next)

" Navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Code actions
nmap <leader>cr <Plug>(coc-rename)
nmap <leader>cf <Plug>(coc-fix-current)
nmap <leader>cl <Plug>(coc-codelens-action)
nmap <leader>ca <Plug>(coc-codeaction-cursor)
nmap <leader>cA <Plug>(coc-codeaction-source)
nmap <leader>cR <Plug>(coc-codeaction-refactor)

" Lists
nnoremap <leader>sd :<C-u>CocList diagnostics<CR>
nnoremap <leader>se :<C-u>CocList extensions<CR>
nnoremap <leader>sc :<C-u>CocList commands<CR>
nnoremap <leader>so :<C-u>CocList outline<CR>
nnoremap <leader>ss :<C-u>CocList -I symbols<CR>
nnoremap <leader>sn :<C-u>CocNext<CR>
nnoremap <leader>sp :<C-u>CocPrev<CR>
nnoremap <leader>sr :<C-u>CocListResume<CR>

" Format via Coc
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold   :call CocAction('fold', <f-args>)
command! -nargs=0 OR     :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Hover documentation
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd BufNewFile,BufRead *.typ set filetype=typst
