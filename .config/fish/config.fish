# @fish-lsp-disable 4004
# NOTE: Global variables
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
end
# End of interactive mode
