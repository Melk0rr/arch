# Copy file
function file_cp
  set count (count $argv | tr -d \n)

  if test "$count" = 2; and test -d "$argv[1]"
    set from (echo $argv[1] | trim-right /)
    set to (echo $argv[2])
    command cp -r $from $to
  else
    command cp $argv
  end
end

