# Backup the provided path to my protondrive backup folder/provided_path
function rclone_bak --argument file path
  rclone copy $file protondrive:backup/$path
end 
