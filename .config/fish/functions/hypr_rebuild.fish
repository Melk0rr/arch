# Rebuild the hyprland environment
function hypr_rebuild
  set -l hyprpkgs "hyprland-git" "hyprlang-git" "hyprutils-git" "aquamarine-git" "hyprcursor-git" "hyprland-protocols-git" "hyprgraphics-git" "hyprland-qtutils-git" "hypridle-git" "hyprlock-git" "hyprsunset-git"
  set -l installed

  for package in $hyprpkgs
    if pacman -Qi $package
      set -a installed $package
    end
  end

  if [ (count $installed) -eq 0 ]
    echo "No packages to rebuild"
    return 1
  end
  
  yay -S --answerclean All --rebuild $installed
end

