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

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed)

        vnoremap <C-c> "+y
        map <C-p> "+p

" Open new split panes to right and bottom -unlike vim default
	set splitbelow splitright

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e
