# Clear system logs
function clr_syslogs
  echo 'Clearing system logs...'

  if ! command -v journalctl &>/dev/null
      echo 'Skipping because journalctl was not found'
  else
      sudo journalctl --vacuum-time=1s
  end

  sudo rm -rfv /run/log/journal/*
  sudo rm -rfv /var/log/journal/*
end

