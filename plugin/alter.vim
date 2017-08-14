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
  let in_test_dir = match(current_file, '^' . test_suffix . '/') != -1
  let going_to_spec = !in_test_dir
  let in_app = match(current_file, '^app/') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_'. ftest_suffix . '.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_'. test_suffix . '\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^' . test_suffix . '/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
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
