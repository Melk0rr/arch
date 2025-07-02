# @fish-lsp-disable 4004 2002
# NOTE: Applications
set -gx EDITOR 'nvim'
set -gx TERMINAL 'ghostty'

set -g fish_greeting

# Commands to run in interactive sessions can go here
if status is-interactive
	# Vim keybindings
	# fish_vi_key_bindings

  # Set cursor style
  set fish_cursor_default block blink
  set fish_cursor_insert  line  blink
  set fish_cursor_visual  block
  set fish_vi_force_cursor 1

  function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
  end
	
  # NOTE: Utils & plugins init
	oh-my-posh init fish --config ~/.config/oh-my-posh/omp.json | source
	zoxide init --cmd cd fish | source

	############# Aliases & Abbreviations ############# 

  # NOTE: General system monitoring / maintenance

  alias grep 'grep --color'
  alias locate 'plocate'
  alias find 'fd'

  # NOTE: LS
  alias ls 'eza -la --color=always --group-directories-first --icons'
  alias la 'eza -a --color=always --group-directories-first --icons'
  alias ll 'eza -l --color=always --group-directories-first --icons'
  alias lt 'eza -aT --color=always --group-directories-first --icons'

	# NOTE: Install date
	abbr instdate 'stat -c %w / | cut -b 1-16'

	# NOTE: Fastfetch
	abbr ffe 'fastfetch'

	# NOTE: Process and journals
  
	abbr pscpu 'ps auxf | sort -nr -k 3'
	abbr jctl 'journalctl -p 3 -xb'
	abbr lsblk 'lsblk -o +uuid,name'

	# NOTE: Patching
	abbr patchf 'diff -Naru'
	abbr patchd 'diff -crB'

	# NOTE: DNS
	abbr dnstls-opt 'sudo sed -i "/^DNSOverTLS=/c\DNSOverTLS=opportunistic" /etc/systemd/resolved.conf; sudo systemctl restart systemd-resolved'
	abbr dnstls-yes 'sudo sed -i "/^DNSOverTLS=/c\DNSOverTLS=yes" /etc/systemd/resolved.conf; sudo systemctl restart systemd-resolved'

	# NOTE: Arch / Pacman specific
  abbr pacremove 'sudo pacman -Rns'
  abbr pacrebuild 'yay -S --answerclean All --rebuild'
	abbr pacclean 'yay -Sc && yay -Yc'
	abbr pacorphans 'pacman -Qtdq | sudo pacman -Rns -'
	abbr pacmirrors 'sudo reflector --verbose --score 100 --latest 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist'
  abbr packey 'sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
  abbr paclog 'cat /var/log/pacman.log'
  abbr pacfindpkg 'pacman -Q | fzf'
  abbr pacchrootpkg "mkdir -p ~/Documents/chroot/; set CHROOT \$HOME/Documents/chroot; mkarchroot \$CHROOT/root base-devel; makechrootpkg -c -r \$CHROOT"

  # NOTE: Hyprland
  abbr hyprlog 'cat $XDG_RUNTIME_DIR/hypr/$(ls $XDG_RUNTIME_DIR/hypr/ | head -n 1)/hyprland.log'
  abbr hyprlogl 'cat $XDG_RUNTIME_DIR/hypr/$(ls -r $XDG_RUNTIME_DIR/hypr/ | head -n 2 | tail -n 1)/hyprland.log'
  abbr hyprcl 'hyprctl clients'

  # NOTE: Dev
  alias py 'python3'
  abbr nvimswap 'rm -rfv ~/.local/state/nvim/swap/*'

	# NOTE:  Git
	abbr gin 'git init'
	abbr gcl 'git clone'
	abbr gcm 'git commit -m'
	abbr ga 'git add'
	abbr gaa 'git add --all'
	abbr gs 'git status'
	abbr gss 'git status --short'
  abbr gm 'git submodule'
  abbr gma 'git submodule add'
  abbr gmu 'git submodule update --remote'
	abbr gst 'git stash'
	abbr gp 'git push'
	abbr gps 'git push --set-upstream origin'
	abbr gpl 'git pull'
	abbr gdi 'git diff'
	abbr gy 'git merge'
	abbr gco 'git checkout'
	abbr gb 'git branch'
	abbr gre 'git rebase'
	abbr gra 'git remote add origin'

  # NOTE: QoL

	# NOTE: YT-DLP
	abbr ytdl 'yt-dlp --output "%(title)s.%(ext)s"'
	abbr ytdlp 'yt-dlp --audio-format mp3 -i --output "%(playlist_index)s-%(title)s.%(ext)s"'
	abbr ytdla 'yt-dlp --audio-format mp3 -i -x -f bestaudio/best --output "%(playlist_index)s-%(title)s.%(ext)s"'

	# NOTE: Rclone
	abbr rcc 'rclone copy'
end
# End of interactive mode
