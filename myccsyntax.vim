echo "my-ccsyntax.vim"
if !exists('*CoffeesynCHK')
	function! CoffeesynCHK()
		ccl
		let winnum = winnr() " get current window number
		let linenum = line('.')
		let colnum = col('.')
		let cmd =  "%!coffee -c -s  | sed 's/^/".substitute(bufname("%"), '/', '\\/', "g")."/g' >~/.vimerr; cat"
		"echo cmd
		silent execute cmd
		silent cf ~/.vimerr
		cw 
		" open the error window if it contains error
		" return to the window with cursor set on the line of the first error (if any)
		execute winnum . "wincmd w"
		silent undo
		silent cf
		if 0 >= len(getqflist())
			w
			call cursor(linenum, colnum)
			"echo "no error"
		else
			echo "error" 
			"!cat  .vimerr 
		endif
	endfunction
endif

if !exists('*JSsynCHK')
	function! JSsynCHK()
		ccl
		let winnum = winnr() " get current window number
		let linenum = line('.')
		let colnum = col('.')
		let cmd =  "%!jsl -nologo -nofilelisting -nosummary -nocontext -conf ~/bin/jsl.conf -stdin | sed 's/^/".substitute(bufname("%"), '/', '\\/', "g")."/g' >~/.vimerr; cat"
		"echo cmd
		silent execute cmd
		silent cf ~/.vimerr

		cw 
		" open the error window if it contains error
		" return to the window with cursor set on the line of the first error (if any)
		execute winnum . "wincmd w"
		silent undo
		silent cf
		if 0 >= len(getqflist())
			w
			call cursor(linenum, colnum)
			"echo "no error"
		else
			echo "error" 
			"!cat  .vimerr 
		endif
	endfunction
endif

if !exists('*PHPsynCHK')
	function! PHPsynCHK()
		ccl
		let winnum = winnr() " get current window number
		let linenum = line('.')
		let colnum = col('.')
		let cmd="%!php -l -f /dev/stdin | sed 's/\\/dev\\/stdin/".substitute(bufname("%"), '/', '\\/', "g")."/g' > ~/.vimerr; cat"
		"echo cmd

		silent execute cmd
		silent cf ~/.vimerr
		cw 
		" open the error window if it contains error
		" return to the window with cursor set on the line of the first error (if any)
		execute winnum . "wincmd w"
		silent undo
		silent cf
		if 1 == len(getqflist())
			w
			call cursor(linenum, colnum)
			"echo "no error"
		else
			"echo "error" 
		endif
	endfunction
endif
function! Check_Syntax()
	if &filetype == 'php'
		:w
		:call PHPsynCHK()
	elseif &filetype == 'javascript'
		:w
		:call JSsynCHK()
	elseif &filetype == 'sh'
		:w
		execute '!bash -x %'
	elseif &filetype == 'coffee'
		:w
		:call CoffeesynCHK()
	endif
endfunction
au!  BufWriteCmd  *     call Check_Syntax()
