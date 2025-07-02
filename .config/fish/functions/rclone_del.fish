# Delete the remote file(s)/directory(ies) in my protondrive based on the provided path
function rclone_del --argument remote_file_path
  rclone delete protondrive:$remote_file_path
end 
