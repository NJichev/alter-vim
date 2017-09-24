" Switch between test and producion code
function! alter#open()
  let file = alter#for_current_file()
  exec ':e ' . file
endfunction

command! -nargs=0 -bar OpenTestAlternate call alter#open()

function! alter#for_current_file()
  let current_file = expand("%")
  let new_file = current_file
  let test_suffix = alter#test_framework()
  let test_suffix_rb = '_' . test_suffix . '.rb'
  let test_dir = '^' . test_suffix . '/'
  let in_test_dir = match(current_file, test_dir) != -1
  let going_to_spec = !in_test_dir
  let in_app = match(current_file, '^app/') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', test_suffix_rb, '')
    let new_file = 'spec/' . new_file
  else
    let test_suffix_ending = '_' .test_suffix . '\.rb$'
    let new_file = substitute(new_file, test_suffix_ending, '.rb', '')
    let new_file = substitute(new_file, test_dir, '', '')
    let new_file = 'app/' . new_file
  endif
  return new_file
endfunction

function! alter#test_framework()
  if isdirectory("spec/")
    return "spec"
  else
    return "test"
  endif
endfunction
