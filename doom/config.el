;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

                                        ; Place your private configuration here! Remember, you do not need to run 'doom
                                        ; sync' after modifying this file!

;;; Name
                                        ; Some functionality uses this to identify you,
                                        ;
                                        ;e.g. GPG configuration, email
                                        ; clients, file templates and snippets.
(setopt user-full-name "Vivienne Goyal"
        user-mail-address "vivien.goyal@gmail.com")



;;; Theming/Fonts
                                        ; Doom exposes five (optional) variables for controlling fonts in Doom. Here
                                        ; are the three important ones:
                                        ;
                                        ; + `doom-font'
                                        ; + `doom-variable-pitch-font'
                                        ; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
                                        ;   presentations or streaming.
                                        ;
                                        ; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
                                        ; font string. You generally only need these two:
                                        ; (setopt doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
                                        ;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

                                        ; There are two ways to load a theme. Both assume the theme is installed and
                                        ; available. You can either set `doom-theme' or manually load a theme with the
                                        ; `load-theme' function. This is the default:
                                        ; (setopt doom-theme 'doom-magnus)
(setopt doom-theme 'doom-rose-pine-moon)
(setopt catppuccin-flavor 'macchiato)

(setopt doom-rose-pine-moon-brighter-text t)
(setopt doom-rose-pine-moon-brighter-comments t)
(setopt doom-rose-pine-moon-brighter-modeline nil)
(setopt doom-font (font-spec :family "Courier Prime Code" :size 16))
(setopt doom-variable-pitch-font (font-spec :family "Courier Prime" :size 17))

;;; Transparency
(set-frame-parameter nil 'alpha-background 0.98)
(add-to-list 'default-frame-alist '(alpha-background . 0.98))

;;; General Config
(setopt warning-suppress-types (append warning-suppress-types '((org-element) (org-element-cache) (org-element--cache))))
(set-popup-rule! (rx bol "*dnd5e-api-results") :size 0.3 :quit t :select t :ttl nil)
(set-popup-rule! (rx bol "*clyrics") :size 0.3 :quit t :select t :ttl nil)
(set-popup-rule! (rx bol "*tarot") :size 0.15 :quit t :select t :ttl nil)
(set-popup-rule! (rx bol "*little-ritual") :size 11 :quit t :select t :ttl nil)

(setopt doom-scratch-initial-major-mode 'org-mode)


(setopt                           ; From tecosaur I think
 delete-by-moving-to-trash t            ; Delete files to trash
 window-combination-resize t ; take new window space from all other windows (not just current)
 x-stretch-cursor t
 major-mode 'text-mode)

(setopt undo-limit 2000000               ; Raise undo-limit to 80Mb
        auto-save-visited-interval 10
        evil-want-fine-undo t ; By default while in insert all changes are one big blob. Be more granular
        auto-save-default t   ; Nobody likes to loose work, I certainly don't
        truncate-string-ellipsis "…" ; Unicode ellispis are nicer than "...", and also save /precious/ space
        password-cache-expiry nil    ; I can trust my computers ... can't I?
        scroll-margin 2
        display-line-numbers-type t
        recentf-auto-cleanup 'never
        history-delete-duplicates t
        suggest-key-bindings nil
        ranger-override-dired 'ranger
        fill-column 120                   ;or 150
        visual-fill-column-center-text t
        evil-respect-visual-line-mode nil
        )




(sp-use-paredit-bindings)
(add-to-list 'load-path "/home/vivien/.config/doom/local-packages")
(add-to-list 'auto-mode-alist '("[.]org[.]txt\\'" . org-mode))
(add-to-list 'auto-mode-alist '("[.]org[.]txt\\'" . org-mode))


;;;; Keybindings
(map! :i "M-W" #'normal-copy)
(map! :i "C-W" #'normal-cut)
(map! :i "C-Y" #'normal-paste)
(map! :nvieo "C-c 1" #'sp-unwrap-sexp)

(map! :nvieo "C--" (cmd! (text-scale-decrease 1)))
(map! :nvieo "C-+" (cmd! (text-scale-increase 1)))

(map! :leader
      (:prefix ("c" . "code")
       :desc "Comment Lines" "l" #'comment-line
       :desc "Run Make Task" "m" #'+make/run-last))

(map! :map ctl-x-map "d" #'ranger)

(map! :leader (:prefix ("h" . "help")
               :desc "TL;DR" "T" #'tldr
               :desc "Woman" "w" #'woman
               ))

;;;; Mode Declarations
(lisp-extra-font-lock-global-mode 1)
(auto-save-visited-mode 1)
(global-visual-line-mode 1)
(global-undo-tree-mode 1)
(global-hide-mode-line-mode -1)
(tab-bar-mode -1)
(electric-pair-mode 1)
(electric-indent-mode 1)

(smartparens-global-mode 1)
(show-smartparens-global-mode 1)
;; (smartparens-global-strict-mode 1)
;; (ranger-override-dired-mode t)
(display-time-mode 1)
(display-battery-mode 1)
(global-subword-mode 1)








;;; Functions


(defun display-time-update--load ()
  "")




(defalias 'normal-paste 'clipboard-yank)
(defalias 'normal-copy 'clipboard-kill-ring-save)
(defalias 'normal-cut 'clipboard-kill-region)
(defalias 'doom/delete-frame-with-prompt 'delete-frame)

(defun transparent-frame ()
  (interactive)
  (let ((val (read-minibuffer "Opacity: ")))
    (set-frame-parameter nil 'alpha-background val))
  )

(defun hugo-dated-post ()
  (interactive)
  (easy-hugo-newpost (concat (format-time-string "2530-%m-%d") ".org"))
  )

(defun compile-graphviz ()
  (interactive)
  (let* ((path (buffer-file-name))
         (base (f-base path))
         )
    (async-shell-command (format "dot -Tpng %s.dot -o %s.pdf && xdg-open %s.pdf" base base base))
    )
  )

(defun find-and-replace (from to)
  "Replaces in the current buffer all occurences of from to to (not interactively)"
  (while (re-search-forward from nil t)
    (replace-match to nil nil)))

(defun smarten-quotes ()
  (interactive)
  (find-and-replace "'" "’")          ; Apostrophe -> Right quote
  (find-and-replace "`" "‘"))            ; Backtick -> Left quote








(defun e-run-command ()
  "Run external system programs. Dmenu/Rofi-like.  Tab/C-M-i to completion
n-[b/p] for walk backward/forward early commands history."
  (interactive)
  (start-process "RUN" "RUN" (string-trim-right (read-shell-command "RUN: "))))

(defun set-buffer-font (family)
  (interactive
   (let* (
          (cmd "fc-list '' 'family'")
          (families (s-split hard-newline (shell-command-to-string cmd)))
          (chosen (completing-read "Font Family:" families nil t)))
     (list chosen)))
  (buffer-face-set `(:family ,family)))

(defun latex-update-alist ()
  "Configure the list of symbols that should be pretty-printed/rendered in Org/Latex modes"
  (interactive)
  (let* (
         (new-alist '(("\\R" . 8477)
                      ("\\N" . 8469)
                      ("\\Z" . 8484)
                      ("\\C" . 8450)
                      ("\\implies" . 8658)
                      ("\\land" . 8743)
                      ("\\lor" . 8744)
                      ("\lnot" . 172))))
    (TeX-add-to-alist 'prettify-symbols-alist new-alist)))



(defun filemanager-here ()
  "Start filemanager process in current dir"
  (interactive)
  (start-process "nemo" nil "nemo" (file-name-directory buffer-file-name)))

(defun insert-path ()
  (interactive)
  (insert (read-file-name "File: ")))

(defun reset-visual-line ()
  (interactive)
  (reset-mode #'visual-line-mode))

(defun reset-mode (mode)
  "Mode is a function"
  (funcall mode -1)
  (funcall mode 1))



;;;; Org

(defun my/enhanced-annotate ()
  "Open annotations in other window"
  (interactive)
  (unless (buffer-file-name)
    (error "This buffer has no associated file!"))
  (switch-to-buffer-other-window
   (org-annotate-file-show-section org-annotate-file-storage-file))
  (+evil/window-move-left)
  (evil-window-set-width 40))

(defun my/org-headings ()
  "Get the list of headings in an org buffer. Keys are full paths, vals are plain strings"
  (let* (
         (paths (--map  (s-chop-right 1 (org-no-properties it)) (consult-org--headings nil nil 'file)))
         (table (ht-create)))

    (--map (ht-set! table it (car (last (s-split "/" it)))) paths)
    table))

                                        ; (last (s-split "/" (s-chop-right 1 (org-no-properties it))))


(defun my/org-insert-heading-link ()
  "Let user select a heading from the buffer, insert a link to it at point"
  (interactive)
  (let* (
         (file (buffer-name))
         (heading-table (my/org-headings))
         (heading (completing-read "Select a heading: " heading-table  nil nil))
         (simplified-heading (ht-get heading-table heading))
         (link (format "[[file:%s::*%s]]" file simplified-heading)))

    (insert link)))


;;;; Lang
(defun set-lang-mode (lang)
  "Set language mode to the specified LANG"
  (set-language-environment (s-capitalize lang))
  (ispell-change-dictionary (s-downcase lang)))

(defun set-english ()
  "Set lang environment to english"
  (interactive)
  (set-lang-mode "english"))
(defun set-spanish ()
  "Set language environment to spanish"
  (interactive)
  (set-lang-mode "spanish")
  (set-input-method 'spanish-postfix)
  )
;;;; Fun
(defun display-fortune ()
  (interactive)
  (message (get-good-fortune)))

(defun dup (str)
  "Used in some themes for convenience, to specify colors in GUI/CLI modes"
  (list str str nil))

(defun make-pride-flag (str path)
  "STR must be distinct each call"
  (propertize str 'display (create-image path 'png nil :scale 0.06)))


;;;; S-Expressions
(defun yank-sexp ()
  "Copy sexp at point"
  (mark-sexp)
  (kill-ring-save))


(defun copy-sexp-as-kill (&optional arg)
  "Save the sexp following point to the kill ring.
ARG has the same meaning as for `kill-sexp'."
  (interactive "p")
  (save-excursion
    (let ((orig-point (point)))
      (forward-sexp (or arg 1))
      (kill-ring-save orig-point (point)))))

(defun output-to-screen (bufname result)
  "Create a popup and display RESULT in it."
  (with-current-buffer (get-buffer-create bufname)
    (visual-line-mode 1)
    (erase-buffer)
    (insert result)
    (display-buffer (current-buffer))))



;;;; D&D
(defun dnd-search-srd ()
  "Search markdown SRD"
  (interactive)
  (let (
        (consult-ripgrep-args "rg --glob !*.pdf --null --line-buffered --color=never --max-columns=1000 --path-separator /   --smart-case --no-heading --line-number ."))

    (consult-ripgrep "~/rpg/5e/5e-srd-split")))


(defun cypher-search-srd ()
  "Search Restructured Text SRD"
  (interactive)
  (let (
        (consult-ripgrep-args "rg -t rst --glob !*.pdf --null --line-buffered --color=never --max-columns=1000 --path-separator /   --smart-case --no-heading --line-number ."))

    (consult-ripgrep "~/rpg/cypher/cypher-system-reference")))


(defun dnd-wild-magic-roll ()
  "Roll on Wild Magic table, report result in echo area"
  (interactive)
  (let* ((l (+ 2 (random 249)))
         (fname "~/rpg/5e/5e-srd-split/wild-magic.md")
         (cmd (format "sed '%dq;d' %s" l fname)))

    (message (shell-command-to-string cmd))))

(defun coin-flip-msg ()
  (interactive)
  (message (if (zerop (mod (random 999) 2))
               "Rats (1)" "Swallows (0)")))

(defun coin-flip ()
  (interactive)
  (insert (if (zerop (mod (random 999) 2))
              " (Rats)" " (Swallows)")))



;;;; Podcasts
(defun read-podcast-meta (prompt initial)
  (lambda () (interactive)
    (let* (
           (path (concat "/home/vivien/podcast_transcripts/" initial (if (string-empty-p initial) "" "/") ) )
           (selected (read-file-name prompt path)))
      (consult-find-file selected)
      (with-current-buffer (find-buffer-visiting (expand-file-name selected))
        ))))

(defun search-podcast-meta (initial)
  (lambda () (interactive) (consult-ripgrep (concat "/home/vivien/podcast_transcripts/" initial))))

(defalias #'read-magnus (read-podcast-meta "Statement: " "magnus_archives"))
(defalias #'read-podcast (read-podcast-meta "Transcript: " ""))
(defalias #'read-penumbra (read-podcast-meta "Penumbra: " "penumbra"))
(defalias #'search-magnus (search-podcast-meta "magnus_archives"))
(defalias #'search-penumbra (search-podcast-meta "penumbra"))
(defalias #'search-podcast (search-podcast-meta ""))

;;;; Music
(defun lyric-search ()
  "Search for lyrics using Clyrics, display in popup."
  (interactive)
  (let* (
         (lines (s-split "\n" (f-read "/home/vivien/Music/database.txt")))
         (options (append lyric-history lines))
         (choice (completing-read "Search for Lyrics: " options (lambda (v) v) nil "" 'lyric-history))
         (response (shell-command-to-string (concat "lyrics "  "\"" choice "\""))))

    (output-to-screen "*cylrics*" response)))

(defun spotify-lyrics ()
  (interactive)
  (output-to-screen "*clyrics*" (shell-command-to-string "spotlyrics"))

  )






                                        ; (setopt fancy-splash-image "/home/vivien/.config/doom/assets/exaltiora-resized.jpg")
                                        ;
                                        ; - `load!' for loading external *.el files relative to this one
                                        ; - `use-package!' for configuring packages
                                        ; - `after!' for running code after a package has loaded
                                        ; - `add-load-path!' for adding directories to the `load-path', relative to
                                        ;   this file. Emacs searches the `load-path' when you load packages with
                                        ;   `require' or `use-package'.
                                        ; - `map!' for binding new keys
                                        ;
                                        ; To get information about any of these functions/macros, move the cursor over
                                        ; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
                                        ; This will open documentation for it, including demos of how they are used.
                                        ;
                                        ; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
                                        ; they are implemented.


;;; Misc variable modifications


;;;; Frequently update recentf
(setopt smudge-transport 'connect)
(remove-hook 'kill-emacs-hook #'recentf-cleanup)
(defun pdf-print-buffer-with-faces (&optional filename)
  "Print file in the current buffer as pdf, including font, color, and
underline information.  This command works only if you are using a window system,
so it has a way to determine color values.

C-u COMMAND prompts user where to save the Postscript file (which is then
converted to PDF at the same location."
  (interactive (list (if current-prefix-arg
                         (ps-print-preprint 4)
                       (concat (file-name-sans-extension (buffer-file-name))
                               ".ps"))))
  (ps-print-buffer-with-faces)
  (shell-command (concat "ps2pdf " filename))
  (delete-file filename)
  (message "Deleted %s" filename)
  (message "Wrote %s" (concat (file-name-sans-extension filename) ".pdf")))

;;; Package Config

(after! yasnippet
  (add-to-list 'yas-snippet-dirs "/home/vivien/.config/emacs/.local/straight/build-30.1/yasnippet-snippets/snippets" t))


(after! denote
  (setopt denote-directory "/home/vivien/org/denote"))
(after! consult-denote
  (consult-denote-mode 1))

(after! doom-dashboard

  (setopt fancy-splash-image "/home/vivien/.config/doom/assets/resized-one.png")

  (defun one-one-quote ()
    (let* ((path "/home/vivien/.config/doom/fortunes/one-one")
           (oddnum (lambda (upper) (+ 1 (* 2 (random (/ upper 2))))))
           (line (funcall oddnum 51))
           (cmd (format "sed '%dq;d' %s" line path)))

      (shell-command-to-string cmd)))

  (defun message-one-one ()
    "Display a One-One quote in the minibuffer"
    (interactive)
    (message (one-one-quote)))

  (defun dashboardify (fn)
    "Call TXTFN, and wrap the result in a func that displays it nicely in doom-dashboard"
    (lambda () (insert (+doom-dashboard--center (- +doom-dashboard--width 1) (propertize (funcall fn) 'face 'bold-italic 'align 'center))) (insert hard-newline)))

  (defun get-good-fortune ()
    (let* ((possibles (list "calvin" "discworld" "hitchhiker" "montypython"))
           (choice (nth (random (length possibles)) possibles))
           (command (format "fortune %s" choice))
           (txt (shell-command-to-string command)))
      txt))

  (defun dashboard-fortune ()
    (insert (+doom-dashboard--center (- +doom-dashboard--width 1) (get-good-fortune)))
    (insert hard-newline))

  (setopt +doom-dashboard-functions `(
                                      doom-dashboard-widget-banner
                                      ,(dashboardify #'one-one-quote)
                                      ;; ,(dashboardify (lambda () "Audio. Opperior. Vigilo."))
                                      doom-dashboard-widget-footer))

  )


(after! evil
  (map! :nvieo "C-n" #'next-line)
  (map! :nvieo "C-p" #'previous-line)
  (setopt evil-want-keybinding  't)
  (setopt +evil-want-o/O-to-continue-comments nil)
  (setopt evil-want-empty-ex-last-command t))

(after! lispy
  ;; (remove-hook! 'lispy-mode-hook #'turn-off-smartparens-mode)
  (map! :map lispy-mode-map "[" #'self-insert-command)
  (map! "M-k" #'kill-sexp)
  (map! "M-K" #'copy-sexp-as-kill))

(after! easy-hugo
  (setopt easy-hugo-basedir "~/p/campaigns/lodestar/logstar")
  (setopt easy-hugo-postdir "content/notes")
  (setopt easy-hugo-preview-url "http://localhost:1313/logstar")
  )

(after! obsidian
  (global-obsidian-mode)
  (obsidian-specify-path "~/p/obsidian")
  )




(after! vertico
  (setopt vertico-count 5
          )
  )

(after! orderless
  ;; (add-to-list 'orderless-matching-styles 'orderless-flex)
  (add-to-list 'completion-styles 'orderless))



(when (modulep! :completion vertico)
  (map! :leader
        (:prefix ("b" . "buffer")
         :desc "Consult Buffer" "b" #'consult-buffer
         :desc "Brotab" "t" #'brotab
         :desc "Popup Buffer" "P" #'pop-to-buffer
         )


        (:prefix ("s" . "search")
         :desc "Consult Imenu All" "I" #'consult-imenu-all
         :desc "Consult Ripgrep" "R" #'consult-ripgrep)

        (:prefix ("f" . "file")
         :desc "Open File Externally" "o" #'consult-file-externally
         :desc "Open File in HOME" "h" #'find-file-home
         :desc "Open File in WORK" "w" #'find-file-work
         :desc "Open File Manager Here" "." #'filemanager-here
         :desc "Annotate File" "a" #'my/enhanced-annotate
         :desc "Zoxide" "z" #'zoxide-find-file
         :desc "Search Globally" "g" #'global-hunt-fzf
         :desc "Search with Fd" "B" #'consult-fd
         :desc "Search with Fd everywhere" "b" #'consult-fd-home
         )

        (:prefix ("o". "open")
         :desc "Open NeoTree" "n" #'+neotree/open)



        ("SPC" #'consult-buffer)
        (:prefix ("i" . "insert")
         :desc "Insert file path"
         "P" #'insert-path)))
(after! ivy
  (setopt ivy-use-virtual-buffers t)
  (setopt ivy-file-preview-mode t))


(when (modulep! :completion ivy)
  (map! :leader
        (:prefix("b" . "buffer")
         :desc "Consult Buffer" "b" #'counsel-switch-buffer)
        (:prefix ("s" . "search")
         :desc "Consult Imenu All"
         "I" #'counsel-imenu            ; TODO
         :desc "Consult Ripgrep"
         "R" #'counsel-rg
         "v" #'counsel-set-variable
         :desc "Set Variable")

        (:prefix ("f" . "file")
         :desc "Open File Externally" "o" #'counsel-locate-action-extern
         :desc "Open File in HOME" "h" #'counsel-find-home
         :desc "Open File Manager Here" "." #'filemanager-here)

        ("SPC" #'counsel-switch-buffer)
        (:prefix ("i" . "insert")
         :desc "Insert file path"
         "P" #'insert-path)))


(after! scroll-all-mode
  (defun scroll-all-check-to-scroll ()
    "Check `this-command' to see if a scroll is to be done."
    (cond ((or (eq this-command 'evil-next-line) (eq this-command 'next-line))
	   (call-interactively 'scroll-all-scroll-down-all))
	  ((or (eq this-command 'evil-previous-line) (eq this-command 'previous-line))
	   (call-interactively 'scroll-all-scroll-up-all))
	  ((memq this-command '(scroll-up scroll-up-command evil-scroll-down evil-scroll-page-down))
	   (call-interactively 'scroll-all-page-down-all))
	  ((memq this-command '(scroll-down scroll-down-command evil-scroll-up evil-scroll-page-up))
	   (call-interactively 'scroll-all-page-up-all))
	  ((or (eq this-command 'evil-goto-first-line) (eq this-command 'beginning-of-buffer))
	   (call-interactively 'scroll-all-beginning-of-buffer-all))
	  ((or (eq this-command 'evil-goto-line) (eq this-command 'end-of-buffer))
	   (call-interactively 'scroll-all-end-of-buffer-all))))


  (map! :nvieo "C-d" #'scroll-up
        :nvieo "C-u" #'scroll-down)
  )

(after! deft
  (map! :leader (:prefix ("n" . "notes")
                 :desc "Open Deft" "x" #'deft
                 :desc "New Deft File" "D" #'deft-new-file-named
                 :desc "New (Unnamed) Deft File" "d" #'deft-new-file)))



(after! fzf
  (defun fzf-external-file (&optional directory)
    "Find file in projectile project (if used), current or specified DIRECTORY."
    (interactive)
    (let ((fzf--target-validator (fzf--use-validator
                                  (function fzf--validate-filename)))
          (d (fzf--resolve-directory directory)))
      (fzf--start d
                  (lambda (x)
                    (let ((f (expand-file-name x d)))
                      (when (file-exists-p f)
                        (consult-file-externally f)))))))

  (defun global-hunt-fzf ()
    (interactive)
    (fzf-find-file-in-dir "~"))
  )

(after! magit-delta
  (add-hook! 'magit-mode-hook (magit-delta-mode +1)))

(after! ranger
  (setopt ranger-preview-file nil))

(after! inherit-org
  (add-hook! 'inherit-org-mode-hook  (org-indent-mode -1))
  (add-hook! 'inherit-org-mode-hook (lambda () (org-indent-mode -1)))
  (add-hook! 'inherit-org-mode-hook (setopt org-indent-agentized-buffers nil))
  (add-hook! 'inherit-org (lambda! () (org-indent-mode -1))))


(after! info
  (add-hook! 'Info-mode-hook 'inherit-org-mode))

(after! w3m
  (add-hook! 'w3m-fontify-after-hook 'writeroom-mode)
  )





(after! savehist
  (defvar lyric-history '())
  (add-to-list 'savehist-additional-variables 'lyric-history))

(after! consult
  (map!
   :leader (:prefix ("y" . "Yank/Pop/Kill")
            :desc "Yank from Kill Ring" "k" #'consult-yank-from-kill-ring
            )
   )



  (add-to-list 'consult-preview-excluded-files "[a-z0-9A-Z_]?+\\.gpg")
  (setopt
   consult-ripgrep-args "rga --null --line-buffered --color=never --max-columns=1000 --path-separator /   --smart-case --no-heading --line-number ."
   consult-grep-args "egrep --null --line-buffered --color=never --ignore-case   --exclude-dir=.git --line-number -I -r .")

  (defun consult-find-file (file)
    "Open FILE."
    (interactive "fFind File: ")
    (follow-mode 1)
    (find-file (expand-file-name file))
    (follow-mode -1))

  (consult-customize consult-recent-file consult-find-file consult-buffer :preview-key 'any)

  (consult-customize find-file :preview-key (list :debounce 0.2 'any))

  (defun find-file-home ()
    "Find a file starting at the home directory"
    (interactive)
    (consult-find-file (read-file-name "Find file: " "~/")))

  (defun consult-fd-home ()
    (interactive)
    (follow-mode 1)
    (consult-fd "~")
    (follow-mode -1))

  (defun find-file-work ()
    "Find a file starting at the ~/work directory"
    (interactive)
    (consult-find-file (read-file-name "Find file: " "~/work/")))



  (defun consult-file-externally (file)
    "Open FILE using system's default application."
    (interactive "fOpen: ")
    (if (and (eq system-type 'windows-nt)
             (fboundp 'w32-shell-execute))
        (w32-shell-execute "open" target)
      (call-process (pcase system-type
                      ('darwin "open")
                      ('cygwin "cygstart")
                      (_ "xdg-open"))
                    nil 0 nil
                    (expand-file-name file))))

  (defun in-folder (path func)
    "A wrapper which takes in a consult func which operates on a project root and makes it operate on the home folder."
    (lambda (&optional &rest args)
      (interactive)
      (let ((consult-project-root-function (lambda () (expand-file-name path))))
        (apply func args))))


  (defalias #'everywhere (lambda  (f) (in-folder "~" f)))
  (defalias #'consult-imenu-all (everywhere #'consult-imenu-multi))
  (defun consult-ripgrep-all () (interactive) (consult-ripgrep "~"))

  (defalias #'consult-ripgrep-in
    (lambda ()
      (interactive)
      (let ((dir (read-file-name "Directory: " default-directory default-directory)))
                                        ; (funcall (in-folder dir #'consult-ripgrep))
        (consult-ripgrep dir))))
  )

(after! imenu-list
  (setopt imenu-list-focus-after-activation t
          imenu-list-position 'left
          imenu-list-size 0.16))


(after! vterm
  (setopt vterm-shell "/bin/fish"))


(after! projectile
  (setopt projectile-project-root-files-bottom-up
          (remove ".git" projectile-project-root-files-bottom-up)))

(after! hl-todo
  (add-to-list 'hl-todo-keyword-faces '("IDEA" warning bold))
  (add-to-list 'hl-todo-keyword-faces '("DONE" success bold))
  (setopt hl-todo-exclude-modes nil)
  (add-to-list 'hl-todo-include-modes 'org-mode)
  (add-to-list 'hl-todo-include-modes 'org-mode)
  (add-to-list 'hl-todo-text-modes 'org-mode)
  (add-to-list 'hl-todo-text-modes 'text-mode)
  )


(after! latex
  (add-to-list 'LaTeX-section-list '("cvsection" 2))
  (add-to-list 'LaTeX-section-list '("Question" 1))
  (add-to-list 'LaTeX-section-list '("Part" 2))
  (add-to-list 'LaTeX-section-list '("cvsubsection" 3))
  (add-to-list 'LaTeX-section-list '("cvsubsubsection" 4))
  )
;; (sp-local-pair '(LaTeX-mode) "`" "'")
;; (sp-local-pair '(LaTeX-mode) "$" "$")

(after! undo-tree
  (defun setup-undo-tree ()
    (setopt undo-outer-limit 24000000)
    (setopt undo-limit 160000)
    (setopt undo-strong-limit 240000))
  (setup-undo-tree)
  (add-hook 'org-mode-hook #'setup-undo-tree))

(after! tree-sitter
  (add-to-list 'tree-sitter-load-path "/usr/lib/tree_sitter")
  (add-to-list 'tree-sitter-load-path "/usr/local/lib/")
  )

(after! writeroom-mode
  (setopt writeroom-mode-line t)
  )

(after! book-mode
  (remove-hook 'python-mode-hook 'book-mode)
  (remove-hook 'emacs-lisp-mode-hook 'book-mode)
  (advice-add 'book-mode :after (lambda () (doom-modeline-mode 1) (setopt hl-line-range-function nil)))
  (advice-add 'book-mode-hl-line-range-function :around #'hl)
  (setopt book-mode-left-margin 7)
  (setopt book-mode-right-margin 7)
  )

(after! imenu
  (map! :nvieo "C-'" #'imenu-list-smart-toggle)
  )

(after! evil-org
  (defun evil-org-beginning-of-line ()
  ;;; Sensible behaviour
    (interactive)
    (beginning-of-line))
  )
(after! org

  ;; (let ((base8 "#606F73"))
  ;;   (custom-set-faces!
  ;;     `(org-headline-done :foreground ,base8))
  ;;   )

  (setopt org-directory "~/org")
  (setopt org-startup-indented t)
  (setopt org-export-with-smart-quotes t)

  (add-to-list 'org-structure-template-alist (cons "t" "theorem"))
  (add-to-list 'org-structure-template-alist (cons "p" "proof"))
  (add-to-list 'org-structure-template-alist (cons "i" "idea"))
  (add-to-list 'org-structure-template-alist (cons "L" "lemma"))

  (sp-local-pair '(org-mode) "$" "$")

  (map!
   :map org-mode-map
   :nvieo
   "M-p" #'org-latex-export-to-pdf) ;; TODO a better one
  (set-company-backend! 'org-mode '(:separate company-dabbrev company-ispell))

  (add-hook 'org-mode-hook #'org-fold-hide-drawer-all)
  ;; (add-hook! 'org-mode-hook (diff-hl-mode -1))
  (add-hook! 'org-mode-hook (smartparens-strict-mode -1))
  (setopt org-pretty-entities nil)

  (setopt org-agenda-files (list "~/docs/Writing/Phone/todo.org"))

  (setopt org-read-date-popup-calendar nil)
  (add-hook 'org-mode-hook #'org-indent-mode)
  ;; (add-hook! 'org-mode-hook (smartparens-strict-mode -1))

  (setopt org-list-demote-modify-bullet
          '(("+" . "-") ("-" . "+") ("*" . "+")))
  ;; (setopt org-edit-src-auto-save-idle-delay 300)
  (setopt org-insert-heading-respect-content nil)

  (map! :map org-mode-map :localleader
        (:prefix ("s" . "tree/subtree")
         :desc "Copy Tree" "c" #'org-copy-subtree
         :desc "Clone Tree" "C" #'org-clone-subtree-with-time-shift)
        (:prefix ("l" . "links")
         :desc "Insert Link to Heading" "h" #'my/org-insert-heading-link)

        :desc "Mark Ring Goto" "&" #'org-mark-ring-goto)

  ;; (use-package! org-pandoc-import)

  (setopt org-pandoc-options-for-markdown '((wrap . "none"))))
(setopt org-pandoc-options-for-markdown_mmd '((wrap . "none")))
(setopt org-pandoc-options-for-markdown_strict '((wrap . "none")))
(setopt org-pandoc-options-for-commonmark '((wrap . "none")))

(after! file-templates
  (setopt +file-templates-alist (-remove-item '(org-mode) +file-templates-alist))
  )

(after! markdown-mode
  ;; Optimised for rosepine
  (setopt
   markdown-enable-wiki-links nil
   markdown-enable-html nil
   markdown-header-scaling nil
   markdown-fontify-whole-heading-line nil
   markdown-marginalize-headers nil
   markdown-nested-imenu-heading-index nil
   markdown-hide-markup nil)

  (let* (
         (red "#eb6f92")
         (teal "#3e8fb0")
         (gold "#f6c177")
         )
    (custom-set-faces!
      `(markdown-header-delimiter-face :foreground "#616161" :height 0.9)
      `(markdown-header-face-1 :foreground ,gold :weight extra-bold :height 1.6)
      `(markdown-header-face-2 :foreground ,red :weight extra-bold :height 1.4)
      `(markdown-header-face-3 :foreground ,teal :weight extra-bold :height 1.2)
      `(markdown-header-face-4 :foreground ,(doom-lighten gold 0.25) :weight bold :height 1.1)
      `(markdown-header-face-5 :foreground ,(doom-lighten red 0.25) :weight bold )
      `(markdown-header-face-6 :foreground ,(doom-lighten teal 0.25) :weight bold )
      )
    )
  )


(after! json
  (map! :map json-mode-map :localleader
        (:desc "counsel-jq" "q" #'counsel-jq)))

(setopt asm-comment-char 35)


(after! ox-latex
  (setopt org-latex-minted-options '(("breaklines"))
          )
  ;; (setopt org-latex-pdf-process "xelatex -shell-escape -interaction nonstopmode %f")
  (setopt org-latex-pdf-process
          '("lualatex -interaction nonstopmode -shell-escape %f"
            "lualatex -interaction nonstopmode -shell-escape %f")) ;; for multiple passes
  (setopt org-latex-compiler "lualatex")
  (add-to-list 'org-latex-classes
               '("extarticle"
                 "\\documentclass{extarticle}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))



  (add-to-list 'org-latex-classes
               '("mla"
                 "\\documentclass{mla}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
  (add-to-list 'org-latex-classes
               '("altacv"
                 "\\documentclass{altacv}"
                 ("\\section{%s}" . "\\cvsection*{%s}")
                 ("\\subsection{%s}" . "\\cvsubsection*{%s}")
                 ("\\subsubsection{%s}" . "\\cvsubsubsection*{%s}")))

  (add-to-list 'org-latex-classes
               '("dndbook"
                 "\\documentclass{extarticle}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))


  (add-to-list 'org-latex-packages-alist '("" "minted"))
  (setopt org-latex-listings 'minted)

  (setopt org-src-fontify-natively t))



(after! babel
  (add-to-list 'org-babel-tangle-lang-exts '("python" . "py"))
  (add-to-list 'org-babel-tangle-lang-exts '("elixir" . "ex")))



(after! org-lookup-dnd
  (setopt
   completion-ignore-case t
   org-lookup-dnd-sources
   ' (
      ("/home/vivien/rpg/5e/core/phb.pdf" 1 4 4 t)
      ("/home/vivien/rpg/5e/core/Monster Manual.pdf" 1 4 4 nil)
      ("/home/vivien/rpg/5e/core/dmg.pdf" 1 1 1 t)
      ("/home/vivien/rpg/5e/unofficial/City_and_Wild.pdf" 0 2 2 nil)
      ("/home/vivien/rpg/5e/expansion/Volo's Guide to Monsters.pdf" 1 1 1 t)
      ("/home/vivien/rpg/5e/expansion/mordenkainens-tome-of-foes.pdf" 1 1 1 t)
      ("/home/vivien/rpg/5e/character options/COFSA The Compendium of Forgotten Secrets - Awakening (Abridged).pdf" 0 3 3 t))))


(after! geiser
  (setopt geiser-scheme-implementation 'mit)
  (add-hook 'scheme-mode-hook #'run-geiser))

(after! clojure-mode
  (add-hook! 'clojure-mode-hook (smartparens-mode 1))
  (add-hook! 'clojure-mode-hook (if (cider-sessions) (cider-connect-sibling-clj nil) (cider-jack-in-clj nil))))


(after! doom-modeline
  (setopt doom-modeline-support-imenu t
          doom-modeline-hud t
          doom-modeline-unicode-fallback t
          doom-modeline-env-version t
          doom-modeline-enable-word-count t
          doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode)
          doom-modeline-total-line-number t
          doom-modeline-time t
          doom-modeline-time-icon t

          doom-modeline-buffer-encoding nil
          doom-modeline-battery t
          doom-modeline-time-analogue-clock nil
          doom-modeline-time-live-icon nil
          doom-modeline-irc nil
          doom-modeline-project-detection 'auto
          )
  (let* ((vi (propertize "‍🏳️‍⚧️ " 'face 'bold-italic))
         (flag-names (reverse (list "asexual" "nonbinary" "gender-queer" "transgender" "pride")))
         (flags (-map (lambda (name) (make-pride-flag name (format "/home/vivien/.config/doom/assets/pride-emoji-flags/png/%s-flag.png" name))) flag-names)))
    (add-to-list 'mode-line-misc-info vi)
    ))



(after! igist
  (setopt igist-current-user-name "ViWilde"
          igist-auth-marker 'igist))


;;; Enable folding
(after! origami
  (map! :map origami-mode-map
        :nv  "z o" #'origami-open-node
        :nv "z O" #'origami-open-node-recursively
        :nv  "z c" #'origami-close-node
        :nv "z m" #'origami-close-all-nodes
        :nv "z r" #'origami-open-all-nodes
        :nv     "z a" #'origami-toggle-node
        :nv  "z j" #'origami-next-fold
        :nv "z k" #'origami-previous-fold
        :nv "z n" #'origami-show-only-node
        )
  )
(setopt lsp-enable-folding t)
;; (use-package! lsp-origami)
(add-hook 'lsp-after-open-hook #'lsp-origami-try-enable)


;;;; Hooks


;; (add-hook! 'latex-mode-hook (smartparens-mode -1))
(add-hook! 'doom-init-ui-hook  (defalias 'doom/delete-frame-with-prompt 'delete-frame))
(add-hook 'pdf-tools-enabled-hook #'pdf-view-midnight-minor-mode)
;; (add-hook! pdf-tools-enabled-hook #'hide-mode-line-mode)

;;;; Prose
(setopt +zen-mixed-pitch-modes nil)
;; Orig val: (adoc-mode rst-mode markdown-mode org-mode) ;; 
(add-hook 'org-mode-hook #'+zen/toggle)

(add-hook 'text-mode-hook #'auto-save-visited-mode)
(add-hook 'text-mode-hook #'visual-line-mode)
(add-hook 'text-mode-hook #'hl-todo-mode)
(add-hook! 'text-mode-hook (display-line-numbers-mode -1))
(add-hook! 'org-mode-hook (display-line-numbers-mode -1))
(after! agda-input
  (add-hook! 'org-mode-hook (set-input-method "Agda"))
  (add-hook! 'agda-mode-hook (set-input-method "Agda"))
  )


;;;; Programming
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'auto-save-visited-mode)
(add-hook 'prog-mode-hook #'hl-todo-mode)
(add-hook! 'prog-mode (display-line-numbers-mode 1))
(add-hook! 'emacs-lisp-mode-hook #'eldoc-mode)
(add-hook! 'emacs-lisp-mode-hook #'nameless-mode)
(add-hook! 'emacs-lisp-mode-hook #'highlight-defined-mode)
(add-hook 'lisp-interaction-mode-hook #'eldoc-mode)
(add-hook 'ielm-mode-hook #'eldoc-mode)


(after! smartparens
  ;; (add-hook! 'smartparens-mode-hook #'evil-cleverparens-mode)
  (add-hook 'smartparens-mode-hook #'evil-smartparens-mode)
  (add-hook! 'smartparens-disabled-hook (evil-smartparens-mode -1))
  (add-hook! 'smartparens-disabled-hook (lambda () (evil-cleverparens-mode -1)))
  (sp-local-pair '(tsx-ts-mode typescript-mode typescript-ts-mode) "<" ">" )
  )

;;;; Proofs
(add-hook! 'coq-mode-hook (proof-goto-point))
(add-hook! 'coq-mode-hook (proof-electric-terminator-enable t))

;;;; Python
(with-eval-after-load 'python
  (set-formatter! 'ruff :modes '(python-mode python-ts-mode)))

(setopt python-shell-interpreter "ipython3"
        python-shell-interpreter-args "--simple-prompt --pprint")


(setopt +python-ipython-repl-args '("-i" "--simple-prompt"))
(setopt +python-ipython-command '("ipython" "-i" "--simple-prompt"))


(add-hook 'python-mode-hook #'sphinx-doc-mode)
(map! :map python-mode-map :leader (:prefix ("c" . "code")
                                    :desc "Next Func" "n" #'python-nav-forward-defun
                                    :desc "Previous Func" "p" #'python-nav-backward-defun
                                    ))



                                        ; From Tecosaur, allows LSP to work in source blocks
(cl-defmacro lsp-org-babel-enable (lang)
  "Support LANG in org source code block."
  ;; (setopt centaur-lsp 'lsp-mode)
  (cl-check-type lang string)
  (let* ((edit-pre (intern (format "org-babel-edit-prep:%s" lang)))
         (intern-pre (intern (format "lsp--%s" (symbol-name edit-pre)))))
    `(progn
       (defun ,intern-pre (info)
         (let ((file-name (->> info caddr (alist-get :file))))
           (unless file-name
             (setopt file-name (make-temp-file "babel-lsp-")))
           (setopt buffer-file-name file-name)
           (lsp-deferred)))
       (put ',intern-pre 'function-documentation
            (format "Enable lsp-mode in the buffer of org source block (%s)."
                    (upcase ,lang)))
       (if (fboundp ',edit-pre)
           (advice-add ',edit-pre :after ',intern-pre)
         (progn
           (defun ,edit-pre (info)
             (,intern-pre info))
           (put ',edit-pre 'function-documentation
                (format "Prepare local buffer environment for org source block (%s)."
                        (upcase ,lang))))))))
(defvar org-babel-lang-list
  '("go" "python" "ipython" "bash" "sh" "elixir" "ruby"))
(dolist (lang org-babel-lang-list)
  (eval `(lsp-org-babel-enable ,lang)))


(after! treemacs
  (setopt treemacs-show-cursor t))

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(after! nov
  (setopt nov-text-width t)
  (add-hook! 'nov-mode-hook (setopt fill-column 120))
  (add-hook 'nov-mode-hook #'variable-pitch-mode)
  (add-hook 'nov-mode-hook #'visual-line-mode)
  (add-hook 'nov-mode-hook #'visual-fill-column-mode)
  )


;; todo system
(setopt vi/todo-file "~/p/markor/todo.org")
(defun vi/open-todo-file ()
  (interactive)
  (find-file vi/todo-file))
(defun vi/insert-todo ()
  (interactive)
  (let ((item (read-from-minibuffer "TODO: "))) (with-current-buffer (vi/open-todo-file)
                                                  (insert item ))))

;;;; Use-package declarations
(use-package! egme)
                                        ; (use-package! brotab)
(use-package! tarot)
(use-package! agda-input)

(load! "/home/vivien/experiments/elisp/rp-mode.el")

;;;; Custom Key Groups
(map!
 :leader

 (:prefix-map ("z" . "Spotify")
  :desc "Next Track" "l" #'counsel-spotify-next
  :desc "Previous Track" "h" #'counsel-spotify-previous
  :desc "Play/Pause" "/" #'counsel-spotify-toggle-play-pause
  :desc "Playlist" "p" #'counsel-spotify-search-playlist
  :desc "Album" "a" #'counsel-spotify-search-album
  :desc "Track" "t" #'counsel-spotify-search-track
  :desc "Tracks by Album" "A" #'counsel-spotify-search-tracks-by-album
  :desc "Artist" "m" #'counsel-spotify-search-tracks-by-artist
  )


 (:prefix ("d" . "D&D")
  :desc "Lookup in PDFs" "l" #'org-lookup-dnd-at-point
  :desc "Lookup in API" "a" #'dnd5e-api-search
  :desc "Roll d20" "d" #'org-d20-d20
  :desc "Roll dice" "r" #'org-d20-roll
  :desc "Lookup in D&D SRD" "s" #'dnd-search-srd
  :desc "Lookup in Cypher SRD" "v" #'cypher-search-srd
  :desc "Roll on the Wild Magic table" "w" #'dnd-wild-magic-roll
  :desc "Flip a Binary Coin" "f" #'coin-flip
  :desc "Draw a Card" "c" #'draw-card
  :desc "Draw a Tarot Card" "t" #'draw-tarot
  :desc "Draw a Major Arcana Card" "m" #'draw-major-arcana
  :desc "Draw a Minor Arcana Card" "M" #'draw-minor-arcana
  )

 (:prefix ("l" . "Lookup in API")
  :desc "Monsters" "m m" #'dnd5e-api-search-monsters
  :desc "Spells" "s" #'dnd5e-api-search-spells
  :desc "Races" "r a" #'dnd5e-api-search-races
  :desc "Rules" "r u" #'dnd5e-api-search-rules
  :desc "Features" "f" #'dnd5e-api-search-features
  :desc "Traits" "t" #'dnd5e-api-search-traits
  :desc "Classes" "c l" #'dnd5e-api-search-classes
  :desc "Equipment" "e" #'dnd5e-api-search-equipment
  :desc "Languages" "l" #'dnd5e-api-search-languages
  :desc "Conditions" "c o" #'dnd5e-api-search-conditions
  :desc "Magic Items" "m i" #'dnd5e-api-search-magic-items
  :desc "Rule Sections" "r s" #'dnd5e-api-search-rule-sections
  :desc "Generic" "RET" #'dnd5e-api-search)

 (:prefix ("e" . "Emacs GameMaster")
  :desc "Roll Dice" "r" #'egme-roll-dice
  :desc "Oracle" "q" #'egme-y-n-oracle
  :desc "Add NPC" "n" #'egme-add-npc
  :desc "Delete NPC" "N" #'egme-delete-npc
  :desc "Add Thread" "t" #'egme-add-thread
  :desc "Delete Thread" "T" #'egme-delete-thread
  :desc "Dashboard" "d" #'egme-toggle-dash
  :desc "Draw Card" "c" #'insert-card
  :desc "Draw Tarot/Oracle Card" "o" #'insert-tarot
  :desc "Draw Major Arcana" "m" #'insert-major-arcana
  :desc "Draw Minor Arcana" "m" #'insert-minor-arcana
  )

 (:prefix ("v" . "Vivien")
  :desc "Display Fortune" "f" #'display-fortune
  :desc "Obsidian Create" "o" #'obsidian-capture
  :desc "Obsidian Open" "O" #'obsidian-jump
  :desc "Read A Statement" "r m" #'read-magnus
  :desc "Read A Case from Juno Steel" "r j" #'read-penumbra
  :desc "Read a Podcast Transcript" "r p" #'read-podcast
  :desc "Search the Archives" "s m" #'search-magnus
  :desc "Search Juno's Case Notes" "s p" #'search-penumbra
  :desc "Browse Song Lyrics" "L" #'lyric-search
  :desc "Spotify Lyrics" "l" #'spotify-lyrics
  :desc "Search the Web" "w" #'w3m-search-new-session
  :desc "Speak with the Doctor" "d" #'doctor
  :desc "Create a Gist" "g" #'igist-create-new-gist
  :desc "Copy Gist Url" "G" #'igist-copy-gist-url
  :desc "Play a Little Rituals Game" "R" #'little-ritual
  :desc "Create Todo Item" "t" #'vi/insert-todo
  :desc "Open Todo File" "T" #'vi/open-todo-file
  :desc "I, Python" "p" #'+python/open-ipython-repl
  )
 (:prefix ("r" . "Denote")
  :desc "New Note" "n" #'denote-open-or-create
  :desc "New Note in Subdirectory" "N"  #'denote-create-note-in-subdirectory
  :desc "Link" "l" #'denote-insert-link
  :desc "Search" "s" #'consult-denote-find
  )
 )
