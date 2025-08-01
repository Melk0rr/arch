# Convert all of the images with first format to the second format
function magibatch --argument fmt1 fmt2
  for img in *.$fmt1
    set -l fname (basename $img | cut -s -f 1 -d .)
    magick $img $fname.$fmt2 && rm $img
  end
end
