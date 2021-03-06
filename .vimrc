set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/UltiSnips
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"Managed by Vundle

Plugin 'tpope/vim-fugitive.git'
Plugin 'MarcWeber/vim-addon-mw-utils.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'bling/vim-airline.git'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'docunext/closetag.vim.git'
Plugin 'powerline/fonts.git'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'jonathanfilip/vim-lucius.git'
Plugin 'Rykka/colorv.vim'
Plugin 'mattn/webapi-vim'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()

filetype plugin indent on

"Vim Native Settings
set t_Co=256
set relativenumber
set number
set ruler
set wildmenu
set ai
set si
set wrap
set ignorecase
set hlsearch
set showmatch
set nobackup
set nowb
set noswapfile
set autoread
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
"set foldmethod=syntax
"set foldlevelstart=2
syntax enable
"filetype plugin on
"filetype indent on
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab

"Remember info about open buffers on close
set viminfo^=%

"Persistant folding
"au BufWrite ?* mkview
"au BufRead ?* silent loadview

"Set default Netrw to tree view
let g:netrw_liststyle=3

"Colorscheme
set background=light
colorscheme ron

" Return to last edit position when opening files ()
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"Custom Key-Bindings

"Remap leader to ,
let mapleader=","

"Leader b BufOnly (delete all buffers except the current one)
noremap <silent> <leader>b		:BufOnly<CR>
vnoremap <silent> <leader>b		:Bufonly<CR>
inoremap <silent> <leader>b		:BufOnly<CR>

"Leader e map to :E
noremap <silent> <leader>e		:E<CR>
vnoremap <silent> <leader>e		:E<CR>
inoremap <silent> <leader>e		:E<CR>

"save session(reopen with vim -S) this will save all tabs and or splits etc.
nnoremap <leader>m :mksession!<CR>

"source .vimrc with leader-v
noremap <silent> <leader>v		:source ~/.vimrc<CR>
vnoremap <silent> <leader>v		:source ~/.vimrc<CR>
inoremap <silent> <leader>v		:source ~/.vimrc<CR>

"ctrl-s to save
noremap <silent> <C-S>		:update<CR>
vnoremap <silent> <C-S>		<C-C>:update<CR>
inoremap <silent> <C-S>		<C-O>:update<CR>

"leader-n to turn off search hightlights
noremap <silent> <leader>n		:nohlsearch<CR>
vnoremap <silent> <leader>n		:nohlsearch<CR>
inoremap <silent> <leader>n		:nohlsearch<CR>

"leader-2 to switch to solid background
noremap <silent> <leader>2		:colorschem lucius<CR>
vnoremap <silent> <leader>2		:colorschem lucius<CR>
inoremap <silent> <leader>2		:colorschem lucius<CR>	

"leader-1 to switch to transparent background
noremap <silent> <leader>1		:colorschem ron<CR>
vnoremap <silent> <leader>1		:colorschem ron<CR>
inoremap <silent> <leader>1		:colorschem ron<CR>	


"leader-a to envoke saveas
noremap <silent> <leader>a		:saveas
vnoremap <silent> <leader>a		:saveas
inoremap <silent> <leader>a		:saveas	


"make buffers act like tabs
set hidden
nmap <leader>t :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>w :bp <BAR> bd #<CR>

"Ultisnips/YouCompleteMe/SuperTab setting
" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-b>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-y>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:UltiSnipsSnippetDir = '/home/jason/UltiSnips'

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"Airline settings
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='cool'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod = ':t'

"Ctrlp settings
let g:ctrlp_by_filename=1
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode='ra'
let g:crtlp_clear_cache_on_exit=0
set wildignore+=*.png,*.gif,*.jpg,*/tmp/*,*.so,*.swp,*.zip,*.tar,*.gz,~/downloads/*,~/purgatory/*,~/graphics/*,~/pictures/*,~/videos/*,~/music/*

"Custom commands
command Post  :1 | :.-1read ~/.vim/post | :cal cursor(3,0) | :j | :w | :!ssmtp fuwa174yese@post.wordpress.com <'%:p'


