" File              : 14.vimspector.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 15.07.2020
" Last Modified Date: 15.07.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"set root directory for running commands relative to specified path
let g:asyncrun_rootmarks = ['.git']

"templates
let g:asynctasks_template = {}
let g:asynctasks_template.cpp = [
            \"[project-init]",
            \"command=mkdir -p build && cd build && cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .. && cp compile_commands.json ..",
            \"cwd=<root>",
            \"output=terminal",
            \"",
            \"[project-build]",
            \"command=cmake --build build",
            \"cwd=<root>",
            \"output=terminal",
            \"",
            \"[test-run]",
            \"command=./bin/test.out",
            \"cwd=<root>",
            \"output=terminal",
            \]
