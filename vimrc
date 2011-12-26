let mapleader = ","
syntax enable
set foldmethod syntax
set ignorecase
set hlsearch
set autoindent
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set ts=2 sts=2 sw=2 expandtab

nnoremap <leader>ev :vs $MYVIMRC<CR>
inoremap <C-l> <space>=><space>
map <leader>p :Hammer<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <leader>rs :!rspec spec<CR>
nnoremap <leader>m :NERDTreeToggle<CR>
nnoremap <leader>gs :Gstatus<CR>

set smartcase
set gdefault
set incsearch
set showmatch

set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

set list
set listchars=tab:▸\ ,eol:¬
set guifont=Menlo:h12
set guioptions=aAc
set guioptions-=Be
set number
set noswapfile
set visualbell

call pathogen#infect()

" match ErrorMsg '\%>80v.\+'
set cc=80

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

set background=dark
colorscheme solarized

".ru files are Ruby.
au BufRead,BufNewFile *.ru setfiletype ruby

".feature files are Cucumber.
au Bufread,BufNewFile *.feature set filetype=gherkin
au! Syntax gherkin source ~/.vim/syntax/cucumber.vim

" Previewheight for Fugitive's status window
set previewheight=20

source $HOME/.vim/settings.vim
