" from https://vim-jp.org/vim-users-jp/2009/12/27/Hack-112.html
augroup vimrc-local
	autocmd!
	autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
	let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
	for i in reverse(filter(files, 'filereadable(v:val)'))
		source `=i`
	endfor
endfunction

