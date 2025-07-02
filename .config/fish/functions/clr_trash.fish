# Empty trash directories
function clr_trash
  echo 'Emptying trash...'

  # Global trash
  sudo rm -rfv ~/.local/share/Trash/*
  sudo rm -rfv /root/.local/share/Trash/*
end

