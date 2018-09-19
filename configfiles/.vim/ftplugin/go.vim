" ----------------------------------------------------------------- "
" -V----------V--- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---V----------V- "
" ---------------- S       A     A G       E       ---------------- "
" -I----------I--- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---I----------I- "
" ----------------       S A     A G     G E       ---------------- "
" -M----------M--- SSSSSSS A     A GGGGGGG EEEEEEE ---M----------M- "
" ----------------------------------------------------------------- "

" Use goimports to automatically add imports.
let g:go_fmt_command = "goimports"

" Calls `go run` for the current main package
au FileType go nmap <C-g> <Plug>(go-run)
" Calls `go test` for the current main package
au FileType go nmap <C-t> <Plug>(go-test)
" Calls `go build` for the current main package
au FileType go nmap <C-c> <Plug>(go-build)
" Calls `go install` for the current main package
au FileType go nmap <C-i> <Plug>(go-install)
" Rename the identifier under the cursor to the desired new name
au FileType go nmap <C-r> <Plug>(go-rename)
" Alternates between the implementation and test code in the current window
au FileType go nmap <C-a> <Plug>(go-alternate-edit)
" Calls go test -coverprofile-temp.out or clears the annotation like a toggle
au FileType go nmap <C-m> <Plug>(go-coverage-toggle)
" Show the interfaces that the type under the cursor implements
au FileType go nmap <Leader>m <Plug>(go-implements)
" Calls `go test -run '...'` for the test function immediate to cursor
au FileType go nmap <Leader>t <Plug>(go-test-func)
" Shows type information for the word under the cursor
au FileType go nmap <Leader>i <Plug>(go-info)
" Show path from callgraph root to selected function
au FileType go nmap <Leader>cs <Plug>(go-callstack)
" Show the call targets for the type under the cursor
au FileType go nmap <leader>ce <Plug>(go-callees)
" Show possible callers of the selected function
au FileType go nmap <leader>cr <Plug>(go-callers)
" Show send/receive corresponding to selected channel op
au FileType go nmap <leader>ch <Plug>(go-channelpeers)
" Shows the relevant GoDoc for the word under the cursor in a split window
au FileType go nmap <leader>do <Plug>(go-doc-vertical)
" Goto decleration/definition. Results are shown in a split window.
au FileType go nmap <leader>de <Plug>(go-def-vertical)

" ----------------------------------------------------------------- "
