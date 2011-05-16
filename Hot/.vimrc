syntax enable " Syntax highlighting FTW
"set nowrap " Don't wrap lines
colorscheme zellner " This works good with my terminal 
"set mouse=a " Enable mouse
set tabstop=4 " Tab = 4 spaces
set showmatch " Show matching brackets
set shiftwidth=4 " Autoindent width = 4 spaces
set number " Show line numbers
set smartcase " Ignore case if lowercase, case-sensitive otherwise
set hlsearch " Highlight search items
set incsearch " Show search items as you type
set title " Sets the terminal title
set history=1000 " remember more in history
set undolevels=1000 " More undo
cmap w!! w !sudo tee % >/dev/null " For those times you forget sudo
nmap ,n :NERDTreeToggle<CR> " NERDTree

" Status Line
set laststatus=2
set statusline=%y\ %<%F%m%r%=%P
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif


" Auto indent according to the detected filetype.
"set autoindent " Autoindenting on
if has("autocmd")
filetype plugin indent on
endif

" Don't backup stuff, it's annoying
set nobackup
set nowritebackup
