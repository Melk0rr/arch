# Convert the input image into desired format and delete the old one
function magiconvert --argument file file_cvt
  magick $file $file_cvt && rm $file
end
