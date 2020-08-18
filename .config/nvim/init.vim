" vim:foldmarker={,}:foldmethod=marker:foldlevel=0

" Vim Plug {
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    call plug#begin()

    " Code Display {
        Plug 'morhetz/gruvbox'
        Plug 'yggdroot/indentline'
    " }

    " Commands {
        Plug 'tpope/vim-commentary'
        Plug '/usr/local/opt/fzf'
        Plug 'junegunn/fzf.vim'
    " }

    " Integrations {
        Plug 'airblade/vim-rooter'
    " }

    " Interface {
        Plug 'vim-airline/vim-airline'
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeFind' }
    " }

    " Language {
        Plug 'sheerun/vim-polyglot'
        Plug 'w0rp/ale'
        Plug 'tpope/vim-rails', { 'for': 'ruby' }
        Plug 'fatih/vim-go', { 'for': 'go' }
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

    set history=1000                      " Store a ton of history
    set backup                            " Turn on backups
    set backupdir=~/.config/nvim/backup// " Set backup folder
    set undofile                          " Turn on persistent undo
    set undodir=~/.config/nvim/undo//     " Set undo folder
    set undolevels=1000                   " Maximum number of changes that can be undone
    set undoreload=10000                  " Maximum number lines to save for undo on a buffer reload
    set directory=~/.config/nvim/swap//   " Set swap folder
    set shada="NONE"                      " Disable shada
" }

" Vim UI {
    " Coloring {
        set termguicolors                 " True color support
        set background=dark               " Dark background
        syntax enable                     " Enable syntax highlighting
        colorscheme gruvbox               " Gruvbox theme
    " }

    " Windowing {
        set splitright                    " Puts new vsplit windows to the right of the current
        set splitbelow                    " Puts new split windows to the bottom of the current
        set scrolljump=7                  " Lines to scroll when cursor leaves screen
        set scrolloff=5                   " Minimum lines to keep above and below cursor
        set tabpagemax=15                 " Only show 15 tabs
        set winminheight=0                " Windows can be 0 line high
    " }

    " Misc {
        set cursorline                    " Highlight current line
        set relativenumber                " Line numbers relative to current line
        set number                        " Line numbers are shown
        set showcmd                       " Show partial commands in status line and Selected characters/lines in visual mode
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
        set foldlevelstart=10           " Most folds open by default
        set foldnestmax=10              " Max level of nested folds
        set list                        " Highlight problematic whitespace
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
        set omnifunc=syntaxcomplete#Complete
        set completeopt=longest,menuone,preview
    " }
" }

" Key (re)Mappings {
    " Remap leader key
    map <Space> <leader>

    " Escape insert mode
    inoremap jk <ESC>

    " This allows esc to return to normal mode in terminal but breaks escaping fzf
    " tnoremap <Esc> <C-\><C-n>

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
    nnoremap <leader>= <C-w>=

    " Easier horizontal scrolling
    nnoremap zl zL
    nnoremap zh zH
" }

" Functions {
  " Open scratch buffer
  nnoremap <leader>s :call Scratch()<CR>
  function Scratch()
    vsplit
    enew
    setlocal noswapfile
    setlocal buflisted
    setlocal buftype=nofile
    setlocal bufhidden=hide
  endfunction
" }

" Autocmds {
    augroup CustomAutoCommands
      autocmd!
      " Auto save on buffer leave and focus loss
      autocmd BufLeave,FocusLost * silent! wa
    augroup END
" }

" Plugins {
    " Ale {
        if isdirectory(expand("~/.config/nvim/plugged/ale"))
          let g:airline#extensions#ale#enabled = 1
          let g:ale_ruby_rubocop_executable = "bin/rubocop"
          let g:ale_fixers = { "*": ["remove_trailing_lines", "trim_whitespace"], "go": ["gofmt", "goimports"] }
          let g:ale_fix_on_save = 1
        endif
    " }

    " NerdTree {
        if isdirectory(expand("~/.config/nvim/plugged/nerdtree"))
          let g:airline#extensions#nerdtree_status = 1
          let NERDTreeShowHidden = 1
          nnoremap <leader>nt :NERDTreeFind<CR>
        endif
    " }

    " Vim-airline {
        if isdirectory(expand("~/.config/nvim/plugged/vim-airline"))
          let g:airline_powerline_fonts = 1
          let g:airline#extensions#tabline#enabled = 1
          let g:airline_section_y = ""
          let g:airline#extensions#tabline#formatter = "unique_tail_improved"
          let g:airline#extensions#tabline#show_tab_type = 0
          let g:airline#extensions#tabline#buffer_idx_mode = 1
          nmap <leader>1 <Plug>AirlineSelectTab1
          nmap <leader>2 <Plug>AirlineSelectTab2
          nmap <leader>3 <Plug>AirlineSelectTab3
          nmap <leader>4 <Plug>AirlineSelectTab4
          nmap <leader>5 <Plug>AirlineSelectTab5
          nmap <leader>6 <Plug>AirlineSelectTab6
          nmap <leader>7 <Plug>AirlineSelectTab7
          nmap <leader>8 <Plug>AirlineSelectTab8
          nmap <leader>9 <Plug>AirlineSelectTab9
        endif
    " }

    " Vim-fzf {
        if isdirectory(expand("~/.config/nvim/plugged/fzf.vim/"))
          let g:fzf_preview_window = ''
          nmap <c-p> :Files<CR>
          nmap <c-f> :Ag<CR>
          nmap <c-n> :Lines<CR>
          nmap <c-b> :BLines<CR>
        endif
    " }

    " Vim-rooter {
        if isdirectory(expand("~/.config/nvim/plugged/vim-rooter"))
          let g:rooter_change_directory_for_non_project_files = "current"
          let g:rooter_silent_chdir = 1
        endif
    " }

    " Vim-go {
        if isdirectory(expand("~/.config/nvim/plugged/vim-go"))
          " Disable autosave functions
          let g:go_fmt_autosave = 0
          let g:go_mod_fmt_autosave = 0
          let g:go_asmfmt_autosave = 0
          let g:go_metalinter_autosave = 0
          let g:go_imports_autosave = 0

          " Enable highlighting
          let g:go_highlight_structs = 1
          let g:go_highlight_interfaces = 1
          let g:go_highlight_types = 1
          let g:go_highlight_fields = 1
          let g:go_highlight_functions = 1
          let g:go_highlight_function_calls = 1
          let g:go_highlight_operators = 1
          let g:go_highlight_extra_types = 1
          let g:go_highlight_build_constraints = 0
          let g:go_highlight_generate_tags = 0

          let g:go_auto_sameids = 1   " Highlight uses of variable
          let g:go_auto_type_info = 1 " Show types in status bar
        endif
    " }
" }
