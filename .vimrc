if !empty($MY_RUBY_HOME)
   let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
endif

" pathogen for runtime load of plugins via ~/.vim/bundle
execute pathogen#infect()

filetype plugin indent on
syntax on

augroup myfiletypes
  autocmd!
  autocmd FileType ruby,html setlocal ai sw=2 sts=2 et
  autocmd Filetype javascript,coffee,python setlocal ai sw=4 sts=4 et
augroup END

" Set toggle spelling key
map <F6> :setlocal spell! spelllang=en_us<CR>

" Set toggle line number key
map <F7> :setlocal number!<CR>

" Keep backup and temp files in one place
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Automatically change directory to current file
set autochdir

" Make vim brighten up text for a dark background
""set background=dark

" Unix file format
set fileformats=unix

" Stop those error bells!
set noerrorbells
set visualbell
set t_vb=

" highlight search
set hlsearch

" Open NerdTree with ctrl-N
map <C-n> :NERDTreeToggle<CR>

" ruby-vim auto-completion
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
