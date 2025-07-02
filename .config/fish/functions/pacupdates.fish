# Print the available updates
function pacupdates
  echo "* Official updates *"
  checkupdates

  echo -e "\n* AUR Updates *"
  yay -Qua
end
