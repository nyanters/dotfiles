" https://zenn.dev/vim_jp/articles/4564e6e5c2866d
setlocal comments=b:*,b:-,b:+,b:1.,nb:>
setlocal formatoptions-=c formatoptions+=jro

setlocal comments=nb:>
        \ comments+=b:-\ [\ ],b:-\ [x],b:-
        \ comments+=b:1.\ [\ ],b:1.\ [x],b:1.
        \ formatoptions-=c formatoptions+=jro

function! s:markdown_checkbox(from, to) abort
  let from = a:from
  let to = a:to

  let another = line('v')
  if from == to && from != another
    if another < from
      let from = another
    else
      let to = another
    endif
  endif

  let curpos = getcursorcharpos()

  let lnum = from
  while lnum <= to
    let line = getline(lnum)

    let list_pattern = '\v^\s*([*+-]|\d+\.)\s+'
    if line !~ list_pattern
      " not list -> add list marker and blank box
      let line = substitute(line, '\v\S|$', '- [ ] \0', '')
      if lnum == curpos[1]
        let curpos[2] += 6
      endif
    elseif line =~ list_pattern .. '\[ \]\s+'
      " blank box -> check
      let line = substitute(line, '\[ \]', '[x]', '')
    elseif line =~ list_pattern .. '\[x\]\s+'
      " checked box -> uncheck
      let line = substitute(line, '\[x\]', '[ ]', '')
    else
      " list but no box -> add box after list marker
      let line = substitute(line, '\v\S+', '\0 [ ]', '')
      if lnum == curpos[1]
        let curpos[2] += 4
      endif
    endif

    call setline(lnum, line)
    let lnum += 1
  endwhile
  call setcursorcharpos(curpos[1], curpos[2])
endfunction
command! -buffer -range MarkdownCheckbox call s:markdown_checkbox(<line1>, <line2>)

nnoremap <buffer> <C-CR> <Cmd>MarkdownCheckbox<CR>
inoremap <buffer> <C-CR> <Cmd>MarkdownCheckbox<CR>
xnoremap <buffer> <C-CR> <Cmd>MarkdownCheckbox<CR>
