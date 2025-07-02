# Compile linux-tkg kernel
function mk_linux_tkg
  set oldir (pwd)
  set tkgpath ~/Projects/dev/sh/tkg
  if test ! -d $tkgpath
    mkdir -p $tkgpath
  end

  cd $tkgpath

  if test ! -d $tkgpath/linux-tkg
    git clone "https://github.com/Frogging-Family/linux-tkg.git"
  end

  cd linux-tkg
  git pull
  makepkg -si

  cd $oldir
end

