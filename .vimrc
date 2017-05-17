" Vim Plug {
    call plug#begin()

    " Code Display {
        Plug 'NLKNguyen/papercolor-theme'
        Plug 'yggdroot/indentline'
    " }

    " Commands {
        Plug 'tpope/vim-commentary'
        Plug '/usr/local/opt/fzf'
        Plug 'junegunn/fzf.vim'
    " }

    " Completion {
        Plug 'ervandew/supertab'
    " }

    " Integrations {
        Plug 'airblade/vim-rooter'
        Plug 'janko-m/vim-test', { 'for': 'ruby' }
    " }

    " Interface {
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeFind' }
    " }

    " Language {
        Plug 'sheerun/vim-polyglot'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-rails', { 'for': 'ruby' }
        Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
    " }

    call plug#end()
" }

" General {
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    set clipboard+=unnamedplus  " Use system clipboard

    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator

    set history=1000                      " Store a ton of history (default is 20)
    set backup                            " Backups are nice ...
    set backupdir=~/.config/nvim/backup// " Set backup folder
    set undofile                          " So is persistent undo ...
    set undodir=~/.config/nvim/undo//     " Set undo folder
    set undolevels=1000                   " Maximum number of changes that can be undone
    set undoreload=10000                  " Maximum number lines to save for undo on a buffer reload
    set directory=~/.config/nvim/swap//   " Set swap folder
" }

" Vim UI {
    " Coloring {
        set termguicolors                       " True color support
        set background=light                    " Assume a light background
        colorscheme PaperColor                  " PaperColor theme
        highlight Folded gui=bold guibg=none    " Remove background from folds
    " }

    " Windowing {
        set splitright                      " Puts new vsplit windows to the right of the current
        set splitbelow                      " Puts new split windows to the bottom of the current
        set scrolljump=7                    " Lines to scroll when cursor leaves screen
        set scrolloff=5                     " Minimum lines to keep above and below cursor
        set tabpagemax=15                   " Only show 15 tabs
        set winminheight=0                  " Windows can be 0 line high
    " }

    " Misc {
        set cursorline                      " Highlight current line
        set relativenumber                  " Line numbers relative to current line
        set number                          " Line numbers are shown
        set showcmd                         " Show partial commands in status line and Selected characters/lines in visual mode
    " }
" }

" Code {
    " Style {
        set linespace=0                 " No extra spaces between rows
        set nowrap                      " Do not wrap long lines
        set autoindent                  " Indent at the same level of the previous line
        set shiftwidth=2                " Use indents of two spaces
        set expandtab                   " Tabs are spaces, not tabs
        set tabstop=2                   " An indentation every two columns
        set softtabstop=2               " Let backspace delete indent
        set foldenable                  " Auto fold code
        set foldmethod=indent           " Fold code based on indents
        set foldnestmax=10              " Max level of nested folds
        set list
        set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
    " }

    " Behaviour {
        set backspace=indent,eol,start  " Backspace for dummies
        set incsearch                   " Find as you type search
        set hlsearch                    " Highlight search terms
        set ignorecase                  " Case insensitive search
        set smartcase                   " Case sensitive when upper case present
        set showmatch                   " Show matching brackets/parenthesis
        set wildmenu                    " Show list instead of just completing
        set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
        set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
        set nojoinspaces                " Prevents inserting two spaces after punctuation on a join
        set pastetoggle=<F12>           " Sane indentation on pastes
        set omnifunc=syntaxcomplete#Complete
        set completeopt=menu,preview,longest
    " }
" }

" Key (re)Mappings {
    " Remap leader key
    map <Space> <leader>

    " Escape insert mode
    inoremap jk <ESC>

    " Easier moving between tabs and windows
    nnoremap <C-J> <C-W>j<C-W><ESC>
    nnoremap <C-K> <C-W>k<C-W><ESC>
    nnoremap <C-L> <C-W>l<C-W><ESC>
    nnoremap <C-H> <C-W>h<C-W><ESC>

    " Easier moving between buffers
    nnoremap <S-L> :bnext<CR>
    nnoremap <S-H> :bprevious<CR>

    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

    " Close buffer but not split it was in
    nnoremap zz :bp! <BAR> bd! #<CR>

    " User Commands
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
    cnoremap Tabe tabe

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Disable ex mode
    nnoremap Q <Nop>

    " Quit instead of going to command history
    nnoremap q: :q

    " Code folding
    nnoremap <leader><Space> za

    " Toggle search highlighting rather than clear the current search results
    nnoremap <silent> <leader>/ :nohlsearch<CR>

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection
    vnoremap . :normal .<CR>

    " Really Write the file.
    cnoremap w!! w !sudo tee % >/dev/null

    " Adjust views to the same size
    nnoremap <Leader>= <C-w>=

    " Easier horizontal scrolling
    nnoremap zl zL
    nnoremap zh zH
" }

" Autocmds {
    augroup CustomAutoCommands
      autocmd!

      " Remove trailing white space and ^M chars
      autocmd BufWritePre * call StripTrailingWhitespace()

      " Auto save on buffer leave and focus loss
      autocmd BufLeave,FocusLost * silent! wa

      " Supertab completion chaining
      autocmd FileType * if &omnifunc != '' | call SuperTabChain(&omnifunc, "<c-p>") | endif

    augroup END
" }

" Plugins {
    " NerdTree {
        if isdirectory(expand("~/.config/nvim/plugged/nerdtree"))
          let NERDTreeShowHidden=1
          nnoremap <leader>nt :NERDTreeFind<CR>
        endif
    " }

    " Supertab {
        if isdirectory(expand("~/.config/nvim/plugged/supertab"))
          let g:SuperTabDefaultCompletionType = "context"
          let g:SuperTabLongestEnhanced = 1
          let g:SuperTabLongestHighlight = 1
        endif
    " }

    " Vim-airline {
        if isdirectory(expand("~/.config/nvim/plugged/vim-airline"))
          let g:airline_powerline_fonts = 1
          let g:airline_theme = 'papercolor'
          let g:airline#extensions#tabline#enabled = 1
        endif
    " }

    " Vim-fzf {
        if isdirectory(expand("~/.config/nvim/plugged/fzf.vim/"))
          nmap <c-p> :FZF<CR>
        endif
    " }

    " Vim-rooter {
        if isdirectory(expand("~/.config/nvim/plugged/vim-rooter"))
          let g:rooter_disable_map = 1
          let g:rooter_change_directory_for_non_project_files = 1
          let g:rooter_silent_chdir = 1
        endif
    " }

    " Vim-ruby {
        if isdirectory(expand("~/.config/nvim/plugged/vim-ruby"))
          let g:rubycomplete_buffer_loading = 1
          let g:rubycomplete_rails = 1
          let g:rubycomplete_load_gemfile = 1
          let ruby_operators = 1
        endif
    " }

    " Vim-test {
        if isdirectory(expand("~/.config/nvim/plugged/vim-test/"))
          let test#strategy = "neovim"
          nnoremap <silent> <leader>t :TestNearest<CR>
          nnoremap <silent> <leader>T :TestFile<CR>
          nnoremap <silent> <leader>a :TestSuite<CR>
          nnoremap <silent> <leader>l :TestLast<CR>
          nnoremap <silent> <leader>g :TestVisit<CR>
        endif
    " }
" }

" Functions {
    " Strip whitespace {
        function! StripTrailingWhitespace()
          let _s=@/
          let l = line(".")
          let c = col(".")
          %s/\s\+$//e
          let @/=_s
          call cursor(l, c)
        endfunction
    " }
" }
