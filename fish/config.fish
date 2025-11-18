if status is-interactive
    # Commands to run in interactive sessions can go here
    export ZELLIJ_CONFIG_DIR=$HOME/.config/zellij

    fish_config theme choose "Catppuccin Macchiato"

    # alias "rm -rf"="echo Bad Idea"
    starship init fish | source
    # zoxide init fish | source
    if [ "$TERM" = "xterm-ghostty" ]
        # Launch zellij
        # eval (zellij setup --generate-auto-start fish | string collect)
    end

end


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/vivien/.opam/opam-init/init.fish' && source '/home/vivien/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
# eval $(opam env).


# eval (tmuxifier init - fish)

