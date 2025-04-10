# Applications
set -gx EDITOR 'nvim'
set -gx TERMINAL 'ghostty'

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
	
	oh-my-posh init fish --config ~/.config/oh-my-posh/omp.json | source

	# Print fish history
	function history
		builtin history --show-time='%F %T'
	end

	function histop
		history | awk '{print $2}' | sort | uniq -c | sort -nr | head -10
	end

	# Clear fish history
	function clear-fish-history
		echo 'Clearing fish history...'
		rm -fv ~/.local/share/fish/fish_history
		sudo rm -fv /root/.local/share/fish/fish_history
		rm -fv ~/.config/fish/fish_history
		sudo rm -fv /root/.config/fish/fish_history
	end

	# Empty trash directories
	function empty-trash
		echo 'Emptying trash...'
		
		# Global trash
		sudo rm -rfv ~/.local/share/Trash/*
		sudo rm -rfv /root/.local/share/Trash/*
	end

	# Clear temporary files
	function clear-temp
		echo 'Clearing temporary files...'
		sudo rm -rfv /tmp/*
		sudo rm -rfv /var/tmp/*
	end

	# Clear crash reports
	function clear-crash-reports
		echo 'Clearing crash reports...'
		sudo rm -rfv /var/crash/*
		sudo rm -rfv /var/lib/systemd/coredump/
	end

	# Clear system logs
	function clear-syslogs
		echo 'Clearing system logs...'
		if ! command -v 'journalctl' &> /dev/null
			echo 'Skipping because journalctl was not found'
		else
			sudo journalctl --vacuum-time=1s
		end

		sudo rm -rfv /run/log/journal/*
		sudo rm -rfv /var/log/journal/*
	end

	# Combined cleanup
	function cleanup
		empty-trash
		clear-temp
		clear-crash-reports
		clear-syslogs
	end

	function lsupd
		echo "* Official updates *"
		checkupdates
		echo -e "\n* AUR Updates *"
		yay -Qua
	end

	# Create a backup of the given file
	function backup-file --argument filename
		sudo cp $filename $filename.bak
	end

	# Copy file
	function copy
		set count (count $argv | tr -d \n)
		if test "$count" = 2; and test -d "$argv[1]"
			set from (echo $argv[1] | trim-right /)
			set to (echo $argv[2])
			command cp -r $from $to
		else
			command cp $argv
		end
	end

	function ffmpeg-convert
		for f in *.$argv[1];
			set fname (string split -r -m1 . $f)[1]
			ffmpeg -i "$f" "$fname.$argv[2]"
		end
	end

	# Fish greeting message
	function fish_greeting
	end

	############# Aliases & Abbreviations ############# 
  # alias vim='nvim'
	alias grep='grep --color'

  # NOTE: General system monitoring / maintenance
	# Install date
	abbr install-date 'stat -c %w / | cut -b 1-16'

	# Fastfetch
	abbr ffe 'fastfetch'

	# Process and journals
	abbr psa 'ps auxf'
	abbr psmem 'ps auxf | sort -nr -k 4'
	abbr pscpu 'ps auxf | sort -nr -k 3'
	abbr jctl 'journalctl -p 3 -xb'
	abbr lsblk 'lsblk -o +uuid,name'

	# PLocate
	alias locate='plocate'

	# Patching
	abbr patch-file 'diff -Naru'
	abbr patch-dir 'diff -crB'

	# DNS
	abbr dnstls-opt 'sudo sed -i "/^DNSOverTLS=/c\DNSOverTLS=opportunistic" /etc/systemd/resolved.conf; sudo systemctl restart systemd-resolved'
	abbr dnstls-yes 'sudo sed -i "/^DNSOverTLS=/c\DNSOverTLS=yes" /etc/systemd/resolved.conf; sudo systemctl restart systemd-resolved'

	# LS
	alias ls='eza -la --color=always --group-directories-first --icons'
	alias la='eza -a --color=always --group-directories-first --icons'
	alias ll='eza -l --color=always --group-directories-first --icons'
	alias lt='eza -aT --color=always --group-directories-first --icons'

	# NOTE: Arch / Pacman specific
	abbr ca 'yay -Sc && yay -Yc'
	abbr co 'pacman -Qtdq | sudo pacman -Rns -'
	abbr un 'sudo pacman -Rns'
  abbr re 'yay -S --answerclean All --rebuild'
  abbr fp 'pacman -Q | fzf'
	abbr update-mirrors 'sudo reflector --verbose --score 100 --latest 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist'
	abbr fix-key 'sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
	abbr chroot-build 'mkdir -p ~/Documents/chroot/; set CHROOT $HOME/Documents/chroot; mkarchroot $CHROOT/root base-devel; makechrootpkg -c -r $CHROOT'

  # NOTE: Dev

	# Git & dev
	abbr gin 'git init'
	abbr gcl 'git clone'
	abbr gcm 'git commit -m'
	abbr ga 'git add'
	abbr gaa 'git add --all'
	abbr gs 'git status'
	abbr gss 'git status --short'
	abbr gst 'git stash'
	abbr gp 'git push'
	abbr gpl 'git pull'
	abbr gdi 'git diff'
	abbr gmr 'git merge'
	abbr gco 'git checkout'
	abbr gb 'git branch'
	abbr gre 'git rebase'


	alias py='python3'

  # NOTE: QoL
	# Zoxide
	zoxide init --cmd cd fish | source

	# yt-dlp
	abbr ytdl 'yt-dlp --output "%(title)s.%(ext)s"'
	abbr ytdlp 'yt-dlp --audio-format mp3 -i --output "%(playlist_index)s-%(title)s.%(ext)s"'
	abbr ytdla 'yt-dlp --audio-format mp3 -i -x -f bestaudio/best --output "%(playlist_index)s-%(title)s.%(ext)s"'

	# Rclone
	abbr rcc 'rclone copy'
end
# End of interactive mode
