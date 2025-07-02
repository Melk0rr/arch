# Compile mesa-tkg
function mk_mesa_tkg
  set oldir (pwd)
  set tkgpath ~/Projects/dev/sh/tkg
  if test ! -d $tkgpath
    mkdir -p $tkgpath
  end

  cd $tkgpath

  if test ! -d $tkgpath/mesa-git
    git clone "https://github.com/Frogging-Family/mesa-git.git"
  end

  cd mesa-git
  git pull
  makepkg -si

  cd $oldir
end

