
runtime! debian.vim

"自动语法高亮
if has("syntax")
  syntax on
endif

"编码设置
let &termencoding=&encoding
set fileencodings=utf-8,bgk,ucs-bom,cp936
"set fileencoding=cp936

"设置显示光标线
set cursorline

"设置主题
colorscheme white

set tabstop=4				"设置tab空格数
set shiftwidth=4			" 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4

"分割窗口时保持相等的宽/高
set equalalways            

"设置冒号命令和搜索命令的命令历史列表的长度
set history=1000            

"自动切换当前目录为当前文件所在的目录
set autochdir

set autoindent              " 开启自动缩进
set smartindent             " 开启新行时使用智能自动缩进
set smarttab                " 开启新行时使用智能 tab 缩进

let g:winManagerWindowLayout='FileExplorer,TagList'

"let g:winManagerWindowLayout='FileExplorer'
"设置打开窗口的快捷键
nmap wm :WMToggle<cr>
let g:miniBufExplMapWindowNavVim = 1

"let mapleader="x"
"map <Leader>m :%s//\r/g<cr>

"总是显示状态行
set laststatus=2

"设置高亮搜索
set hlsearch

"输入字符串就显示匹配点
set incsearch

"输入的命令显示出来
set showcmd

"显示行号
set number

"显示当前位置
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

"忽略大小写
set ignorecase		" Do case insensitive matching

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 不让vim发出讨厌的滴滴声
set noerrorbells

" 用空格键来开关折叠
set foldenable
set foldmethod=manual

set autoread 
nnoremap  @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')

"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1    

"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1

"在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window = 1 

"设置当输入xscript时自动替换为<script type......
ab xscript <script type="text/javascript" >

"Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" 设定默认解码
"set fenc=utf-8
"set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

" 输入:set list命令是应该显示些啥？
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
