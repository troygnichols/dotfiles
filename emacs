(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(package-refresh-contents)

(unless (package-installed-p 'evil)
  (package-install 'evil))
; (require 'evil)
; (evil-mode 1)

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
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")

;; Navigating by line
(global-set-key (kbd "C-;") 'avy-goto-line)
(global-set-key (kbd "C-:") 'goto-line)

;; Show line numbers
(global-display-line-numbers-mode)

;; Enable ido mode everywhere
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
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
    ("830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" default)))
 '(fringe-mode 0 nil (fringe))
 '(global-subword-mode t)
 '(global-superword-mode t)
 '(helm-completion-style (quote emacs))
 '(ido-mode nil nil (ido))
 '(package-selected-packages
   (quote
    (solarized-theme dired-sidebar helm markdown-mode go-mode highlight-indentation typescript-mode evil avy)))
 '(sentence-end-double-space nil)
 '(window-divider-default-right-width 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(window-divider ((t (:foreground "gray15")))))

;; setup projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-project-search-path '("~/Code"))

;; setup neotree
(global-set-key (kbd "C-x C-n") 'neotree-toggle)

;; disable audible bell sound
(setq ring-bell-function 'ignore)

;; faster quit
(fset 'yes-or-no-p 'y-or-n-p)

;; Misc keybindings
(global-set-key (kbd "M-i") 'imenu)
(global-set-key (kbd "M-o") 'other-window)

;; Helm
(require 'helm-config)

;; Set transparency of emacs
(defun set-transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

;; auto pair brackets
(setq electric-pair-mode 1)
