function! CutString(action,val1,val2)
	if a:action == "match"
		return matchstr(a:val1 , '\S.*$')
	elseif a:action == "sub"
		return substitute(a:val1 , a:val2 , "" , "g")
	endif
endfunction


function! TplSection()
	let currentTxt = getline(".")
	let singleTxt = CutString("match" , currentTxt , "")
	let tabTxt = CutString("sub" , currentTxt , singleTxt)

	call setline(line(".") , tabTxt . '<div class="section">')
	call append(line(".") , tabTxt . '</div>')
	call append(line(".") , tabTxt . '	<p class="section_title">' . singleTxt . '</p>')
endfunction


function! TplComment()
	let currentTxt = getline(".")
	let singleTxt = CutString("match" , currentTxt , "")
	let tabTxt = CutString("sub" , currentTxt , singleTxt)
	
	call setline(line(".") , tabTxt . "{*▼ " . singleTxt . " ▼*}")
	call append(line(".") , tabTxt . "{*▲ " . singleTxt . " ▲*}")
endfunction



function! TplLineComment()
	let currentTxt = getline(".")
	let singleTxt = CutString("match" , currentTxt , "")
	let tabTxt = CutString("sub" , currentTxt , singleTxt)
	
	call setline(line(".") , tabTxt . "{* " . singleTxt . " *}")
endfunction


function! TplMemo()
	let memopath = expand("%:p")
	let inputfile = "/Users/yito1/Documents/vim/memo.txt"
	let outputfile = "/Users/yito1/Documents/vim/memo.txt"
	let flg = 0

	for line in readfile(inputfile)
		if line == memopath
			let flg = 1
		endif
	endfor

	if flg == 1
		echo "既に書き込み済み"
	else
		execute  ":redir! >> " . outputfile
			silent! echon memopath . "\n"
		redir END
	endif

endfunction

command! -nargs=0 Memo call TplMemo()


function! TplVfDiff()
	let tarPathInfo = vimfiler#get_another_vimfiler()
	let tarPath = tarPathInfo.current_dir
	if (tarPath != "")
		let nowPathInfo = vimfiler#get_marked_files()
		let diffFileName = nowPathInfo[0].vimfiler__filename
		let tarPath1 = vimfiler#get_marked_filenames()
		let tarPath2 = tarPathInfo.current_dir . diffFileName

		echo tarPath1[0] . " diff " . tarPath2
		:tabnew<CR>
		call DirDiff(tarPath1[0] , tarPath2)

	endif
endfunction

command! -nargs=0 TplVfDiff call TplVfDiff()


function! NewMbgaMixi()
	:tabnew<CR>
	:VimShell ~/Documents/svn/RAGNA_MIXI/MIXI__DEV__/xragnarok/
	:sp
	<ESC><S-R><S-S><CR>
	:<TAB>
endfunction


command! -nargs=0 NewMbgaMixi call NewMbgaMixi()














