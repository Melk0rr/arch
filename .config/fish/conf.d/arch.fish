# NOTE: Arch / Pacman specific
abbr pacrm 'sudo pacman -Rns'
abbr pacre 'yay -S --answerclean All --rebuild'
abbr paccln 'yay -Sc && yay -Yc'
abbr pacorp 'pacman -Qtdq | sudo pacman -Rns -'
abbr pacmir 'sudo reflector --verbose --score 100 --latest 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist'
abbr packey 'sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
abbr paclog 'cat /var/log/pacman.log'
abbr pacpkg 'pacman -Q | fzf'
abbr pacchrt "mkdir -p ~/Documents/chroot/; set CHROOT \$HOME/Documents/chroot; mkarchroot \$CHROOT/root base-devel; makechrootpkg -c -r \$CHROOT"
