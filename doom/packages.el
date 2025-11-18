;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
                                        ;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
                                        ;(package! another-package
                                        ;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
                                        ;(package! this-package
                                        ;  :recipe (:host github :repo "username/repo"
                                        ;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
                                        ;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
                                        ;(package! builtin-package :recipe (:nonrecursive t))
                                        ;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
                                        ;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
                                        ;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
                                        ;(unpin! pinned-package)
;; ...or multiple packages
                                        ;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
                                        ;(unpin! t)
;; (add-to-list 'load-path "~/build/doom-nano-testing")
;; (package! transient :pin "c2bdf7e12c530eb85476d3aef317eb2941ab9440")
;; (package! with-editor :pin "391e76a256aeec6b9e4cbd733088f30c677d965b")

;;; Themes
(package! catppuccin-theme)

;;; Libraries
(package! dash)
(package! s)
(package! ht)
(package! plz :recipe (:local-repo "~/.config/doom/local-packages/plz" :build t ))
(package! esxml)
;; (package! djvu)

(package! zotero)
(package! zotxt)


;;; 516
(package! boogie-friends)

;;;; Lisp/Scheme
;;(package! geiser-guile)
(package! sotlisp)
(package! highlight-defined)
(package! lisp-extra-font-lock)
(package! nameless)
;; (package! litex-mode)

;;; Prose/Org
(package! easy-hugo)
;; (package! obsidian)
(package! rainbow-delimiters)
(package! pandoc)
(package! ox-pandoc)
;; (package! htmlize)
(package! poet-theme)
;; (package! afternoon-theme)
(package! olivetti)
;; (package! org-ml)
(package! org-pandoc-import
  :recipe (:host github
           :repo "tecosaur/org-pandoc-import"
           :files ("*.el" "filters" "preprocessors")))
;; (package! default-lang :recipe (:local-repo "~/experiments/elisp/default-lang"))

;;; Programming
(package! evil-smartparens)
(package! evil-cleverparens)
(package! origami)
(package! lsp-origami)
(package! pydoc)
(package! imenu-list)
(package! igist)
(package! magit-delta)
(package! rainbow-mode)
(package! yasnippet-snippets)

;;; OPLSS
;; (package! proof-general)
;;; Language Support
;; (package! graphviz-dot-mode)
(package! fish-mode)
(package! sphinx-doc)

;; (package! jflex-mode :recipe (:local-repo "~/dotfiles/doom/local-packages/jflex-mode"))
;; (package! cup-java-mode :recipe (:local-repo "~/dotfiles/doom/local-packages/cup-java-mode"))


;;; Random toys
;; (package! blink-search)
(package! nov)
(package! tldr)
(package! info-plus)
(package! w3m)
(package! fzf)
(package! zoxide)
;; (package! dirvish)
(package! inherit-org :recipe (:host github :repo "chenyanming/inherit-org"))
;;; Mysteries
;; (package! lentic)
;; (package! symbol-overlay)



;;; Integrations
(package! brotab :recipe (:local-repo "~/experiments/elisp/brotab"))
(package! counsel-spotify)
(package! smudge)
;; (package! google-this)

;;; Nano
;; (package! nano-emacs :recipe (:type git :host github :repo "rougier/nano-emacs"))
;; (package! nano-theme)
;; (package! doom-nano-modeline
;;   :recipe (:host github
;;            :repo "ronisbr/doom-nano-modeline"))




;;; D&D
(package! org-d20)
(package! org-lookup-dnd :recipe (:local-repo "~/experiments/elisp/org-lookup-dnd" :build nil))
;; (package! dnd5e-api :recipe (:local-repo "~/experiments/elisp/dnd5e-api" :build t))
;; (package! button-lock)
(package! decide)
(package! egme :recipe (:local-repo "~/.config/doom/local-packages/egme" :build t))
(package! tarot :recipe (:local-repo "~/.config/doom/local-packages/tarot"))


;; Alphapapa Utilities
(package! prism)
(package! dogears)
;; (package! yequake)

;;; Etc
;; (package! autothemer)
(package! fireplace)
(package! denote)
(package! consult-denote)
(package! denote-explore)
(package! zetteldeft)
