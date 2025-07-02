# NOTE: Hyprland abbr
abbr hyprlog 'cat $XDG_RUNTIME_DIR/hypr/$(ls $XDG_RUNTIME_DIR/hypr/ | head -n 1)/hyprland.log'
abbr hyprlogl 'cat $XDG_RUNTIME_DIR/hypr/$(ls -r $XDG_RUNTIME_DIR/hypr/ | head -n 2 | tail -n 1)/hyprland.log'
abbr hyprctlc 'hyprctl clients'

