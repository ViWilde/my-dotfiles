if status is-interactive
    #Aliases sorted properly


    # DESI
    abbr -a desimnt "sshfs vivien@perlmutter.nersc.gov:/global/cfs/cdirs/desi/ ~/mnt"

    # File
    abbr -a fishconf "$EDITOR ~/dotfiles/fish/config.fish"

    #Onedrive management
    abbr -a monitor 'onedrive --monitor'
    abbr -a drivesync 'onedrive --synchronize' #NOTE: -d was removed from the end so if it stops working blame that

    #Utilities
    abbr -a configure "./configure && make && sudo make install"
    abbr -a pingtest 'ping www.google.com -c 3'
    abbr -a copy 'git clone'
    abbr -a enes "trans -s en -t es"
    abbr -a esen "trans -s es -t en"
    abbr -a clip "xclip -selection c"

    # Python
    abbr -a prp "pipenv run python"
    abbr -a pyscratch "e ~/experiments/pythonia/scratch.py"
    abbr -a pinstall "pip install --user --break-system-packages"
    abbr -a py ipython
    abbr -a ipy ptipython
    abbr -a vox vf

    abbr -a killscreen "sudo brightnessctl s 0"
    abbr -a screenup "sudo brightnessctl s 40"

    # Emacs
    abbr -a E sudoedit
    abbr -a e "~/bin/eclient"
    abbr -a newdoom "doom sync && systemctl restart --user emacs && eclient"
    abbr -a enw "emacsclient -nw"


    abbr -a nemosu "pwd|xargs sudo nemo &"
    abbr -a nemohere "pwd|xargs nemo &" #

    # Short forms
    abbr -a man batman
    abbr -a l "/usr/bin/less -r"
    abbr -a b bat
    abbr -a o xdg-open
    abbr -a ka killall
    abbr -a epubgrep "unzip -p '*.epub' | grep -a --color"
    abbr -a sc systemctl
    abbr -a r ranger
    abbr -a cat bat
    abbr -a b bat
    abbr -a diff batdiff
    abbr -a bgr batgrep
    abbr -a cd z

    #Spotify
    abbr -a spotpause "playerctl --player spotify pause"
    abbr -a spotnext "playerctl --player spotify next"
    abbr -a spotprev "playerctl --player spotify previous"
    abbr -a spotplay "playerctl --player spotify play"
    abbr -a spottoggle "playerctl --player spotify play-pause"
    abbr -a pauseall "playerctl --all-players pause"

    #Debian/mint
    abbr -a apt 'sudo apt'
    abbr -a sapt 'sudo apt'
    abbr -a inscribe "sudo add-apt-repository"
    #abbr -a purge "sudo apt autoremove && sudo apt clean"
    abbr -a aptinfo "apt-cache show"

    #Manjaro
    alias pac=/usr/bin/pacman
    abbr -a summon "sudo --preserve-env=pacman_program pacman -S"
    abbr -a exterminate "sudo --preserve-env=pacman_program pacman -Rs"
    abbr -a purge "sudo --preserve-env=pacman_program pacman -Qdtq"
    abbr -a update "pacman -Qu"
    abbr -a upgrade "sudo --preserve-env=pacman_program pacman -Syu"
    abbr -a pacinfo "pacman -Si"
    abbr -a pacsearch "pacman -Ss"
    abbr -a rosettav "o ~/Downloads/pacrosetta.html"
    abbr -a rosettaw "w3m ~/Downloads/pacrosetta.html"
    alias ypac='env pacman_program="/usr/bin/pacman" yay'
    abbr -a ysummon "ypac -S"
    abbr -a yupgrade "ypac -Syu"
    abbr -a yinfo "ypac -Si"
    abbr -a ysearch "ypac -Ss"

    # Workarounds
    abbr -a drac "env GTK_THEME=Dracula"
    abbr -a pav "env GTK_THEME=Dracula pavucontrol"
    abbr -a lol "env GTK_THEME=Dracula lolly"

    abbr -a fo "fortune -e"

    # CS164
    abbr -a typecheck 'cd ~/d/cs/164/projects/pa2-chocopy-semantic-analysis-travelling-circus-1 && java -cp "chocopy-ref.jar:target/assignment.jar" chocopy.ChocoPy --pass=rr src/test/data/pa2/student_contributed/'
    abbr -a studentcheck 'cd ~/d/cs/164/projects/pa2-chocopy-semantic-analysis-travelling-circus-1 && java -cp "chocopy-ref.jar:target/assignment.jar" chocopy.ChocoPy --pass=rs src/test/data/pa2/student_contributed/'

abbr -a testall 'java -cp "chocopy-ref.jar:target/assignment.jar" chocopy.ChocoPy --pass=..s --run --dir src/test/data/pa3/sample --test'

end
