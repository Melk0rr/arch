# Clear fish history
function clr_fish_history
  echo 'Clearing fish history...'

  rm -fv ~/.local/share/fish/fish_history
  sudo rm -fv /root/.local/share/fish/fish_history
  rm -fv ~/.config/fish/fish_history
  sudo rm -fv /root/.config/fish/fish_history
end

