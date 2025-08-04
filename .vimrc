" Vim-Plug Auto-Installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initialize plugin system
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Basic settings
set number
set laststatus=2
set tabstop=4
set noshowmode
syntax on

" Mouse support
set mouse=a
set mousemodel=popup
set selectmode=mouse

" Gruvbox setup
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" Minimal airline config
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 0
let g:airline_symbols_ascii = 1
let g:airline_section_b = '%{strftime("%H:%M")}'
let g:airline_section_z = '%l:%c'
