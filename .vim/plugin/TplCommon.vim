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

