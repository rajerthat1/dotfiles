if status is-interactive
end
set fish_greeting
set -x PATH $PATH $HOME/go/bin
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
function fish_user_key_bindings
    bind \cy forward-word
end
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
zoxide init fish | source
set -g fish_cursor_default block
set -g fish_cursor_insert block
alias l=leetcode
alias o=opencode
alias c=commandcode
