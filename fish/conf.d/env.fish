if status is-interactive
    # Env Vars
    # export PAGER="bat"
    export LESSOPEN="| batpipe %s"
    set -e LESSCLOSE
    export LESS="$LESS -FXR"
    export BATPIPE="color"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"

    export PATH="/home/vivien/go/bin:$PATH"
    export PATH="/home/vivien/.local/bin:$PATH"
    export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
    export PATH="$HOME/.pub-cache/bin:$PATH"
    export PATH="$HOME/.cargo/bin:$PATH"
    export PATH="/usr/local/opt/texinfo/bin:$PATH"
    export PATH="$HOME/.local/share/umake/ide:$PATH"
    export PATH="$HOME/bin:/usr/local/bin:$PATH"
    export PATH="/usr/racket:$PATH"
    export PATH="$HOME/experiments/pythonia:$PATH"
    export PATH="$HOME/usr/local/bin:$PATH"
    export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
    export PATH="$HOME/.config/emacs/bin:$PATH"
    export PATH="$HOME/.idris2/bin:$PATH"
    export PATH="$HOME/.yarn/bin:$PATH"
    export PATH="$HOME/drive/work/langs/roc/roc-nightly:$PATH"
    export PATH="$HOME/.opam/default/bin:$PATH"
    export PATH="$HOME/.tmuxifier/bin:$PATH"

    export WINEARCH="win64"
    export WINEPATH="/usr/bin"
    export WINEPREFIX="$HOME/.wine"
    # export PATH="$WINEPATH:$PATH"

    export MANPATH="$HOME/anaconda3/share/man:$HOME/funny-manpages:/usr/share/man:$MANPATH"
    # $EDITOR should open in terminal
    # export BROWSER='/usr/bin/firefox'
    export EDITOR="/home/vivien/bin/enw"
    export SUDO_EDITOR="emacsclient -c"
    # $VISUAL opens in GUI with non-daemon as alternate
    export VISUAL="/home/vivien/bin/enw"
    export TERMINAL='tilix'
    export GRAVEYARD="$HOME/.local/share/Trash"
    export TEXT_AID_TOO_EDITOR="emacsclient -c"
    export TEXT_AID_TOO_SECRET="HELLO-WORLD"
    export SAVEHIST=1000
    export FOREIGN_ALIASES_SUPPRESS_SKIP_MESSAGE=True

    # DESI ROOT
    export SCRATCH="$HOME/d/urap/scratch"
    export DESIROOT="$HOME/d/urap/data"
    export DESI_SPECTRO_REDUX="$HOME/d/urap/data"
    export DESI_API_CONFIG_FILE="$HOME/d/urap/desiapi/etc/docker/config.toml"
    # export RR_TEMPLATE_DIR="$HOME/d/urap/libs/redrock/py/redrock/templates"
    export RR_TEMPLATE_DIR="$HOME/d/urap/libs/redrock/py/redrock/templates"

    export PYTHONPATH="$HOME/drive/work/urap/desiapi/py:$PYTHONPATH"
    export PATH="$HOME/drive/work/urap/desiapi/bin:$PATH"
    export PATH="$HOME/Downloads/platform-tools:$PATH"


end
