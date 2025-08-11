# Print the available updates
function pacupd
  echo "* Official updates *"
  checkupdates

  echo -e "\n* AUR Updates *"
  yay -Qua
end
