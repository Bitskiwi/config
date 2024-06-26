set mouse=a
syntax on
set number
"set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
"set expandtab
set whichwrap+=<,>,h,l
set backspace=indent,eol,start
set fillchars+=eob:│
set list
set listchars=tab:│• ,trail:•
set cursorline

call plug#begin()



if has('nvim')
	function! UpdateRemotePlugins(...)
	" Needed to refresh runtime files
		let &rtp=&rtp
		UpdateRemotePlugins
	endfunction
	Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
else
	Plug 'gelguy/wilder.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'tc50cal/vim-terminal'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}

call plug#end()

set termguicolors

command ZEN only

call wilder#setup({'modes': [':', '/', '?']})

call wilder#set_option('renderer', wilder#popupmenu_renderer({
	\ 'highlighter': wilder#basic_highlighter(),
	\ 'pumblend': 0,
	\ 'left': [
	\   ' ', wilder#popupmenu_devicons(),
	\ ],
	\ 'right': [
	\   ' ', wilder#popupmenu_scrollbar(),
	\ ],
	\ }))

:colorscheme jellybeans

function! ToggleMouse()
	if &mouse == 'a'
		set mouse=
		echo "mouse Off"
	else
		set mouse=a
		echo "mouse On"
	endif
endfunction

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-b> :TagbarToggle<CR>
nnoremap <C-n> :new<CR>
nnoremap <C-w> :close<CR>
nnoremap <C-m> :call ToggleMouse()<CR>
nnoremap <C-z> :u<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-y> :terminal<CR>

call feedkeys("\<Esc>",'n')
