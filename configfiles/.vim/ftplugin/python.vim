" ----------------------------------------------------------------- "
" -V----------V--- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---V----------V- "
" ---------------- S       A     A G       E       ---------------- "
" -I----------I--- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---I----------I- "
" ----------------       S A     A G     G E       ---------------- "
" -M----------M--- SSSSSSS A     A GGGGGGG EEEEEEE ---M----------M- "
" ----------------------------------------------------------------- "

let b:ale_linters = {'python': ['mypy','pylint','pyls']}
let g:ale_fixers = {'python': ['isort', 'black']}

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79

syn region Comment start=/"""/ end=/"""/

" ----------------------------------------------------------------- "
