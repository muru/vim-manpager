setlocal buftype=nofile
setlocal bufhidden=hide
setlocal noswapfile

setlocal nowrap
setlocal conceallevel=3
setlocal concealcursor=nvic

if exists("b:did_manpager")
	finish
endif
let b:did_manpager = 1
exec "setlocal iskeyword+=\b,_"

if !exists("*s:Man")
	let s:man_stack = []
	function! s:Man(...)
		let l:manpage = a:000[-1]
		if a:0 > 1
			let l:manpage = printf('%s(%s)', a:2, a:1)
		endif
		let l:manbuff = bufnr(l:manpage)
		if l:manbuff > -1
			exe 'b' l:manbuff
			return
		endif

		let l:cmd = ['MAN_KEEP_FORMATTING=1', 'man'] + a:000 
		enew
		call append(line(0), systemlist(join(l:cmd)))
		set ft=man
		call <SID>PrepManPager(l:manpage)
		0
	endfunction

	function! s:CursorMan()
		let l:word = substitute(expand('<cWORD>'), '.\b', '', 'g')
		if winnr('$') == 1
			vnew
		endif
		let l:manpage = matchlist(l:word, '\(\w*\)\((\(\d\w*\))\)\?')
		call <SID>Man(l:manpage[3], l:manpage[1])
	endfunction

	function! s:PrepManPager(man)
		setlocal modifiable
		if !empty(a:man)
			exe "file" a:man
		endif
		setlocal nomodified
		setlocal nomodifiable
	endfunction
endif

autocmd StdinReadPost * call <SID>PrepManPager($MAN_PN)

command -buffer -nargs=+ Man :call <SID>Man(<f-args>)
nnoremap <buffer> q :q!<CR>
nnoremap <buffer> <Space> <PageDown>
nnoremap <buffer> <CR>  :call <SID>CursorMan()<CR>
nnoremap <buffer> K  :call <SID>CursorMan()<CR>
