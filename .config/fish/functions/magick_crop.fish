# TODO: Finish function
function magick_crop --argument file width height
  magick $file -resize "x$height" -gravity Center -crop "$width\x$height+0+0" +repage 
end
