;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(systemd
     vimscript
                                        ;systemd
     spell-checking
     syntax-checking
     version-control

     ;; dash

     ;; themes-megapack
     games
     colors

     helm
     auto-completion
     better-defaults
     ibuffer
     semantic
     typography
     xkcd

     imenu-list
     chrome
     spacemacs-completion
     pandoc
     search-engine
     ranger
     shell
     spotify
     spacemacs-modeline

                                        ;Languages/formats
     csv
     (python :variables
             python-backend 'anaconda
             ;; python-lsp-server 'pylsp
             python-formatter 'black
             python-format-on-save t
             python-fill-column 99)

     ipython-notebook
     yaml
     html
     javascript
     coffeescript
     ;; (typescript :variables
     ;;             typescript-fmt-on-save t
     ;;             typescript-fmt-tool 'tide)
     scheme
     emacs-lisp
     ;git
     markdown
     org
     racket
                                        ;latex
     ;; (lsp :variables
     ;;      lsp-use-lsp-ui nil
     ;;      lsp-lens-enable t
     ;;      lsp-modeline-diagnostics-enable nil)

     ;;(shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      jupyter
                                      company-jedi
                                      sphinx-doc
                                      jedi
                                      jedi-direx
                                      elpy
                                      ;; jinja2-mode
                                      edwina

                                      ;nov
                                      magit
                                      format-all
                                      w3m
                                      ereader
                                      versuri

                                      helm-w3m
                                      helm-ad
                                      helm-company
                                      helm-system-packages
                                        ;helm-spotify-plus
                                      helm-pydoc
                                      helm-google
                                        ;pixiv-novel-mode

                                        ;cl-libify
                                      evil-paredit
                                      multi-term
                                      smart-tabs-mode
                                      visual-regexp-steroids
                                      deft
                                      desktop-environment
                                      flycheck

                                      ;; lsp-mode
                                      ;; lsp-python-ms
                                      ;; helm-lsp

                                      wordsmith-mode
                                      writegood-mode
                                      elfeed
                                      edit-server
                                      edit-server-htmlize
                                        ;proof-general
                                      system-packages

                                        ; themeing
                                      night-owl-theme
                                      nano-theme
                                      nano-modeline
                                      wc-mode
                                      org-d20
                                      org-roam
                                      org-roam-server
                                        ;org-ref
                                        ;alert
                                        ;org-alert
                                        ;org-wild-notifier
                                      gcmh
                                      geiser-guile
                                      )


   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(org-contrib)
   ;;(spacemacs/set-leader-keys "tn" 'display-line-numbers-mode)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 10

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024 2)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'org-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent t

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable t

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(nano-dark
                         spacemacs-light
                         spacemacs-dark
                         dracula
                         subatomic
                         madhat2r
                         night-owl
                         seti
                         flatland
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10.0
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)

   dotspacemacs-mode-line-theme 'spacemacs
   ;; The leader key
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-f"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "M-p" ; Consider changing to <M-return>
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   ;; dotspacemacs-remap-Y-to-y$ nil
   ;; ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; ;; there. (default t)
   ;; dotspacemacs-retain-visual-state-on-shift t
   ;; ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; ;; (default nil)
   ;; dotspacemacs-visual-line-move-text nil
   ;; ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; ;; (default nil)
   ;; dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'original
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t


   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil


   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil


   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil)


  ;; (setq configuration-layer-elpa-archives '(("melpa" . "file:///home/vivien/experiments/emacs-misc/spacemacs-elpa-mirror/melpa/")
  ;;                                           ("org" . "file:///home/vivien/experiments/emacs-misc/spacemacs-elpa-mirror/org/")
  ;;                                           ("gnu" . "file:///home/vivien/experiments/emacs-misc/spacemacs-elpa-mirror/gnu/")))
  ;; remote
  ;; (setq configuration-layer-elpa-archives
  ;;       '(("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/melpa/")
  ;;         ("org"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/org/")
  ;;         ("gnu"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/gnu/")))

  (setq configuration-layer-elpa-archives
        '(("melpa"    . "melpa.org/packages/")
          ("org"      . "orgmode.org/elpa/")
          ("gnu"      . "elpa.gnu.org/packages/")))

  )

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;(setq initial-frame-alist '((top . 40) (left . 300) (width . 138) (height . 38)))
                                        ;(require 'desktop-environment)
  ;(add-to-list 'load-path "/home/vivien/experiments/emacs-misc/packages/emacs-todoist")
  (add-to-list 'load-path "/home/vivien/experiments/emacs-misc/gmatscript.el")
  (message "User Init Loaded")
  ;; (gcmh-mode 1)
  ;;(require 'zen-mode) Glitchy, so don't bother
	;(setq todoist-token "d343fae28a31136647e588735165cf32eabc4c76")
	;(require 'todoist)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()

  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; (setq lsp-log-io nil)
  ;; (setq lsp-idle-delay 0.500)


                                        ; Smudge setup
  (message "Called")
  (setq smudge-oauth2-client-id "2be412c6f3014dde8ed52f4b9756757e")
  (setq smudge-oauth2-client-secret "c29a8c121421479eb46d16d23291efba")
  (elpy-enable)
  (cua-mode 1)
  (desktop-read)
  (desktop-save-mode 1)

  (setq org-latex-pdf-process
        '("pdflatex -interaction nonstopmode -output-directory %o %f"
          "bibtex %b"
          "pdflatex -interaction nonstopmode -output-directory %o %f"
          "pdflatex -interaction nonstopmode -output-directory %o %f"))

  ;; (org-roam-mode 1)
  ;(setq plantuml-executable-path "/usr/bin/plantuml")
  ;(setq plantuml-default-exec-mode 'executable)

  (add-to-list 'auto-mode-alist '("[.]org[.]txt\\'" . org-mode))
  (add-to-list 'auto-mode-alist '("^/home/vivien/[.]xonshrc\\''" . xonsh-mode))

  (with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("mla"
                 "\\documentclass{mla}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
  (global-company-mode)

  (with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("extarticle"
                 "\\documentclass{extarticle}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
  (defadvice org-call-for-shift-select (before org-call-for-shift-select-cua activate)
    (if (and cua-mode
             org-support-shift-select
             (not (use-region-p)))
        (cua-set-mark)))
  (setq python-shell-interpreter "ipython3"
        python-shell-interpreter-args "--simple-prompt --pprint")

                                        ; TODO: Borrow org config from https://github.com/frankjonen/emacs-for-writers/blob/master/.spacemacs

  (message "Pre-keybind")
                                        ;(edit-server-start)
  (global-set-key (kbd "C-s") 'save-buffer)
  (global-set-key (kbd "M-i") 'helm-multi-swoop-all)
  (global-set-key (kbd "C-=") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease)
                                        ;(global-set-key (kbd "C-a") 'mark-whole-buffer)
  (global-set-key (kbd "C-M-v") 'visual-line-mode)
  ;;(global-set-key (kbd "M-f") 'count-words)
  (global-set-key (kbd "M-e") 'helm-M-x)
  (global-set-key (kbd "M-(") 'next-buffer)
  (global-set-key (kbd "M-[") 'next-buffer)
  (global-set-key (kbd "M-)") 'previous-buffer)
  (global-set-key (kbd "M-]") 'previous-buffer)
  (global-set-key (kbd "M-o") 'other-window)

  (setq org-export-with-smart-quotes t)
                                        ;  (setq eclim-executable "/home/vivien/.eclipse/org.eclipse.platform_4.14.0_155965261_linux_gtk_x86_64/plugins/org.eclim_2.8.0/bin/eclim")

  (add-hook 'text-mode-hook #'auto-save-visited-mode)
  (add-hook 'text-mode-hook #'visual-line-mode)
  (add-hook 'text-mode-hook #'hl-todo-mode)

  (add-hook 'prog-mode-hook #'rainbow-mode)
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'prog-mode-hook #'auto-save-visited-mode)
  (add-hook 'prog-mode-hook #'hl-todo-mode)

  (add-hook 'org-mode-hook #'visual-line-mode)
  (add-hook 'org-mode-hook #'auto-save-visited-mode)
  (add-hook 'org-mode-hook #'wc-mode)
  (add-hook 'org-mode-hook #'org-indent-mode)

  (add-hook 'python-mode-hook #'sphinx-doc-mode)
  ;; (add-hook 'python-mode-hook #'lsp)
  ;; (add-hook 'lsp-mode-hook #'lsp-completion-mode)
  ;; (add-hook 'python-mode-hook #'lsp-completion-mode)
  (add-hook 'python-mode-hook #'anaconda-mode)
  (add-hook 'python-mode-hook #'elpy-mode)
  (add-hook 'markdown-mode-hook #'auto-save-visited-mode)
  (add-hook 'markdown-mode-hook #'visual-line-mode)

  (add-hook 'nov-mode-hook #'visual-line-mode)
  (add-hook 'nov-mode-hook #'visual-fill-column-mode)

  (add-hook 'emacs-lisp-mode-hook #'eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook #'eldoc-mode)
  (add-hook 'ielm-mode-hook #'eldoc-mode)

  (with-eval-after-load 'org-mode
    (define-key org-mode-map (kbd "M-f M-c") 'org-latex-export-to-pdf))

  (global-visual-line-mode t)
  (global-undo-tree-mode t)
  (setq-default hybrid-style-enable-hjkl-bindings t)
  (set-cursor-color "MediumSpringGreen")
  (setq browse-url-browser-function 'w3m-browse-url)

  (setq ispell-dictionary "en_GB")
  (message "Post-everything")
  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(background-color "#202020")
 '(background-mode dark)
 '(beacon-color "#cc6666")
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-color "#cccccc")
 '(cursor-type (quote bar))
 '(custom-safe-themes
   (quote
    ("c82d24bfba431e8104219bfd8e90d47f1ad6b80a504a7900cbee002a8f04392f" "9d84c720528fdb16f618025bd73d52c85c0b747e04ea86c7ef41d7bd77bab8b7" "0eccc893d77f889322d6299bec0f2263bffb6d3ecc79ccef76f1a2988859419e" "eb7be1648009af366d83f855191057bdc09348a2d9353db31da03b1cdec50cc5" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "7023f8768081cd1275f7fd1cd567277e44402c65adfe4dc10a3a908055ed634d" "b11699e28cc2f6c34fa6336e67d443be89fadb6a9b60de0b1594f31340ea87e4" "0aefd26847666798da4ad8cd1aa6038ef1b0db92f94c24dc48d06ea445831207" "3b09eb07767faffb708574c44b9f46a6e2d3248e605cf144a7ca0bc9efd6bcf8" "9583f0b6511c5774e5ebfe32662105b4d7157f51473f64e5e1d8be3fc8565f01" "d54834a3ec381644880b49fb82ce9d6ccc11997510c7071cfbf3558c8f4b68f6" "ebd9bea137cafba0138f5a6996aa6851c4ee8263844c75a57798faacbcf8e3e4" "4639288d273cbd3dc880992e6032f9c817f17c4a91f00f3872009a099f5b3f84" "24fc62afe2e5f0609e436aa2427b396adf9a958a8fa660edbaab5fb13c08aae6" "c19e5291471680e72d8bd98f8d6e84f781754a9e8fc089536cda3f0b7c3550e3" "c5ad91387427abc66af38b8d6ea74cade4e3734129cbcb0c34cc90985d06dcb3" "0b2e94037dbb1ff45cc3cd89a07901eeed93849524b574fa8daa79901b2bfdcf" "1a1cdd9b407ceb299b73e4afd1b63d01bbf2e056ec47a9d95901f4198a0d2428" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "392395ee6e6844aec5a76ca4f5c820b97119ddc5290f4e0f58b38c9748181e8d" "9b35c097a5025d5da1c97dba45fed027e4fb92faecbd2f89c2a79d2d80975181" "e6ccd0cc810aa6458391e95e4874942875252cd0342efd5a193de92bfbb6416b" "725a0ac226fc6a7372074c8924c18394448bb011916c05a87518ad4563738668" "862a0ccc73c12df4df325427f9285fa6a5bbba593a77257f43b01c84269f51b0" "8ffdc8c66ceeaf7921f4510a70d808f01b303e6b4d177c947b442e80d4228678" "3fa65d60abd566321f93d1354f91dedae8ab795bb688a421c69e2e0f7fa3c9bc" "b44f201f67425ece29e34972be12917189cac2bac90e3e35d3160bce211d3199" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "d71f6c718dab453b625c407adc50479867a557668d5c21599a1ebea204d9e4f3" "f391a94155d991d13aa857d56db98924136b98357640c8239b0e8eb6aca5436b" "8d805143f2c71cfad5207155234089729bb742a1cb67b7f60357fdd952044315" "604ac011fc9bd042bc041330b3a5e5a86e764a46f7e9fe13e2a1f9f83bf44327" "de9fa4b3614611bed2fe75e105bd0d37542924b977299736f158dd4d7343c666" "462d6915a7eac1c6f00d5acd8b08ae379e12db2341e7d3eac44ff7f984a5e579" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "41c8c11f649ba2832347fe16fe85cf66dafe5213ff4d659182e25378f9cfc183" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "450f3382907de50be905ae8a242ecede05ea9b858a8ed3cc8d1fbdf2d57090af" "28bf1b0a72e3a1e08242d776c5befc44ba67a36ced0e55df27cfc7ae6be6c24d" "9e31aff9afe3c20a33dd966b4c54c6a5151f07659362e4b06bde38ded5370dae" "8885761700542f5d0ea63436874bf3f9e279211707d4b1ca9ed6f53522f21934" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" default)))
 '(custom-theme-directory "~/.config/emacs/themes")
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(dynamic-completion-mode t)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-folding elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(elpy-rpc-python-command "/usr/bin/python")
 '(elpy-rpc-virtualenv-path (quote system))
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#010F1D" t)
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(foreground-color "#cccccc")
 '(frame-background-mode (quote dark))
 '(global-company-mode t)
 '(gnus-logo-colors (quote ("#4c8383" "#bababa")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
 '(highlight-changes-colors (quote ("#EF5350" "#7E57C2")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#010F1D" . 0)
     ("#B44322" . 20)
     ("#34A18C" . 30)
     ("#3172FC" . 50)
     ("#B49C34" . 60)
     ("#B44322" . 70)
     ("#8C46BC" . 85)
     ("#010F1D" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(hl-sexp-background-color "#1c1f26")
 '(jdee-server-dir "~/Apps/jars")
 '(line-number-mode nil)
 '(magit-diff-use-overlays nil)
 '(mode-icons-mode t)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-support-shift-select t)
 '(package-selected-packages
   (quote
    (origami lsp-jedi dap-mode posframe lsp-treemacs bui treemacs pfuture zmq language-id js2-mode dash-functional dash helm-smex disaster company-c-headers cmake-mode clang-format libmpdel libmpdee google-this helm-youtube mpv versuri org-emms helm-emms helm-spotify org-tree-slide undohist frame-purpose helm-purpose todoist fireplace zeno-theme oceanic-theme srcery-theme silkworm-theme pastelmac-theme paganini-theme paper-theme sourcerer-theme sorcery-theme visual-ascii-mode wc-mode org-wc xonsh-mode yasnippet-snippets imenu-list org-ref key-chord helm-bibtex bibtex-completion biblio parsebib biblio-core org-pdfview pdf-tools org-gnome gnome-calendar telepathy org-autolist helm-org-rifle bog org-beautify-theme org-lookup-dnd annotate system-packages xterm-color typo stickyfunc-enhance srefactor spotify shell-pop ibuffer-projectile gmail-message-mode ham-mode html-to-markdown flymd eshell-z eshell-prompt-extras esh-help company-auctex auctex-latexmk auctex ranger proof-general company-coq minimap orgbox ob-ml-marklogic org-sidebar org-edit-latex latex-unicode-math-mode zencoding-mode zen-mode lyrics arc-dark-theme vue-html-mode vue-mode matlab-mode reformatter jdee company-jedi helm-ad ac-emacs-eclim kite-mini org-wild-notifier org-alert fortune-cookie edit-server-htmlize edit-server web orgnav helm-spotify-plus helm-lastpass helm-itunes helm-fuzzy-find helm-books helm-flyspell theme-magic selectric-mode cyberpunk-2019-theme poet-theme elfeed-web mew clipmon helm-eww helm-system-packages elfeed muse wordsmith-mode writegood-mode nord-theme qt-pro-mode crontab-mode company-emacs-eclim eclim ob-ipython ipython-shell-send jupyter mpdel javap-mode javadoc-lookup lsp-java helm-lsp lsp-python lsp-mode company-lsp gradle-mode mvn nov ox-epub csv-mode impatient-mode hackernews flymake-racket xwidgete exwm commander homebrew-mode dark-mint-theme vimrc-mode dactyl-mode yaml-mode malyon vscode-icon dired-icon darcula-theme mode-icons company-flx flycheck-pyflakes skewer-mode indium company-tern tern livid-mode discover-js2-refactor transient visual-regexp-steroids org-d20 zones pydoc-info pydoc deft websocket ewal-spacemacs-themes desktop-environment better-defaults magithub magit folding elfeed-goodies google helm-google immaterial-theme night-owl-theme multi-term company-web web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode web-completion-data sphinx-doc jedi-direx direx jedi jedi-core python-environment epc ctable concurrent deferred elpy find-file-in-project pylint format-all smart-tabs-mode helm-w3m w3m emms conda geiser evil-smartparens evil-paredit cl-libify kite xml+ pixiv-novel-mode ereader rainbow-identifiers color-identifiers-mode typit mmt sudoku pacmacs 2048-game wgrep smex pandoc-mode ox-pandoc ht ivy-hydra flyspell-correct-ivy evil-cleverparens paredit engine-mode counsel-projectile counsel swiper ivy zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme bash-completion flymake-json jsonnet-mode web-beautify simple-httpd json-mode json-snatcher json-reformat multiple-cursors js-doc coffee-mode rainbow-mode xkcd recentf-ext jump-char iy-go-to-char buffer-move better-shell unfill racket-mode faceup org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim mmm-mode markdown-toc markdown-mode htmlize helm-company helm-c-yasnippet gnuplot git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-commit with-editor git-gutter gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck diff-hl company-statistics company-anaconda company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#FFF9DC")
 '(pos-tip-foreground-color "#011627")
 '(send-mail-function (quote mailclient-send-it))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#C792EA")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#FFEB95")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#F78C6C")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#7FDBCA")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#82AAFF"))))
 '(vc-annotate-very-old-color nil)
 '(wc-idle-wait 30)
 '(weechat-color-list
   (quote
    (unspecified "#011627" "#010F1D" "#DC2E29" "#EF5350" "#D76443" "#F78C6C" "#D8C15E" "#FFEB95" "#5B8FFF" "#82AAFF" "#AB69D7" "#C792EA" "#AFEFE2" "#7FDBCA" "#D6DEEB" "#FFFFFF")))
 '(whitespace-action (quote (cleanup)))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(spacemacs-evilified-face ((t (:background "LightGoldenrod3" :foreground "#0B2942" :inherit (quote mode-line)))))
 '(spacemacs-insert-face ((t (:background "dark violet" :foreground "#0B2942" :inherit (quote mode-line)))))
 '(spacemacs-normal-face ((t (:background "MediumSpringGreen" :foreground "#0B2942" :inherit (quote mode-line)))))
 '(variable-pitch ((t (:height 1.0 :family "Merriweather")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(background-color "#202020")
 '(background-mode dark)
 '(beacon-color "#cc6666")
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-color "#cccccc")
 '(cursor-type (quote bar))
 '(custom-safe-themes
   (quote
    ("c82d24bfba431e8104219bfd8e90d47f1ad6b80a504a7900cbee002a8f04392f" "9d84c720528fdb16f618025bd73d52c85c0b747e04ea86c7ef41d7bd77bab8b7" "0eccc893d77f889322d6299bec0f2263bffb6d3ecc79ccef76f1a2988859419e" "eb7be1648009af366d83f855191057bdc09348a2d9353db31da03b1cdec50cc5" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "7023f8768081cd1275f7fd1cd567277e44402c65adfe4dc10a3a908055ed634d" "b11699e28cc2f6c34fa6336e67d443be89fadb6a9b60de0b1594f31340ea87e4" "0aefd26847666798da4ad8cd1aa6038ef1b0db92f94c24dc48d06ea445831207" "3b09eb07767faffb708574c44b9f46a6e2d3248e605cf144a7ca0bc9efd6bcf8" "9583f0b6511c5774e5ebfe32662105b4d7157f51473f64e5e1d8be3fc8565f01" "d54834a3ec381644880b49fb82ce9d6ccc11997510c7071cfbf3558c8f4b68f6" "ebd9bea137cafba0138f5a6996aa6851c4ee8263844c75a57798faacbcf8e3e4" "4639288d273cbd3dc880992e6032f9c817f17c4a91f00f3872009a099f5b3f84" "24fc62afe2e5f0609e436aa2427b396adf9a958a8fa660edbaab5fb13c08aae6" "c19e5291471680e72d8bd98f8d6e84f781754a9e8fc089536cda3f0b7c3550e3" "c5ad91387427abc66af38b8d6ea74cade4e3734129cbcb0c34cc90985d06dcb3" "0b2e94037dbb1ff45cc3cd89a07901eeed93849524b574fa8daa79901b2bfdcf" "1a1cdd9b407ceb299b73e4afd1b63d01bbf2e056ec47a9d95901f4198a0d2428" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "392395ee6e6844aec5a76ca4f5c820b97119ddc5290f4e0f58b38c9748181e8d" "9b35c097a5025d5da1c97dba45fed027e4fb92faecbd2f89c2a79d2d80975181" "e6ccd0cc810aa6458391e95e4874942875252cd0342efd5a193de92bfbb6416b" "725a0ac226fc6a7372074c8924c18394448bb011916c05a87518ad4563738668" "862a0ccc73c12df4df325427f9285fa6a5bbba593a77257f43b01c84269f51b0" "8ffdc8c66ceeaf7921f4510a70d808f01b303e6b4d177c947b442e80d4228678" "3fa65d60abd566321f93d1354f91dedae8ab795bb688a421c69e2e0f7fa3c9bc" "b44f201f67425ece29e34972be12917189cac2bac90e3e35d3160bce211d3199" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "d71f6c718dab453b625c407adc50479867a557668d5c21599a1ebea204d9e4f3" "f391a94155d991d13aa857d56db98924136b98357640c8239b0e8eb6aca5436b" "8d805143f2c71cfad5207155234089729bb742a1cb67b7f60357fdd952044315" "604ac011fc9bd042bc041330b3a5e5a86e764a46f7e9fe13e2a1f9f83bf44327" "de9fa4b3614611bed2fe75e105bd0d37542924b977299736f158dd4d7343c666" "462d6915a7eac1c6f00d5acd8b08ae379e12db2341e7d3eac44ff7f984a5e579" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "41c8c11f649ba2832347fe16fe85cf66dafe5213ff4d659182e25378f9cfc183" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "450f3382907de50be905ae8a242ecede05ea9b858a8ed3cc8d1fbdf2d57090af" "28bf1b0a72e3a1e08242d776c5befc44ba67a36ced0e55df27cfc7ae6be6c24d" "9e31aff9afe3c20a33dd966b4c54c6a5151f07659362e4b06bde38ded5370dae" "8885761700542f5d0ea63436874bf3f9e279211707d4b1ca9ed6f53522f21934" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" default)))
 '(custom-theme-directory "~/.config/emacs/themes")
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(dynamic-completion-mode t)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-folding elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(elpy-rpc-python-command "/usr/bin/python")
 '(elpy-rpc-virtualenv-path (quote system))
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#010F1D" t)
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(foreground-color "#cccccc")
 '(frame-background-mode (quote dark))
 '(global-company-mode t)
 '(global-hl-todo-mode t)
 '(gnus-logo-colors (quote ("#4c8383" "#bababa")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
 '(highlight-changes-colors (quote ("#EF5350" "#7E57C2")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#010F1D" . 0)
     ("#B44322" . 20)
     ("#34A18C" . 30)
     ("#3172FC" . 50)
     ("#B49C34" . 60)
     ("#B44322" . 70)
     ("#8C46BC" . 85)
     ("#010F1D" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(hl-sexp-background-color "#1c1f26")
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")
     ("IDEA" . "#2d9574"))))
 '(jdee-server-dir "~/Apps/jars")
 '(line-number-mode nil)
 '(magit-diff-use-overlays nil)
 '(mode-icons-mode t)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-support-shift-select t)
 '(package-selected-packages
   (quote
    (helm-slime slime-company slime lastpass org-pdftools writeroom-mode visual-fill-column vterm visual-regexp treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil terminal-here symon symbol-overlay string-inflection spaceline-all-the-icons all-the-icons memoize prettier-js pippel pipenv password-generator overseer org-superstar tablist org-cliplink org-brain esxml nodejs-repl nameless modus-vivendi-theme modus-operandi-theme meghanada maven-test-mode lsp-ui kaolin-themes json-navigator hierarchy js2-refactor importmagic helm-xref multi window-purpose helm-org helm-ls-git groovy-mode groovy-imports pcache flycheck-package package-lint let-alist flycheck-elsa eziam-theme evil-textobj-line evil-org evil-lion evil-goggles emr list-utils editorconfig doom-themes devdocs company-reftex chocolate-theme centered-cursor-mode browse-at-remote blacken hybrid-mode font-lock+ dotenv-mode origami lsp-jedi dap-mode posframe lsp-treemacs bui treemacs pfuture zmq language-id js2-mode dash-functional dash helm-smex disaster company-c-headers cmake-mode clang-format libmpdel libmpdee google-this helm-youtube mpv versuri org-emms helm-emms helm-spotify org-tree-slide undohist frame-purpose helm-purpose todoist fireplace zeno-theme oceanic-theme srcery-theme silkworm-theme pastelmac-theme paganini-theme paper-theme sourcerer-theme sorcery-theme visual-ascii-mode wc-mode org-wc xonsh-mode yasnippet-snippets imenu-list org-ref key-chord helm-bibtex bibtex-completion biblio parsebib biblio-core org-pdfview pdf-tools org-gnome gnome-calendar telepathy org-autolist helm-org-rifle bog org-beautify-theme org-lookup-dnd annotate system-packages xterm-color typo stickyfunc-enhance srefactor spotify shell-pop ibuffer-projectile gmail-message-mode ham-mode html-to-markdown flymd eshell-z eshell-prompt-extras esh-help company-auctex auctex-latexmk auctex ranger proof-general company-coq minimap orgbox ob-ml-marklogic org-sidebar org-edit-latex latex-unicode-math-mode zencoding-mode zen-mode lyrics arc-dark-theme vue-html-mode vue-mode matlab-mode reformatter jdee company-jedi helm-ad ac-emacs-eclim kite-mini org-wild-notifier org-alert fortune-cookie edit-server-htmlize edit-server web orgnav helm-spotify-plus helm-lastpass helm-itunes helm-fuzzy-find helm-books helm-flyspell theme-magic selectric-mode cyberpunk-2019-theme poet-theme elfeed-web mew clipmon helm-eww helm-system-packages elfeed muse wordsmith-mode writegood-mode nord-theme qt-pro-mode crontab-mode company-emacs-eclim eclim ob-ipython ipython-shell-send jupyter mpdel javap-mode javadoc-lookup lsp-java helm-lsp lsp-python lsp-mode company-lsp gradle-mode mvn nov ox-epub csv-mode impatient-mode hackernews flymake-racket xwidgete exwm commander homebrew-mode dark-mint-theme vimrc-mode dactyl-mode yaml-mode malyon vscode-icon dired-icon darcula-theme mode-icons company-flx flycheck-pyflakes skewer-mode indium company-tern tern livid-mode discover-js2-refactor transient visual-regexp-steroids org-d20 zones pydoc-info pydoc deft websocket ewal-spacemacs-themes desktop-environment better-defaults magithub magit folding elfeed-goodies google helm-google immaterial-theme night-owl-theme multi-term company-web web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode web-completion-data sphinx-doc jedi-direx direx jedi jedi-core python-environment epc ctable concurrent deferred elpy find-file-in-project pylint format-all smart-tabs-mode helm-w3m w3m emms conda geiser evil-smartparens evil-paredit cl-libify kite xml+ pixiv-novel-mode ereader rainbow-identifiers color-identifiers-mode typit mmt sudoku pacmacs 2048-game wgrep smex pandoc-mode ox-pandoc ht ivy-hydra flyspell-correct-ivy evil-cleverparens paredit engine-mode counsel-projectile counsel swiper ivy zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme bash-completion flymake-json jsonnet-mode web-beautify simple-httpd json-mode json-snatcher json-reformat multiple-cursors js-doc coffee-mode rainbow-mode xkcd recentf-ext jump-char iy-go-to-char buffer-move better-shell unfill racket-mode faceup org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim mmm-mode markdown-toc markdown-mode htmlize helm-company helm-c-yasnippet gnuplot git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-commit with-editor git-gutter gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck diff-hl company-statistics company-anaconda company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#FFF9DC")
 '(pos-tip-foreground-color "#011627")
 '(send-mail-function (quote mailclient-send-it))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#C792EA")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#FFEB95")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#F78C6C")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#7FDBCA")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#82AAFF"))))
 '(vc-annotate-very-old-color nil)
 '(wc-idle-wait 30)
 '(weechat-color-list
   (quote
    (unspecified "#011627" "#010F1D" "#DC2E29" "#EF5350" "#D76443" "#F78C6C" "#D8C15E" "#FFEB95" "#5B8FFF" "#82AAFF" "#AB69D7" "#C792EA" "#AFEFE2" "#7FDBCA" "#D6DEEB" "#FFFFFF")))
 '(whitespace-action (quote (cleanup)))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(spacemacs-evilified-face ((t (:background "LightGoldenrod3" :foreground "#0B2942" :inherit (quote mode-line)))))
 '(spacemacs-insert-face ((t (:background "dark violet" :foreground "#0B2942" :inherit (quote mode-line)))))
 '(spacemacs-normal-face ((t (:background "MediumSpringGreen" :foreground "#0B2942" :inherit (quote mode-line)))))
 '(variable-pitch ((t (:height 1.0 :family "Merriweather")))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(background-color "#202020")
 '(background-mode dark)
 '(beacon-color "#cc6666")
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-color "#cccccc")
 '(cursor-type 'bar)
 '(custom-safe-themes
   '("0ab2aa38f12640ecde12e01c4221d24f034807929c1f859cbca444f7b0a98b3a" "1ca05bdae217adeb636e9bc5e84c8f1d045be2c8004fafd5337d141d9b67a96f" "aca70b555c57572be1b4e4cec57bc0445dcb24920b12fb1fea5f6baa7f2cad02" "bd3b9675010d472170c5d540dded5c3d37d83b7c5414462737b60f44351fb3ed" "76b4632612953d1a8976d983c4fdf5c3af92d216e2f87ce2b0726a1f37606158" "e7ba99d0f4c93b9c5ca0a3f795c155fa29361927cadb99cfce301caf96055dfd" "d268b67e0935b9ebc427cad88ded41e875abfcc27abd409726a92e55459e0d01" "c1284dd4c650d6d74cfaf0106b8ae42270cab6c58f78efc5b7c825b6a4580417" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "c82d24bfba431e8104219bfd8e90d47f1ad6b80a504a7900cbee002a8f04392f" "9d84c720528fdb16f618025bd73d52c85c0b747e04ea86c7ef41d7bd77bab8b7" "0eccc893d77f889322d6299bec0f2263bffb6d3ecc79ccef76f1a2988859419e" "eb7be1648009af366d83f855191057bdc09348a2d9353db31da03b1cdec50cc5" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "7023f8768081cd1275f7fd1cd567277e44402c65adfe4dc10a3a908055ed634d" "b11699e28cc2f6c34fa6336e67d443be89fadb6a9b60de0b1594f31340ea87e4" "0aefd26847666798da4ad8cd1aa6038ef1b0db92f94c24dc48d06ea445831207" "3b09eb07767faffb708574c44b9f46a6e2d3248e605cf144a7ca0bc9efd6bcf8" "9583f0b6511c5774e5ebfe32662105b4d7157f51473f64e5e1d8be3fc8565f01" "d54834a3ec381644880b49fb82ce9d6ccc11997510c7071cfbf3558c8f4b68f6" "ebd9bea137cafba0138f5a6996aa6851c4ee8263844c75a57798faacbcf8e3e4" "4639288d273cbd3dc880992e6032f9c817f17c4a91f00f3872009a099f5b3f84" "24fc62afe2e5f0609e436aa2427b396adf9a958a8fa660edbaab5fb13c08aae6" "c19e5291471680e72d8bd98f8d6e84f781754a9e8fc089536cda3f0b7c3550e3" "c5ad91387427abc66af38b8d6ea74cade4e3734129cbcb0c34cc90985d06dcb3" "0b2e94037dbb1ff45cc3cd89a07901eeed93849524b574fa8daa79901b2bfdcf" "1a1cdd9b407ceb299b73e4afd1b63d01bbf2e056ec47a9d95901f4198a0d2428" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "392395ee6e6844aec5a76ca4f5c820b97119ddc5290f4e0f58b38c9748181e8d" "9b35c097a5025d5da1c97dba45fed027e4fb92faecbd2f89c2a79d2d80975181" "e6ccd0cc810aa6458391e95e4874942875252cd0342efd5a193de92bfbb6416b" "725a0ac226fc6a7372074c8924c18394448bb011916c05a87518ad4563738668" "862a0ccc73c12df4df325427f9285fa6a5bbba593a77257f43b01c84269f51b0" "8ffdc8c66ceeaf7921f4510a70d808f01b303e6b4d177c947b442e80d4228678" "3fa65d60abd566321f93d1354f91dedae8ab795bb688a421c69e2e0f7fa3c9bc" "b44f201f67425ece29e34972be12917189cac2bac90e3e35d3160bce211d3199" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "d71f6c718dab453b625c407adc50479867a557668d5c21599a1ebea204d9e4f3" "f391a94155d991d13aa857d56db98924136b98357640c8239b0e8eb6aca5436b" "8d805143f2c71cfad5207155234089729bb742a1cb67b7f60357fdd952044315" "604ac011fc9bd042bc041330b3a5e5a86e764a46f7e9fe13e2a1f9f83bf44327" "de9fa4b3614611bed2fe75e105bd0d37542924b977299736f158dd4d7343c666" "462d6915a7eac1c6f00d5acd8b08ae379e12db2341e7d3eac44ff7f984a5e579" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "41c8c11f649ba2832347fe16fe85cf66dafe5213ff4d659182e25378f9cfc183" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "450f3382907de50be905ae8a242ecede05ea9b858a8ed3cc8d1fbdf2d57090af" "28bf1b0a72e3a1e08242d776c5befc44ba67a36ced0e55df27cfc7ae6be6c24d" "9e31aff9afe3c20a33dd966b4c54c6a5151f07659362e4b06bde38ded5370dae" "8885761700542f5d0ea63436874bf3f9e279211707d4b1ca9ed6f53522f21934" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" default))
 '(custom-theme-directory "~/.config/emacs/themes")
 '(diary-entry-marker 'font-lock-variable-name-face)
 '(dynamic-completion-mode t)
 '(elfeed-feeds
   '("http://www.strangehorizons.com/feed/" "http://blastr.com/rss.xml" "http://www.marginalrevolution.com/marginalrevolution/index.rdf" "http://feeds.feedburner.com/NewmarksDoor" "http://www-rcf.usc.edu/~pgordon/blog/atom.xml" "http://www.centives.net/S/feed/" "http://www.ragingswan.com/feed/" "http://unabridged.merriam-webster.com/blog/feed/" "http://illinois.edu/blog/xml/25/rss.xml" "http://www.fromquarkstoquasars.com/feed/" "http://www.ams.org/rss/mathmoments.xml" "http://www.arrantpedantry.com/feed/" "http://www.universetoday.com/universetoday.xml" "https://lowercasegod.wordpress.com/feed/" "http://www.math3ma.com/mathema?format=RSS" "http://www.npr.org/rss/rss.php?id=114424647" "http://www.dailyartdaily.com/feed/" "http://dndspeak.com/feed/" "http://allthingslinguistic.com/rss" "http://arthropoda.wordpress.com/feed/" "http://srconstantin.posthaven.com/posts.atom" "http://korystamper.wordpress.com/feed/" "https://blogs.ams.org/?feed=rss2" "https://zerohplovecraft.wordpress.com/feed/" "https://www.lesswrong.com/feed.xml?view=curated-rss"))
 '(elpy-modules
   '(elpy-module-company elpy-module-eldoc elpy-module-folding elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults))
 '(elpy-rpc-python-command "/usr/bin/python")
 '(elpy-rpc-virtualenv-path 'system)
 '(emms-mode-line-icon-image-cache
   '(image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };"))
 '(evil-emacs-state-cursor '("#E57373" hbar) t)
 '(evil-insert-state-cursor '("#E57373" bar) t)
 '(evil-normal-state-cursor '("#FFEE58" box) t)
 '(evil-undo-system 'undo-tree)
 '(evil-visual-state-cursor '("#C5E1A5" box) t)
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#010F1D" t)
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(flycheck-flake8-maximum-line-length 3000)
 '(foreground-color "#cccccc")
 '(frame-background-mode 'dark)
 '(fringe-mode 10 nil (fringe))
 '(global-company-mode t)
 '(global-hl-todo-mode t)
 '(gnus-logo-colors '("#4c8383" "#bababa") t)
 '(gnus-mode-line-image-cache
   '(image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };") t)
 '(helm-completion-style 'emacs)
 '(highlight-changes-colors '("#EF5350" "#7E57C2"))
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-parentheses-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    '("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2")))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   '(("#010F1D" . 0)
     ("#B44322" . 20)
     ("#34A18C" . 30)
     ("#3172FC" . 50)
     ("#B49C34" . 60)
     ("#B44322" . 70)
     ("#8C46BC" . 85)
     ("#010F1D" . 100)))
 '(hl-bg-colors
   '("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00"))
 '(hl-fg-colors
   '("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(hl-sexp-background-color "#1c1f26")
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")
     ("IDEA" . "#2d9574")))
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(jdee-server-dir "~/Apps/jars")
 '(line-number-mode nil)
 '(linum-format " %7i ")
 '(lsp-after-initialize-hook nil)
 '(lsp-after-open-hook
   '(dap--after-open
     (lambda nil "Setup xref jump handler"
       (spacemacs//setup-lsp-jump-handler))
     lsp-origami-try-enable))
 '(lsp-client-packages
   '(ccls lsp-ada lsp-angular lsp-bash lsp-clangd lsp-clojure lsp-cmake lsp-crystal lsp-csharp lsp-css lsp-dart lsp-dhall lsp-dockerfile lsp-elm lsp-elixir lsp-erlang lsp-eslint lsp-fortran lsp-fsharp lsp-gdscript lsp-go lsp-hack lsp-groovy lsp-haskell lsp-haxe lsp-java lsp-javascript lsp-json lsp-kotlin lsp-lua lsp-nim lsp-nix lsp-metals lsp-ocaml lsp-perl lsp-php lsp-pwsh lsp-pyls lsp-purescript lsp-r lsp-rf lsp-rust lsp-solargraph lsp-sorbet lsp-tex lsp-terraform lsp-vala lsp-verilog lsp-vetur lsp-vhdl lsp-vimscript lsp-xml lsp-yaml lsp-sqls lsp-svelte lsp-steep))
 '(lsp-completion-provider t)
 '(lsp-disabled-clients '(mspyls lsp-python-ms))
 '(lsp-enable-file-watchers nil)
 '(lsp-keymap-prefix "M-l")
 '(lsp-log-io nil)
 '(lsp-pylsp-plugins-flake8-config "~/.config/flake8")
 '(lsp-pylsp-plugins-pydocstyle-enabled nil)
 '(lsp-pyright-auto-search-paths nil)
 '(lsp-pyright-log-level "error")
 '(lsp-pyright-multi-root nil)
 '(lsp-pyright-use-library-code-for-types nil)
 '(magit-diff-use-overlays nil)
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(mode-icons-mode t)
 '(nrepl-message-colors
   '("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4"))
 '(objed-cursor-color "#ff5555")
 '(org-babel-load-languages
   '((java . t)
     (js . t)
     (python . t)
     (shell . t)
     (groovy . t)
     (emacs-lisp . t)
     (plantuml . t)))
 '(org-indent-boundary-char 32)
 '(org-indent-indentation-per-level 2)
 '(org-latex-packages-alist '(("" "tabularx" nil)))
 '(org-src-lang-modes
   '(("arduino" . arduino)
     ("redis" . redis)
     ("php" . php)
     ("C" . c)
     ("C++" . c++)
     ("asymptote" . asy)
     ("bash" . sh)
     ("beamer" . latex)
     ("calc" . fundamental)
     ("cpp" . c++)
     ("ditaa" . artist)
     ("dot" . fundamental)
     ("elisp" . emacs-lisp)
     ("ocaml" . tuareg)
     ("screen" . shell-script)
     ("shell" . sh)
     ("sqlite" . sql)
     ("python" . python)
     ("plantuml" . plantuml)))
 '(org-support-shift-select t)
 '(package-selected-packages
   '(nano-modeline nano-theme smudge gcmh crdt hyperbole whole-line-or-region ini-mode helm-c-moccur systemd helm-slime slime-company slime lastpass org-pdftools writeroom-mode visual-fill-column vterm visual-regexp treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil terminal-here symon symbol-overlay string-inflection spaceline-all-the-icons all-the-icons memoize prettier-js pippel pipenv password-generator overseer org-superstar tablist org-cliplink org-brain esxml nodejs-repl nameless modus-vivendi-theme modus-operandi-theme meghanada maven-test-mode lsp-ui kaolin-themes json-navigator hierarchy js2-refactor helm-xref multi window-purpose helm-org helm-ls-git groovy-mode groovy-imports pcache flycheck-package package-lint let-alist flycheck-elsa eziam-theme evil-textobj-line evil-org evil-lion evil-goggles emr list-utils editorconfig doom-themes devdocs company-reftex chocolate-theme centered-cursor-mode browse-at-remote blacken hybrid-mode font-lock+ dotenv-mode origami lsp-jedi dap-mode posframe lsp-treemacs bui treemacs pfuture zmq language-id js2-mode dash-functional dash helm-smex disaster company-c-headers cmake-mode clang-format libmpdel libmpdee google-this helm-youtube mpv versuri org-emms helm-emms helm-spotify org-tree-slide undohist frame-purpose helm-purpose todoist fireplace zeno-theme oceanic-theme srcery-theme silkworm-theme pastelmac-theme paganini-theme paper-theme sourcerer-theme sorcery-theme visual-ascii-mode wc-mode org-wc xonsh-mode yasnippet-snippets imenu-list org-ref key-chord helm-bibtex bibtex-completion biblio parsebib biblio-core org-pdfview pdf-tools org-gnome gnome-calendar telepathy org-autolist helm-org-rifle bog org-beautify-theme org-lookup-dnd annotate system-packages xterm-color typo stickyfunc-enhance srefactor spotify shell-pop ibuffer-projectile gmail-message-mode ham-mode html-to-markdown flymd eshell-z eshell-prompt-extras esh-help company-auctex auctex-latexmk auctex ranger proof-general company-coq minimap orgbox ob-ml-marklogic org-sidebar org-edit-latex latex-unicode-math-mode zencoding-mode zen-mode lyrics arc-dark-theme vue-html-mode vue-mode matlab-mode reformatter jdee company-jedi helm-ad ac-emacs-eclim kite-mini org-wild-notifier org-alert fortune-cookie edit-server-htmlize edit-server web orgnav helm-spotify-plus helm-lastpass helm-itunes helm-fuzzy-find helm-books helm-flyspell theme-magic selectric-mode cyberpunk-2019-theme poet-theme elfeed-web mew clipmon helm-eww helm-system-packages elfeed muse wordsmith-mode writegood-mode nord-theme qt-pro-mode crontab-mode company-emacs-eclim eclim ob-ipython ipython-shell-send jupyter mpdel javap-mode javadoc-lookup lsp-java helm-lsp lsp-mode company-lsp gradle-mode mvn nov ox-epub csv-mode impatient-mode hackernews flymake-racket xwidgete exwm commander homebrew-mode dark-mint-theme vimrc-mode dactyl-mode yaml-mode malyon vscode-icon dired-icon darcula-theme mode-icons company-flx flycheck-pyflakes skewer-mode indium company-tern tern livid-mode discover-js2-refactor transient visual-regexp-steroids org-d20 zones pydoc-info pydoc deft websocket ewal-spacemacs-themes desktop-environment better-defaults magithub magit folding elfeed-goodies google helm-google immaterial-theme night-owl-theme multi-term company-web web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode web-completion-data sphinx-doc jedi-direx direx jedi jedi-core python-environment epc ctable concurrent deferred elpy find-file-in-project pylint format-all smart-tabs-mode helm-w3m w3m emms conda geiser evil-smartparens evil-paredit cl-libify kite xml+ pixiv-novel-mode ereader rainbow-identifiers color-identifiers-mode typit mmt sudoku pacmacs 2048-game wgrep smex pandoc-mode ox-pandoc ht ivy-hydra flyspell-correct-ivy evil-cleverparens paredit engine-mode counsel-projectile counsel swiper ivy zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme bash-completion flymake-json jsonnet-mode web-beautify simple-httpd json-mode json-snatcher json-reformat multiple-cursors js-doc coffee-mode rainbow-mode xkcd recentf-ext jump-char iy-go-to-char buffer-move better-shell unfill racket-mode faceup org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim mmm-mode markdown-toc markdown-mode htmlize helm-company helm-c-yasnippet gnuplot git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-commit with-editor git-gutter gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck diff-hl company-statistics company-anaconda company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(plantuml-executable-path "/usr/bin/plantuml" t)
 '(plantuml-jar-path "/usr/share/java/plantuml.jar")
 '(plantuml-java-command "/usr/bin/java")
 '(pos-tip-background-color "#FFF9DC")
 '(pos-tip-foreground-color "#011627")
 '(powerline-color1 "#222232")
 '(powerline-color2 "#333343")
 '(rustic-ansi-faces
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(send-mail-function 'mailclient-send-it)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(tabbar-background-color "#357535753575")
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#C792EA")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#FFEB95")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#F78C6C")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#7FDBCA")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#82AAFF")))
 '(vc-annotate-very-old-color nil)
 '(wc-idle-wait 30)
 '(weechat-color-list
   '(unspecified "#011627" "#010F1D" "#DC2E29" "#EF5350" "#D76443" "#F78C6C" "#D8C15E" "#FFEB95" "#5B8FFF" "#82AAFF" "#AB69D7" "#C792EA" "#AFEFE2" "#7FDBCA" "#D6DEEB" "#FFFFFF"))
 '(whitespace-action '(cleanup))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(spacemacs-evilified-face ((t (:background "LightGoldenrod3" :foreground "#0B2942" :inherit 'mode-line))))
 '(spacemacs-insert-face ((t (:background "dark violet" :foreground "#0B2942" :inherit 'mode-line))))
 '(spacemacs-normal-face ((t (:background "MediumSpringGreen" :foreground "#0B2942" :inherit 'mode-line))))
 '(variable-pitch ((t (:height 1.0 :family "Merriweather")))))
)
