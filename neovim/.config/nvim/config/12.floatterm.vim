" File              : 12.floatterm.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 13.06.2020
" Last Modified Date: 13.06.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

let g:floaterm_wintype='floating'
let g:floaterm_width=0.6
let g:floaterm_height=0.7
let g:floaterm_position='topright'
let g:floaterm_rootmarkers=['.git','.task']

"function! s:runner_proc(opts)
  "let curr_bufnr = floaterm#curr()
  "if has_key(a:opts, 'silent') && a:opts.silent == 1
    "call floaterm#hide(1, '')
  "endif
  "let cmd = 'cd ' . shellescape(getcwd())
  "call floaterm#terminal#send(curr_bufnr, [cmd])
  "call floaterm#terminal#send(curr_bufnr, [a:opts.cmd])
  "stopinsert
  "if &filetype == 'floaterm' && g:floaterm_autoinsert
    "call floaterm#util#startinsert()
  "endif
"endfunction

"let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
"let g:asyncrun_runner.floaterm = function('s:runner_proc')
