function soji_header
  set -l blue (set_color blue)
  set todays_note_file (soji note-path log)

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

  set -l journal_color
  set -l journal
  if [ -e (soji note-path journal) ]
    set journal "✔"
    set journal_color (set_color "green")
  else
    set journal "✘"
    set journal_color (set_color "red")
  end

  set -l meditation_color
  set -l meditation
  if cat $todays_note_file ^ /dev/null | grep -i "** Meditation" > /dev/null ^ /dev/null
    set meditation "✔"
    set meditation_color (set_color "green")
  else
    set meditation "✘"
    set meditation_color (set_color "red")
  end

  set pom_count (cat $todays_note_file ^ /dev/null | grep -i "** start" | wc -l)
  set -l poms_color
  if [ "$pom_count" -lt 4 ]
    set poms_color (set_color "red")
  else if [ "$pom_count" -lt 8 ]
    set poms_color (set_color "yellow")
  else
    set poms_color (set_color "green")
  end

  set -l lunch_color
  set -l lunch
  if cat $todays_note_file ^ /dev/null | grep -i "** lunch" > /dev/null ^ /dev/null
    set lunch "✔"
    set lunch_color (set_color "green")
  else
    set lunch "✘"
    set lunch_color (set_color "red")
  end

  set meeting_count (cat $todays_note_file 2> /dev/null | grep -i "** meeting" | wc -l)

  echo -e -s $blue "journal " $journal_color "$journal" $blue " meditation " $meditation_color "$meditation" $blue " lunch " $lunch_color "$lunch" $blue " pomodoros " $poms_color "$pom_count" $blue " meetings " (set_color "green") $meeting_count (set_color normal)
end
