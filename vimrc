" Kromaĵojn
if has("vim_starting")
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand("~/.vim/bundle/"))

NeoBundleFetch "Shougo/neobundle.vim"

NeoBundle "Shougo/neocomplete"
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/vimfiler"
NeoBundle "Shougo/vimproc.vim", { "build": { "linux": "make" } }
NeoBundle "Yggdroot/indentLine"
NeoBundle "dannyob/quickfixstatus"
NeoBundle "eagletmt/ghcmod-vim"
NeoBundle "itchyny/lightline.vim"
NeoBundle "jceb/vim-hier"
NeoBundle "osyo-manga/vim-watchdogs"
NeoBundle "osyo-manga/shabadou.vim"
NeoBundle "thinca/vim-quickrun"

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" Koloro
syntax on

" Pozicio
set number
set cursorline
set colorcolumn=120

" Aperoj de spacetoj
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%

" Indento
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4

" Manipuli dosierojn
set nobackup
set encoding=utf-8
set fileencodings=utf-8,sjis
set fileformats=unix,dos

" Informoj
set showtabline=2
set laststatus=2

" lightline.vim
let g:lightline = { "colorscheme": "solarized" }

" vim-quickrun
let g:quickrun_config = {
\   "_": {
\       "outputter": "error",
\       "outputter/error/success": "buffer",
\       "outputter/error/error": "quickfix",
\       "outputter/buffer/split": "botright 8sp",
\       "outputter/quickfix/open_cmd": "copen",
\       "runner": "vimproc",
\       "runner/vimproc/updatetime": "50"
\   },
\
\   "cpp/watchdogs_checker": { "type": "watchdogs_checker/clang++" },
\   "d/watchdogs_checker": { "type": "watchdogs_checker/dmd" },
\   "python/watchdogs_checker": { "type": "watchdogs_checker/flake8" },
\
\   "watchdogs_checker/clang++": { "cmdopt": "-Wall -Wextra -std=c++1z" },
\   "watchdogs_checker/dmd": { "cmdopt": "-wi -o- `~/DUBImport/build/dubimport`" }
\ }

let s:hook = { "name": "clear_quickfix", "kind": "hook" }

function! s:hook.on_normalized(session, context)
    call setqflist([])
endfunction

call quickrun#module#register(s:hook, 1)

unlet s:hook

" vim-watchdogs
let g:watchdogs_check_BufWritePost_enable = 1

let g:watchdogs_check_BufWritePost_enables = { "haskell": 0 }

" ghcmod-vim
autocmd BufWritePost *.hs GhcModCheckAndLintAsync

" Ŝlosilaj mapeadoj
map tc :tablast <bar> tabnew <CR>
map tx :tabclose <CR>
map t1 :tabnext 1 <CR>
map t2 :tabnext 2 <CR>
map t3 :tabnext 3 <CR>
map t4 :tabnext 4 <CR>
map t5 :tabnext 5 <CR>
map t6 :tabnext 6 <CR>
map t7 :tabnext 7 <CR>
map t8 :tabnext 8 <CR>
map t9 :tabnext 9 <CR>

noremap <C-E> :VimFilerExplorer <CR>
noremap <C-F> :Unite -buffer-name=file file <CR>
noremap <C-W> <C-W>w
noremap <C-Y> <C-R>
noremap <C-Z> u
