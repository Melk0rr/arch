# Do a full cleanup
function cleanup_arch
  # Clean orphans
  pacman -Qtdq | sudo pacman -Rns -

  # Empty trash, tmp files, crash reports and syslogs
  clr_trash
  clr_tmp
  clr_crash-reports
  clr_syslogs
end
