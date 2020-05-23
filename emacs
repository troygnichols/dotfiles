;;; package --- Summary
;; .emacs - the big emacs config file

(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(package-refresh-contents)

(unless (package-installed-p 'evil)
  (package-install 'evil))
;; Make sure C-u (vim page up) works
(setq evil-want-C-u-scroll t)
(require 'evil)
;; (evil-mode 1)

(unless (package-installed-p 'projectile-rails)
 (package-install 'projectile-rails))

(unless (package-installed-p 'neotree)
 (package-install 'neotree))

(unless (package-installed-p 'avy)
 (package-install 'avy))

;; Disable some UX stuff
(tool-bar-mode -1)
(toggle-scroll-bar -1)

(set-face-attribute 'region nil :background "#666")

(set-cursor-color "#ffffff")

(add-to-list 'exec-path "/usr/local/bin")
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(set-keyboard-coding-system nil)

;; usable on osx and windows
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'alt)
(setq mac-right-option-modifier 'super)
(setq w32-get-true-file-attributes nil)
(setq vc-handled-backends nil)
(remove-hook 'find-file-hooks 'vc-find-file-hook)

;; Use spaces not tabs
(setq-default indent-tabs-mode nil)
(setq tab-always-indent 'complete)
;; Make tab key do indent first then completion
(setq-default tab-always-indent 'complete)

;; Switch to previous buffer like vim
(defun switch-to-last-buffer()
  "Switch to previous buffer."
  (interactive)
  (switch-to-buffer nil))
(global-set-key (kbd "C-^") 'switch-to-last-buffer)

;; Enable moving between windows with S-<arrow keys>
(windmove-default-keybindings)
;; Also move between windows with M-<arrow keys>
(windmove-default-keybindings 'meta)
;; Also use vim-like key bindings for window movement
(global-set-key (kbd "C-c C-w C-h") 'windmove-left)
(global-set-key (kbd "C-c C-w C-j") 'windmove-down)
(global-set-key (kbd "C-c C-w C-k") 'windmove-up)
(global-set-key (kbd "C-c C-w C-l") 'windmove-right)
;; Duplicate line
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y\C-p")

;; Navigating by line
;; (global-set-key (kbd "C-;") 'avy-goto-line)
(global-set-key (kbd "C-;") 'ace-jump-line-mode)
(global-set-key (kbd "C-:") 'goto-line)

;; Show line numbers
;; (global-display-line-numbers-mode)

;; Enable ido mode everywhere
(setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)
(ido-mode 0)
(setq ido-use-filename-at-point 'guess)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face (quote default))
 '(css-indent-offset 2)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (solarized-gruvbox-dark)))
 '(custom-safe-themes
   (quote
    ("51956e440cec75ba7e4cff6c79f4f8c884a50b220e78e5e05145386f5b381f7b" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "f9cae16fd084c64bf0a9de797ef9caedc9ff4d463dd0288c30a3f89ecf36ca7e" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" "f2b56244ecc6f4b952b2bcb1d7e517f1f4272876a8c873b378f5cf68e904bd59" "3c7eef027f94956ea194aafa537c78098ab4cd907a2bb11b0e6c5f42e8a95750" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "9efb2d10bfb38fe7cd4586afb3e644d082cbcdb7435f3d1e8dd9413cbe5e61fc" "9f15d03580b08dae41a1e5c1f00d1f1aa99fea121ca32c28e2abec9563c6e32c" "56911bd75304fdb19619c9cb4c7b0511214d93f18e566e5b954416756a20cc80" "4e764943cc022ba136b80fa82d7cdd6b13a25023da27528a59ac61b0c4f1d16f" "a92e9da0fab90cbec4af4a2035602208cebf3d071ea547157b2bfc5d9bd4d48d" "c59ed2bceca3ba0c01a7689cb9067c9b7f11924aaad98ed4b0c1f0818e542a92" "1526aeed166165811eefd9a6f9176061ec3d121ba39500af2048073bea80911e" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "d71aabbbd692b54b6263bfe016607f93553ea214bc1435d17de98894a5c3a086" "9b01a258b57067426cc3c8155330b0381ae0d8dd41d5345b5eddac69f40d409b" "6177ecbffb8f37756012c9ee9fd73fc043520836d254397566e37c6204118852" "379a804655efccc13a3d446468992bfdfc30ff27d19cfda6f62c7f9c9e7a8a7d" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "3577ee091e1d318c49889574a31175970472f6f182a9789f1a3e9e4513641d86" "82360e5f96244ce8cc6e765eeebe7788c2c5f3aeb96c1a765629c5c7937c0b5b" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "54cf3f8314ce89c4d7e20ae52f7ff0739efb458f4326a2ca075bf34bc0b4f499" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "93ed23c504b202cf96ee591138b0012c295338f38046a1f3c14522d4a64d7308" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "fe94e2e42ccaa9714dd0f83a5aa1efeef819e22c5774115a9984293af609fce7" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "123a8dabd1a0eff6e0c48a03dc6fb2c5e03ebc7062ba531543dfbce587e86f2a" "e1d09f1b2afc2fed6feb1d672be5ec6ae61f84e058cb757689edb669be926896" "a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" default)))
 '(electric-pair-mode t)
 '(fci-rule-color "#073642")
 '(frame-background-mode (quote dark))
 '(fringe-mode nil nil (fringe))
 '(global-magit-file-mode nil)
 '(global-subword-mode t)
 '(global-superword-mode t)
 '(helm-buffers-fuzzy-matching t)
 '(helm-completion-style (quote emacs))
 '(helm-imenu-fuzzy-match t)
 '(helm-mode-fuzzy-match t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (quote
    ("#3b6b40f432d6" "#07b9463c4d36" "#47a3341e358a" "#1d873c3f56d5" "#2d86441c3361" "#43b7362d3199" "#061d417f59d7")))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#5b7300" . 20)
     ("#007d76" . 30)
     ("#0061a8" . 50)
     ("#866300" . 60)
     ("#992700" . 70)
     ("#a00559" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#866300" "#992700" "#a7020a" "#a00559" "#243e9b" "#0061a8" "#007d76" "#5b7300")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
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
     ("\\?\\?\\?+" . "#dc752f"))))
 '(ido-mode nil nil (ido))
 '(jdee-db-active-breakpoint-face-colors (cons "#222228" "#40B4C4"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#222228" "#74DFC4"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#222228" "#4E415C"))
 '(line-number-mode t)
 '(lsp-ui-doc-border "#93a1a1")
 '(neo-theme (quote nerd))
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#5b7300" "#b3c34d" "#0061a8" "#2aa198" "#d33682" "#6c71c4")))
 '(objed-cursor-color "#964C7B")
 '(package-selected-packages
   (quote
    (change-inner prettier-js jq-format json-mode doom-themes spacemacs-theme company-quickhelp vterm egg-timer multiple-cursors ng2-mode robe robots-txt-mode ruby-hash-syntax ruby-interpolation ruby-tools anzu goto-char-preview emmet-mode helm-spotify-plus smartparens slack company tide cliphist fzf ag helm-ag helm-projectile helm-switch-shell helm-taskswitch helm-themes yasnippet-snippets yasnippet csv-mode highlight-parentheses rubocop jq-mode restclient exec-path-from-shell iy-go-to-char pdf-tools dired-sidebar evil-surround zenburn-theme gruvbox-theme ruby-end ruby-electric ace-jump-mode projectile-rails ac-inf-ruby expand-region chruby bundler which-key solarized-theme rspec-mode magit yaml-mode helm markdown-mode go-mode highlight-indentation typescript-mode neotree evil avy)))
 '(pdf-view-midnight-colors (quote ("#fdf4c1" . "#32302f")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(rustic-ansi-faces
   ["#27212E" "#964C7B" "#74DFC4" "#FFE261" "#40B4C4" "#EB64B9" "#B4DCE7" "#FFFFFF"])
 '(sentence-end-double-space nil)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tide-always-show-documentation t)
 '(tide-completion-detailed nil)
 '(tide-server-max-response-length 307200)
 '(typescript-indent-level 2)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4366eb20b4")
     (60 . "#c1167942154f")
     (80 . "#b58900")
     (100 . "#a6ae8f7c0000")
     (120 . "#9ed892380000")
     (140 . "#96be94cf0000")
     (160 . "#8e5397440000")
     (180 . "#859900")
     (200 . "#77679bfc4635")
     (220 . "#6d449d465bfd")
     (240 . "#5fc09ea47092")
     (260 . "#4c68a01784aa")
     (280 . "#2aa198")
     (300 . "#303498e7affc")
     (320 . "#2fa1947cbb9b")
     (340 . "#2c879008c736")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#a7020a" "#dc322f" "#5b7300" "#859900" "#866300" "#b58900" "#0061a8" "#268bd2" "#a00559" "#d33682" "#007d76" "#2aa198" "#839496" "#657b83")))
 '(which-key-idle-delay 0.3)
 '(window-divider-default-right-width 1)
 '(window-divider-mode nil)
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#002b36" :foreground "#839496" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Menlo"))))
;;  '(window-divider ((t (:foreground "gray35" :width condensed))))
;;  '(window-divider-first-pixel ((t nil))))

;; setup projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-project-search-path '("~/Code"))

;; projectile-rails
(projectile-rails-global-mode)

;; setup neotree

;; make a custom keymap for neotree commands
(global-set-key (kbd "C-c n n") 'neotree-toggle)
(global-set-key (kbd "C-c n f") 'my-neotree-find-in-project-dir)


;; (global-set-key (kbd "C-c n") 'neotree-toggle)
;; (global-set-key (kbd "C-c nf") 'my-neotree-find-in-project-dir)

;; similar to find-file-in-project
(defun my-neotree-find-in-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))

;; disable audible bell sound
(setq ring-bell-function 'ignore)

;; faster quit
(fset 'yes-or-no-p 'y-or-n-p)


;;;;;;;;;;;;;;;;;;;;;;
;; Misc keybindings ;;
;;;;;;;;;;;;;;;;;;;;;;

;; Upcase a single character
(global-set-key (kbd "C-c u") 'upcase-char)

;; Downcase a single character
(global-set-key (kbd "C-c d") 'downcase-dwim)

;; Revert/refresh the current buffer
(global-set-key (kbd "<f5>") 'revert-buffer)

;; Open magit git interface
(global-set-key (kbd "M-g M-g") 'magit)

;; Align text (should select a region first)
(global-set-key (kbd "C-c a") 'align)

;; Switch to other window
(global-set-key (kbd "M-o") 'other-window)

;; join line to following line
(global-set-key (kbd "C-c C-j")
            (lambda ()
                  (interactive)
                  (join-line -1)))

;; join line to previous line
(global-set-key (kbd "C-c J")
                ;; join to prev line
                (lambda ()
                  (interactive)
                  (join-line 1)))

;; cliphist - make Emacs work with Flycut (Mac clipboard manager)
(global-set-key (kbd "C-M-y")
                (lambda ()
                  (interactive)
                  (cliphist-paste-item)))

;; edit the emacs config file
(global-set-key (kbd "C-c e")
                (lambda ()
                  (interactive)
                  (find-file "~/.emacs")))



;; spotify playback
(global-set-key (kbd "C-c s p") 'helm-spotify-plus-toggle-play-pause)
(global-set-key (kbd "C-c s n") 'helm-spotify-plus-next)
(global-set-key (kbd "C-c s N") 'helm-spotify-plus-previous)

;; in ruby mode: find file under cursor TODO
(add-hook 'enh-ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c r f") 'projectile-rails-goto-file-at-point)))

;; In rspec-compilation mode (mode when running an rspec test),
;; use following binding to enable debugging. This disables read-only mode
;; and runs inf-ruby-switch-from-compilation to allow user input
;; into a debugger e.g. pry.
(add-hook 'rspec-compilation-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c r d") 'my-rspec-enable-debugging)))

(defun my-rspec-enable-debugging ()
  "Enable debugging in an rspec compilation window"
  (interactive)
  (read-only-mode 0)
  (inf-ruby-switch-from-compilation))

;; Set transparency of emacs

;; interactive function to set transparency manually via M-x set-transparency
(defun set-transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

;; transparency presets

;; create several non-interactive functions like set-transparency-100 set-transparency-95...
(mapcar
 (lambda (perc)
   (defalias (intern (concat "set-transparency-" (number-to-string perc)))
     `(lambda () (interactive) (set-frame-parameter (selected-frame) 'alpha ,perc))))
 '(100 95 90 85 80 75 70 65 60 55))

;; map transparency preset keys
(global-set-key (kbd "C-c v 0") 'set-transparency-100)
(global-set-key (kbd "C-c v 9") 'set-transparency-95)
(global-set-key (kbd "C-c v 8") 'set-transparency-90)
(global-set-key (kbd "C-c v 7") 'set-transparency-85)
(global-set-key (kbd "C-c v 6") 'set-transparency-80)
(global-set-key (kbd "C-c v 5") 'set-transparency-75)
(global-set-key (kbd "C-c v 4") 'set-transparency-70)
(global-set-key (kbd "C-c v 3") 'set-transparency-65)
(global-set-key (kbd "C-c v 2") 'set-transparency-60)
(global-set-key (kbd "C-c v 1") 'set-transparency-55)



;; Helm
(require 'helm-config)
(helm-mode 1)

;; Override default M-x with helm's replacement
(global-set-key (kbd "M-x") 'helm-M-x)

;; helm recent files
(global-set-key (kbd "C-c h r") 'helm-recentf)

;; helm switch project
(global-set-key (kbd "C-c h p") 'helm-projectile-switch-project)

;; helm projectile ag (grep with ag silver searcher in projectile project)
(global-set-key (kbd "C-c h a") 'helm-projectile-ag)

;; Replace default imenu with helm version
(global-set-key (kbd "M-i") 'helm-imenu)

;; Use Helm mini instead of standard buffer menu
(global-set-key (kbd "C-x b") 'helm-mini)

;; Helm bookmarks
(global-set-key (kbd "C-c b") 'helm-filtered-bookmarks)


;; auto pair brackets
(setq electric-pair-mode 1)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c M-g") 'global-magit-file-mode)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)

;; evil mode setup
(define-key evil-insert-state-map (kbd "C-c C-c") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "C-g C-g") 'evil-normal-state)

;; expand-region - expand selection out to semantic "container" (e.g. content inside quotes)
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; change-inner - change inner text, like ci in vim
(require 'change-inner)
(global-set-key (kbd "C-c c i") 'change-inner)
(global-set-key (kbd "C-c c o") 'change-outer)

;; enable which-key (show available commands in temporary buffer)
(which-key-mode 1)

;; Make pry work with rspec-mode (https://github.com/pezra/rspec-mode/#debugging)
(add-hook 'after-init-hook 'inf-ruby-switch-from-compilation)

;; ace-jump-mode (jump to words or characters easily)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; delete extra witespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; enable winner mode
(winner-mode 1)
;; alternate winner commands (default are C-c <left> and C-c <right>)
(global-set-key (kbd "C-(") 'winner-undo)
(global-set-key (kbd "C-)") 'winner-redo)

;; makes % match text objects from a variety of languages, .e.g
;; html: <div></div>, ruby: do...end, etc
(require 'evil-matchit)
(global-evil-matchit-mode 1)

;; set default ruby version with chruby
(chruby-use "2.6.6")

;; use enhanced ruby mode (enh-ruby-mode) for all ruby files
(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; alignment
(defun align-to-colon (begin end)
  "Align region BEGIN to END to colon (e.g. ruby hashes."
  (interactive "r")
  (align-regexp begin end
                (rx ":" (group (zero-or-more (syntax whitespace))) ) 1 1 ))

(defun align-left-char (begin end char)
  "Align region BEGIN to END to CHAR, keeping CHAR on the left."
  (interactive "r\nsAlign region left to regexp: ")
  (align-regexp begin end (concat char "\\(\\s-*\\)") 1 1
                (y-or-n-p "Repeat throughout line? ")))


;; iy-go-to-char (these really only make sense outside of evil-mode)
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
; (global-set-key (kbd "C-c ;") 'iy-go-to-or-up-to-continue)
; (global-set-key (kbd "C-c ,") 'iy-go-to-or-up-to-continue-backward)

(global-set-key (kbd "C-c t") 'iy-go-up-to-char)
(global-set-key (kbd "C-c T") 'iy-go-up-to-char-backward)

;; start emacs server on startup
(defun run-server ()
  "Run the Emacs server if it is not running."
  (require 'server)
  (unless (server-running-p)
    (server-start)))

(run-server)

;; setup shell startup variables
(defun copy-shell-environment-variables ()
  "Copy  the shell environment if we are running on a Mac."
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(copy-shell-environment-variables)

;; enable show-paren mode - highlight matching parentheses
(show-paren-mode 1)

;; set default editor to emacs client
(setenv "VISUAL" "emacsclient")
(setenv "EDITOR" (getenv "VISUAL"))

;; Hack to make ruby consoles with abnormal prompts work
;; (add-hook 'inf-ruby-mode-hook
;;           (lambda() (let ((p "\\|\\(^chef \\(([\\.[:digit:]]+)>\\)? *\\)"))
;;                        (setq inf-ruby-first-prompt-pattern (concat inf-ruby-first-prompt-pattern p))
;;                        (setq inf-ruby-prompt-pattern (concat inf-ruby-prompt-pattern p)))))


;;; ---------------------
;;; Copied restclient-jq from https://github.com/pashky/restclient.el/blob/master/restclient-jq.el
;;; I'm sure there's a better place to put this...


;;; restclient-jq.el --- support for setting resetclient vars from jq expressions
;;
;; Public domain.

;; Author: Cameron Dorrat <cdorrat@gmail.com>
;; Maintainer: Cameron Dorrat <cdorrat@gmail.com>
;; Created: 26 Apr 2020
;; Keywords: http jq
;; Package-Requires: ((restclient "0") (jq-mode "0.4.1"))

;; This file is not part of GNU Emacs.
;; This file is public domain software. Do what you want.

;;; Commentary:
;;
;; This is a companion to restclient.el to add support for setting variables from results using jq expressions

;;; Code:
;;
(require 'jq-mode)


;; --- jq support
(defun restclient-result-end-point ()
  (save-excursion
    (goto-char (point-max))
    (or (and (re-search-backward "^[^/].*" nil t)
	     (line-end-position))
	(point-max))))

(defun restclient-jq-get-var (jq-pattern)
  (with-temp-buffer
    (let ((output (current-buffer)))
      (with-current-buffer restclient-same-buffer-response-name
        (call-process-region
         (point-min)
         (restclient-result-end-point)
         shell-file-name
         nil
         output
         nil
         shell-command-switch
         (format "%s %s %s"
                 jq-interactive-command
		 "-r"
                 (shell-quote-argument jq-pattern))))
      (string-trim (buffer-string)))))

(defun restclient-json-var-function (args args-offset)
  (save-match-data
   (and (string-match "\\(:[^: \n]+\\) \\(.*\\)$" args)
	(lexical-let ((var-name (match-string 1 args))
		      (jq-patt (match-string 2 args)))
	  (lambda ()
	    (let ((resp-val (restclient-jq-get-var jq-patt)))
	      (restclient-remove-var var-name)
	      (restclient-set-var var-name resp-val)
	      (message "restclient var [%s = \"%s\"] " var-name resp-val)))))))

(defun restclient-jq-interactive-result ()
  (interactive)
  (flush-lines "^//.*") ;; jq doesnt like comments
  (jq-interactively (point-min) (restclient-result-end-point)))


(provide 'restclient-jq)

(eval-after-load 'restclient
  '(progn
     (resetclient-register-result-func
      "jq-set-var" #'restclient-json-var-function
      "Set a resetclient variable with the value jq expression,
       takes var & jq expression as args.
       eg. -> jq-set-var :my-token .token")
     (define-key restclient-response-mode-map  (kbd "C-c C-j") #'restclient-jq-interactive-result)))


;;; ---------------------

;; don't disable scroll-left (disabled by default)
(put 'scroll-left 'disabled nil)

;; enable yas-snippets at startup
(yas-global-mode 1)

;; company completion framework
(global-company-mode 1)

;; company force auto-complete to appear
(global-set-key (kbd "C-c C-/") 'company-complete)

;; Enable global flycheck mode (highlight errors)
(global-flycheck-mode +1)

(message "1")

;; Toggle flycheck mode
(global-set-key (kbd "C-c w") 'global-flycheck-mode)

;; configure tide typescript IDE
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1)
  ;; Make tide and ng2-mode work with flycheck
  (flycheck-add-mode 'typescript-tslint 'ng2-ts-mode)
  ;; (flycheck-add-mode 'typescript-tide 'ng2-ts-mode) ; <-- XXX dosen't work; does typescript-tide ex
  (flycheck-add-mode 'typescript-tide 'ng2-ts-mode)
  ;; custom tide keybindings
  (define-key tide-mode-map (kbd "C-c C-t r") 'tide-references)
  (define-key tide-mode-map (kbd "C-c P") 'prettier-js)
)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; show full file path at the top of buffers
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; yas snipet / completion
(global-set-key (kbd "C-c y") 'company-yasnippet)

;; rename file and buffer (thank you Steve Yegge)
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;; emmet config (html templating system)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; enable spell checking in comments and strings in source code
;; XXX this breaks the C-; binding for goto line (somehow???)
;; (add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; enable global anzu mode (show number of search matches in modeline)
(global-anzu-mode +1)

;; robe - ruby helpers
;; M-. to follow symbol to definition, etc
(add-hook 'ruby-mode-hook 'robe-mode)

;; Turn on column number mode (show column number as well as line number in the modeline)
(column-number-mode +1)


;; alignment rules
(require 'align)

;;; ruby mode alignment
(add-to-list 'align-rules-list
             '(ruby-comma-delimiter
               (regexp . ",\\(\\s-*\\)[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode enh-ruby-mode))))

(add-to-list 'align-rules-list
             '(ruby-hash-literal
               (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
               (group 2 3)
               (repeat . t)
               (modes  . '(ruby-mode enh-ruby-mode))))

(add-to-list 'align-rules-list
             '(ruby-hash-literal2
               (regexp . "[a-z0-9]:\\(\\s-*\\)[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode enh-ruby-mode))))

(add-to-list 'align-rules-list
             '(ruby-assignment-literal
               (regexp . "\\(\\s-*\\)=\\s-*[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode enh-ruby-mode))))

(add-to-list 'align-rules-list
             '(ruby-xmpfilter-mark
               (regexp . "\\(\\s-*\\)# => [^#\t\n]")
               (repeat . nil)
               (modes  . '(ruby-mode enh-ruby-mode))))

;; typescript/javascript modes alignment
(add-to-list 'align-rules-list
             '(js-object-key-value
               (regexp . "[a-z0-9'\"\?]:\\(\\s-*\\)[^# \t\n]")
               (repeat . t)
               (modes . '(ng2-ts-mode tide-mode typescript-mode javascript-mode))))

(add-to-list 'align-rules-list
             '(js-object-key-value
               (regexp . "[a-z0-9]:\\(\\s-*\\)[^# \t\n]")
               (repeat . t)
               (modes . '(ng2-ts-mode tide-mode typescript-mode javascript-mode))))

(add-to-list 'align-rules-list
             '(js-comma-delimiter
               (regexp . ",\\(\\s-*\\)[^# \t\n]")
               (repeat . t)
               (modes  . '(ng2-ts-mode tide-mode typescript-mode javascript-mode))))



;; multiple cursors
;; hold Meta and click to add more cursors (C-g to remove extra cursors)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)
;; add a new cursor on the next line
(global-set-key (kbd "C-c m m") 'mc/mmlte--down)
(global-set-key (kbd "C-c m n") 'mc/mmlte--up)

;;;a asdfasdf
;; asdf
;;;; ;asdfa aksdlfjsf


;; toggle company quickhelp (show documentation along with company auto completion candidates)
(company-quickhelp-mode 0)

(eval-after-load 'company
  '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin))

;; Add extra info directory
(add-to-list 'Info-default-directory-list "~/Info")

;; treat sub-words (ThisIsFourWords) as words
(global-subword-mode +1)

;; prettier-js config
(setq prettier-js-args '(
  "--single-quote" "true"
))

(provide '.emacs)
;;; .emacs ends here
