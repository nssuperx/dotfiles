if &compatible
  set nocompatible               " Be iMproved
endif

set number
set wrapscan
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set wildmenu
set wildmode=longest,full
set cursorline

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = $HOME . '/.cache/dein'
let s:rc_dir = $HOME . '/.config/nvim'

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif

  let s:toml      = s:rc_dir . '/dein.toml'
  "let s:lazy_toml = s:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  "call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

" coc.nvim Setting
execute 'source ' . s:rc_dir . '/coc-init.vim'
execute 'source ' . s:rc_dir . '/coc-explorer-init.vim'

