"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" Some basics:
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber

" Vundle package manager
        set rtp+=~/.vim/bundle/vundle.vim
 	call vundle#begin()
	Plugin 'VundleVim/vundle.vim'

	call vundle#end()

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed)

        vnoremap <C-c> "+y
        map <C-p> "+p

" Open new split panes to right and bottom -unlike vim default
	set splitbelow splitright

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Enter to create a new line below without entering insert mode - Shift+Enter
" for a new line above
	nmap <S-Enter> O<Esc>
	nmap <CR> o<Esc>
