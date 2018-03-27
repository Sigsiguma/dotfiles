"setting
"encoding settings
set encoding=utf-8
set fenc=utf-8
set fenc=utf-8

"for using backspace
set backspace=indent,eol,start

"file settings
set nobackup
set autoread
set hidden
set showcmd
set noundofile

"split settings 
set splitbelow
set splitright

"for TrueColor
set termguicolors

"visual 
"show row number 
set number
"highlight row 
set cursorline
"setting moving cursor pos 
set virtualedit=onemore
"Adjust indent 
set smartindent
"show corresponding brackets 
set showmatch
"show status line 
set laststatus=2
" Completion 
set wildmode=list:longest

" TabSettings
set list listchars=tab:\▸\-
set expandtab
set tabstop=4
set shiftwidth=4    

" search settings 
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

"delaytime from insert mode
set timeout timeoutlen=100

"keymaps
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <Space>o :only<CR>
noremap <C-j> <esc>
noremap! <C-j> <esc>
nnoremap j gj
nnoremap k gk

"setting dein install directory 
let s:dein_dir = expand('~/.cache/dein')
"dein repository url 
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

"if not exist dein, clone dein repository 
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

"plugin list directory 
 let s:toml      = '~/.vim/dein.toml'
 let s:lazy_toml = '~/.vim/dein_lazy.toml'

 "start dein 
 if dein#load_state(s:dein_dir)
	 call dein#begin(s:dein_dir)

	 " loading toml files 
	 call dein#load_toml(s:toml,      {'lazy': 0})
	 call dein#load_toml(s:lazy_toml, {'lazy': 1})

	 " end dein
	 call dein#end()
	 call dein#save_state()
 endif

"if not installed plugins, start install 
if dein#check_install()
  call dein#install()
endif

" depends on installed plugins 
filetype plugin indent on
syntax enable
set background=dark
colorscheme molokai
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'
