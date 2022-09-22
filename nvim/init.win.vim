let g:python3_host_prog = $LOCALAPPDATA . '\nvim\neovim\Scripts\python.exe'

set number
set expandtab
set wrapscan
set smartindent
set shiftwidth=4
set wildmenu
set wildmode=longest,full
set cursorline

if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_dir = $HOME . '\.cache\dein'
let s:rc_dir = $LOCALAPPDATA . '\nvim'

" Required:
" set runtimepath+={path to dein.vim directory} 
execute 'set runtimepath+=' . s:dein_dir . '\repos\github.com\Shougo\dein.vim'


if dein#load_state(s:dein_dir)
  " Required:
  call dein#begin(s:dein_dir)

  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif

  let s:toml = s:rc_dir . '\dein.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
"syntax enable
syntax on

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
execute 'source ' . s:rc_dir . '\coc-init.vim'
execute 'source ' . s:rc_dir . '\coc-explorer-init.vim'
