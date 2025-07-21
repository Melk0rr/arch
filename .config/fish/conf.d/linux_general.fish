# @fish-lsp-disable 2002
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
