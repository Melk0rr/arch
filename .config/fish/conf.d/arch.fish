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
