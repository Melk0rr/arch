# Clear crash reports
function clr_crash_reports
  echo 'Clearing crash reports...'

  sudo rm -rfv /var/crash/*
  sudo rm -rfv /var/lib/systemd/coredump/
end

