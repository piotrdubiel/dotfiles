function fish_prompt
  set -l last_status $status
  if not set -q -g __fish_prompt_helper_functions_defined
    set -g __fish_prompt_helper_functions_defined
    function _git_branch_name
      echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
    end
	
    function _is_git_dirty
      echo (git status -s --ignore-submodules=dirty ^/dev/null)
    end
  end


  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l darkpurple (set_color -o 62A)
  set -l normal (set_color normal)

  set -l pwd
  if [ u(prompt_pwd) = 'u~' ]
    set pwd $yellow'⌂ '$normal
  else
    set pwd $yellow'@ '$normal(prompt_pwd)' '
  end

  # Last status
  set -l prompt_status
  if test $last_status -ne 0
    set prompt_status $red'('$last_status')'$normal' '
  else
    set prompt_status $green'✓ '$normal
  end

  if [ (_git_branch_name) ]
    set -l git_branch $green(_git_branch_name)

    if [ (_is_git_dirty) ]
      set -l mods ' +'(git status -s | egrep "^ ?M " | wc -l | cut -f 8 -d' ')
      if test $mods = ' +0'
        set -e mods
      end
      set -l adds ' ~'(git status -s | egrep "^\?\? " | wc -l | cut -f 8 -d' ')
      if test $adds = ' ~0'
        set -e adds
      end
      set -l dels ' -'(git status -s | egrep "^ ?D "| wc -l | cut -f 8 -d' ')
      if test $dels = ' -0'
        set -e dels
      end

      set -l dirty "$yellow⚡"
      set git_info "$blue($git_branch$blue$green$mods$cyan$adds$red$dels$blue) "
    else
      set git_info "$blue($git_branch$blue) "
    end
  end

  echo -n -s $prompt_status $pwd $git_info $darkpurple'ケ'$normal
end
