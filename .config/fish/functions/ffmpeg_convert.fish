# Convert all files of the first provided type into the second provided type
function ffmpeg_convert
  for f in *.$argv[1];
    set fname (string split -r -m1 . $f)[1]
    ffmpeg -i "$f" "$fname.$argv[2]"
  end
end

