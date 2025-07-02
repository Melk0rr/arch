# Clear temporary files
function clr_tmp
  echo 'Clearing temporary files...'

  sudo rm -rfv /tmp/*
  sudo rm -rfv /var/tmp/*
end

