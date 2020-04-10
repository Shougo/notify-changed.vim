scriptencoding utf-8

if v:version < 801
  echohl ErrorMsg
  echomsg 'notify-changed: This plugin requires Vim 8.1 or higher'
  echohl None
  finish
endif

if !exists('g:notify_changed_command')
  if has('mac')
    let g:notify_changed_command = ['osascript', '-e', 'display notification "{{msg}}" with title "{{title}}"']
  elseif has('linux')
    let g:notify_changed_command = ['notify-send', '"{{msg}}" with title "{{title}}"']
  else
    echohl ErrorMsg
    echomsg 'notify-changed: Your platform is not supported.'
    echohl None
    finish
  endif
endif

command! -nargs=* -complete=customlist,notify_changed#complete NotifyChanged call notify_changed#command([<f-args>])
