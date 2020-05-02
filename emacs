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
(evil-mode 1)

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

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(set-keyboard-coding-system nil)

;; Usable on OSX and Windows
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
  (interactive)
  (switch-to-buffer nil))
(global-set-key (kbd "C-^") 'switch-to-last-buffer)

;; Enable moving between windows with S-<arrow keys>
(windmove-default-keybindings)
;; Also move between windows with M-<arrow keys>
(windmove-default-keybindings 'meta)

;; Duplicate line
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y\C-p")

;; Navigating by line
;; (global-set-key (kbd "C-;") 'avy-goto-line)
(global-set-key (kbd "C-;") 'ace-jump-line-mode)
(global-set-key (kbd "C-:") 'goto-line)

;; Show line numbers
(global-display-line-numbers-mode)

;; Enable ido mode everywhere
(setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
(ido-mode 1)
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
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" default)))
 '(electric-pair-mode t)
 '(fringe-mode 0 nil (fringe))
 '(global-magit-file-mode nil)
 '(global-subword-mode t)
 '(global-superword-mode t)
 '(helm-completion-style (quote emacs))
 '(helm-imenu-fuzzy-match t)
 '(ido-mode nil nil (ido))
 '(package-selected-packages
   (quote
    (ruby-end ruby-electric ace-jump-mode projectile-rails ac-inf-ruby expand-region chruby bundler which-key solarized-theme rspec-mode magit yaml-mode helm markdown-mode go-mode highlight-indentation typescript-mode neotree evil avy)))
 '(sentence-end-double-space nil)
 '(window-divider-default-right-width 1)
 '(window-divider-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#002b36" :foreground "#839496" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Menlo"))))
 '(window-divider ((t (:foreground "gray35" :width condensed))))
 '(window-divider-first-pixel ((t nil))))

;; setup projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-project-search-path '("~/Code"))

;; projectile-rails
(projectile-rails-global-mode)

;; setup neotree
(global-set-key (kbd "C-x C-n") 'neotree-toggle)

;; disable audible bell sound
(setq ring-bell-function 'ignore)

;; faster quit
(fset 'yes-or-no-p 'y-or-n-p)

;; Misc keybindings
(global-set-key (kbd "M-i") 'helm-imenu)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-c /") 'comment-or-uncomment-region)

;; Helm
(require 'helm-config)
(helm-mode 1)

;; Set transparency of emacs
(defun set-transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

;; auto pair brackets
(setq electric-pair-mode 1)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c M-g") 'global-magit-file-mode)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)

;; evil mode setup
(define-key evil-insert-state-map (kbd "C-c C-c") 'evil-normal-state)

;; expand-region - expand selection out to semantic "container" (e.g. content inside quotes)
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

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

;; makes % match text objects from a variety of languages, .e.g
;; html: <div></div>, ruby: do...end, etc
(require 'evil-matchit)
(global-evil-matchit-mode 1)

;; use enhanced ruby mode (enh-ruby-mode) for all ruby files
(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
