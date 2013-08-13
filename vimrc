let g:author  = "xwuxin"
let g:email   = "xwuxin@xwuxin.com"
let g:company = "Playcrab Corp."

" 鼠标指针当前行显示一条线
set cursorline

" 转到最后一次编辑的地方
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe
	"normal! g'\"" | endif
endif


" 可以在buffer的任何地方使用鼠标(类似office中在工作区双击鼠标定位）
set mouse=a                                                                                                                               
set selection=exclusive
set selectmode=mouse,key

" 不让vim发出讨厌的滴滴声
set noerrorbells 

" 用空格键来开关折叠
set foldenable
set foldmethod=manual

"设置当输入xscript时自动替换为<script type......
ab xscript <script type="text/javascript" >

"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1    

""如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1                                                                                                                  
"在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window = 1 

"加载主要vimrc文件
so  ~/.vim/vimrc-common

" use pathogen for plugins
set nocompatible
filetype off
call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()   "too slow

set runtimepath+=~/vim/bundle/vim_addon_manager
call vam#ActivateAddons(['vim-haxe'], {'auto_install' : 1})

" 支持bundle 下 配置 
call pathogen#infect() 

" 显示行号
set number

" 语法高亮
syntax on

" ctags
set tags+=~/.vim/systags
" plframework
"set tags+=/home/hotel/mywork/plframework/tags
set tags+=./tags

" encoding
"set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-cn,euc-jp,euc-kr,latin1
set termencoding=utf-8
" set fileencoding of new file to utf-8
setglobal fenc=utf-8

"Settings{{
" <TAB> 自动转换为4个空格
"set smarttab
"set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" make and git files use real tabs
autocmd FileType make set noexpandtab
autocmd BufRead,BufNewFile .git* set noexpandtab

" 不创建备份文件
set nobackup

" 搜索时边键入边搜索
set incsearch

" 不使用兼容vi的模式
"set nocompatible
" 设置backspace的工作方式
"set backspace=indent,eol,start   
set autoindent 

let mapleader=";"
" Open and close the NERD_tree.vim separately
map wm :NERDTreeToggle<CR> 
"打开Tlist
"nmap <F8> <ESC>:Tlist<CR> 
nmap <F8> :TagbarToggle<CR>
" 打开当前目录
nnoremap <leader>o :Explore<CR>
"快速打开文件
nnoremap <leader>f :FufFile<CR>
nnoremap <leader>b :FufBuffer<CR>

"快速切换split窗口 
nmap z <C-w><C-w>

"tag快速追踪
nmap tt <C-t>
nmap tg <C-]>


" 在新tab打开当前文件所在的目录
map nt :tabnew %:h<CR>
"tab窗口切换  
nmap <Space>  <Esc>:tabn<CR>

" 选中刚刚粘贴的行
nnoremap <leader>v V`]
" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

" 调用php 检查当前文件的语法
map <F5> :call Execute_Script()<CR>

autocmd FileType javascript set omnifunc=javascrīptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" json
autocmd BufRead,BufNewFile *.json set filetype=yaml

" jasmine fixtures
autocmd BufRead,BufNewFile *.jasmine_fixture set filetype=html

" ruby
autocmd BufRead,BufNewFile *.thor set filetype=ruby
autocmd BufRead,BufNewFile *.god set filetype=ruby
autocmd BufRead,BufNewFile Gemfile* set filetype=ruby
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd BufRead,BufNewFile soloistrc set filetype=ruby
autocmd FileType ruby imap  <Space>=><Space>

" plain text
autocmd BufRead,BufNewFile *.txt set filetype=text
autocmd BufRead,BufNewFile *.text set filetype=text
autocmd BufRead,BufNewFile *README* set filetype=text
autocmd FileType text set autoindent
" sh 
autocmd BufRead,BufNewFile *.sh set filetype=sh

" vimrc被修改时自动重新加载
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost myvimrc source %

" backspace in Visual mode deletes selection
vnoremap <BS> d
" CTRL-X is Cut
vnoremap <C-c> "+x
" CTRL-C is Copy
vnoremap <C-c> "+y
" CTRL-V is Paste
map <C-v> "+gP
cmap <C-v>	<C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" CTRL-Z is Undo; not in cmdline though
"noremap <C-Z> u
"inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-y> <C-R>
inoremap <C-y> <C-O><C-R>

" CTRL-A is Select all
noremap <C-a> gggH<C-O>G
inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-a> <C-C>gggH<C-O>G
onoremap <C-a> <C-C>gggH<C-O>G
snoremap <C-a> <C-C>gggH<C-O>G
xnoremap <C-a> <C-C>ggVG

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
