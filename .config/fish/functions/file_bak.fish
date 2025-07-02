# Create a backup of the given file
function file_bak --argument filename
  sudo cp $filename $filename.bak
end
