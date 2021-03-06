# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

# Colors
set fish_color_user -o blue
set fish_color_cwd -o green
set fish_color_host -o cyan

function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

  # User
  switch (whoami)
  case root
    set_color -o red
  case '*'
    set_color $fish_color_user
  end

  echo -n (whoami)
  set_color normal

  echo -n '@'

  # Host
  set_color $fish_color_host
  echo -n (hostname -s)
  set_color normal

  echo -n ':'

  # PWD
  set_color $fish_color_cwd
  #echo -n (prompt_pwd)
  echo -n (pwd)
  set_color normal

  __fish_git_prompt

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  echo -n ' ➤ '
  set_color normal
end
