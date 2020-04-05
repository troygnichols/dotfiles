(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(package-refresh-contents)

(unless (package-installed-p 'evil)
  (package-install 'evil))
; (require 'evil)
; (evil-mode 1)

;; Disable some UX stuff
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;;(unless (package-installed-p 'neotree)
;;  (package-install 'neotree))
;; (require 'neotree)
;; (global-set-key (kbd "C-x C-n") 'neotree-toggle)
;; (custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(ansi-color-faces-vector
;;   [default default default italic underline success warning error])
;; '(custom-enabled-themes (quote (misterioso)))
;;  '(package-selected-packages (quote (avy))))
;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; )

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

;; Indentation
;; (setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)
;; (setq standard-indent 4)
;; (setq indent-line-function 'insert-tab)
;; (setq tab-width 4)
;; (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
;; (setq indent-tabs-mode nil)

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
; (setq ido-enable-flex-matching t)
; (setq ido-everywhere t)
; (ido-mode 1)


; (setq ido-use-filename-at-point 'guess)

;; Make NeoTree work with evil mode
; (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
; (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
; (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
; (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
; (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
; (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
; (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
; (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
; (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(global-subword-mode t)
 '(global-superword-mode t)
 '(ido-mode nil nil (ido))
 '(package-selected-packages (quote (typescript-mode neotree evil avy)))
 '(sentence-end-double-space nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-set-key (kbd "M-o") 'other-window)
