function fish_prompt
  set -l normal (set_color normal)

  set -l color_cwd
  set -l suffix
  switch $USER
    case root toor
      if set -q fish_color_cwd_root
        set color_cwd $fish_color_cwd_root
      else
        set color_cwd $fish_color_cwd
      end
      set suffix '#'
    case '*'
      set color_cwd $fish_color_cwd
      set suffix '>'
  end

  echo -e -n -s (soji_header) "\n" (set_color "yellow") (soji status) " " (set_color $color_cwd) (prompt_pwd) $normal (__fish_git_prompt) "$suffix "

end
