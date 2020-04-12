
" HACK- Probably remove me
"function! g:Nope1()
nnoremap & q
call CountJump#Motion#MakeBracketMotion(
      \ '',
      \ '<Plug>HumpsMotionHead%s',
      \ '<Plug>HumpsMotionTail%s',
      \ '\W\zs\w\|^\zs\w\|\u\|_\zs\a',
      \ '\w\ze\W\|\w\ze$\|\w\ze\u\|\a\ze_',
      \ v:false
\ )
nmap q <Plug>HumpsMotionHeadForward
nmap Q <Plug>HumpsMotionHeadBackward

nmap ]q <Plug>HumpsMotionHeadForward
nmap [q <Plug>HumpsMotionHeadBackward
nmap ]Q <Plug>HumpsMotionTailForward
nmap [Q <Plug>HumpsMotionTailBackward

xmap q <Plug>HumpsMotionHeadForward
xmap Q <Plug>HumpsMotionTailForward

omap q :<C-U>normal vQ<CR>
"endfunction


function! g:HumpJumpToBegin(count, isInner)
      let l:base = '\M\W\zs\w\|^\zs\w\|\u'
      "let l:base = '\M\W\zs\w\|^\zs\w\|\u\|_\zs\[a-z0-9]\*\ze_\|_\[a-z0-9]\*\[^a-z0-9]\|_\[a-z0-9]\*$'
      if a:isInner
            return searchpos(l:base . '\|_\zs\a', 'bcW')
      else
            let l:result = searchpos(l:base .
                              \ '\|_\zs\[a-z0-9]\*\ze_' .
                              \ '\|_\ze\[a-z0-9]\*\[^a-z0-9_]' .
                              \ '\|_\ze\[a-z0-9]\*$',
                              \'bcW')
            "echo "Begin"
            "echo l:result
            return l:result
      endif
endfunction
function! g:HumpJumpToEnd(count, isInner)
      let l:base = '\M\w\ze\W\|\w\ze$\|\w\ze\u\|\w\ze\W\|\.$'
      if a:isInner
            return searchpos(l:base . '\|\w_', 'cW')
      else
            let l:result = searchpos(l:base . '\|\.\zs_', 'cWz')
            "echo "End"
            "echo l:result
            return l:result
      endif
endfunction

"function! g:Nope3()
call CountJump#TextObject#MakeWithJumpFunctions(
                  \ '',
                  \ 'q',
                  \ 'Ia',
                  \ 'v',
                  \ function("g:HumpJumpToBegin"),
                  \ function("g:HumpJumpToEnd")
                  \ )
"endfunction
