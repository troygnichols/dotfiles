;;; package --- Summary
;; .emacs - the big emacs config file

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Initializize the packaging system
(package-initialize)

;; Re-sync package list.
;; TODO: can I do this in a way that will not block startup?
;; Can I schedule it to happen once a day?
;; (package-refresh-contents)

;; load restclient-jq - allow restclient mode to use jq to process JSON results.
;; (fetch it from remote url if it's already there)
(let
    ((restclient-jq-filename "~/.emacs.d/restclient-jq.el")
     (restclient-jq-url
      "https://raw.githubusercontent.com/pashky/restclient.el/master/restclient-jq.el"))
  (progn
    (unless (file-exists-p restclient-jq-filename)
      (url-copy-file restclient-jq-url restclient-jq-filename))
    (load "~/.emacs.d/restclient-jq.el")
    ))

;; keep the auto-generated customize settings in a separate file
(setq custom-file "~/.emacs-custom.el")
(load custom-file)

;; install selected packaged
;; TODO: Does this work on a fresh install where package-refresh-contents has not run yet?
(package-install-selected-packages)

;; Determine whether my-setup-evil-mode sets up evil mode or non-evil mode bindings
(setq my-use-evil-mode nil)

(defun my-setup-evil-mode ()
  "Setup evil mode, or non-evil mode bindings, depending on MY-USE-EVIL-MODE."
  (interactive)
  (if my-use-evil-mode
      (progn
        (message "Setting up evil mode.")
        (unless (package-installed-p 'evil)
          (package-install 'evil))

        (require 'evil)

        ;; Make sure C-u (vim page up) works
        (setq evil-want-C-u-scroll t)
        (evil-mode 1)

        ;; evil mode setup
        (define-key evil-insert-state-map (kbd "C-c C-c") 'evil-normal-state)
        (define-key evil-insert-state-map (kbd "C-g C-g") 'evil-normal-state)

        ;; makes % match text objects from a variety of languages, .e.g
        ;; html: <div></div>, ruby: do...end, etc
        (require 'evil-matchit)
        (global-evil-matchit-mode 1))
    (progn
      (message "Not using evil mode.")
      ;; (global-set-key (kbd "C-c ;") 'iy-go-to-or-up-to-continue)
      ;; (global-set-key (kbd "C-c ,") 'iy-go-to-or-up-to-continue-backward)
      (global-set-key (kbd "C-c t") 'iy-go-up-to-char)
      (global-set-key (kbd "C-c T") 'iy-go-up-to-char-backward))))

(my-setup-evil-mode)

(unless (package-installed-p 'projectile-rails)
 (package-install 'projectile-rails))

(unless (package-installed-p 'neotree)
 (package-install 'neotree))

(unless (package-installed-p 'avy)
(package-install 'avy))

;; Cleanup some UX stuff
(tool-bar-mode -1)
(if (display-graphic-p)
    (progn
      ;; Running in graphics mode

      ;; Set scrollbar state
      (toggle-scroll-bar -1))
  (progn
    ;; Running in terminal

    ;; Disable the top menu bar (File Edit ...)
    (menu-bar-mode 0)
    ))

(set-face-attribute 'region nil :background "#666")

;; (set-cursor-color "#ffffff")

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

;; Navigating by line
;; (global-set-key (kbd "C-;") 'avy-goto-line)
(global-set-key (kbd "C-;") 'ace-jump-line-mode)
(global-set-key (kbd "C-:") 'goto-line)

;; Show line numbers
;; (global-display-line-numbers-mode)

;; Setup ido mode
(setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)
(setq ido-use-filename-at-point 'guess)

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

;; disable audible sound
(setq ring-bell-function 'ignore)

;; faster quit
(fset 'yes-or-no-p 'y-or-n-p)


;;;;;;;;;;;;;;;;;;;;;;
;; Misc keybindings ;;
;;;;;;;;;;;;;;;;;;;;;;

;; Shorter window splitting commands
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-below)
(global-set-key (kbd "M-3") 'split-window-right)
(global-set-key (kbd "M-0") 'delete-window)

;; switch kill-region from C-w to C-x C-k
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)

;; make C-w backward-kill-word (replace default of kill-region)
(global-set-key (kbd "C-w") 'backward-kill-word)

;; swap windows
(global-set-key (kbd "C-c C-w C-s") 'ace-swap-window)

;; Duplicate line
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y\C-p")

;; Upcase a single character
(global-set-key (kbd "C-c u") 'upcase-char)

;; Downcase a single character
(global-set-key (kbd "C-c d") 'downcase-dwim)

;; Revert/refresh the current buffer
(global-set-key (kbd "<f5>") 'revert-buffer)

;; Rename the current buffer
(global-set-key (kbd "<f2>") 'rename-buffer)
(global-set-key (kbd "C-c r") 'rename-buffer)

;; Open magit git interface
(global-set-key (kbd "M-g M-g") 'magit)

;; Align text (should select a region first)
(global-set-key (kbd "C-c a") 'align)

;; Use ace-window to switch to another window
(global-set-key (kbd "M-o") 'ace-window)

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


;; in ruby mode: find file under cursor TODO
(add-hook 'enh-ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c r f") 'projectile-rails-goto-file-at-point)))

;; enable debugging in an Rspec buffer
(add-hook 'rspec-compilation-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c , p") 'my-rspec-enable-debugging)))

(defun my-rspec-enable-debugging ()
  "Enable debugging in an Rspec Compilation buffer.

   When an rspec test pauses on a debugger statement, e.g. byebug or pry,
   call this function to make the buffer writable and make it possible
   to work with the interative debugging session."
  (interactive)
  (read-only-mode 0)
  (inf-ruby-switch-from-compilation)
  (end-of-buffer))

;; install rspec snippets
(eval-after-load 'rspec-mode
 '(rspec-install-snippets))

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
(global-set-key (kbd "C-c 0") 'set-transparency-100)
(global-set-key (kbd "C-c 9") 'set-transparency-95)
(global-set-key (kbd "C-c 8") 'set-transparency-90)
(global-set-key (kbd "C-c 7") 'set-transparency-85)
(global-set-key (kbd "C-c 6") 'set-transparency-80)
(global-set-key (kbd "C-c 5") 'set-transparency-75)
(global-set-key (kbd "C-c 4") 'set-transparency-70)
(global-set-key (kbd "C-c 3") 'set-transparency-65)
(global-set-key (kbd "C-c 2") 'set-transparency-60)
(global-set-key (kbd "C-c 1") 'set-transparency-55)


;; Helm / Ivy

;; Determine whether my-setup-helm-ivy sets up helm or ivy, set to "helm" or "ivy"
(setq my-use-helm-or-ivy "ivy")

(defun my-setup-helm-or-ivy ()
  "Setup either helm or ivy depending on the value of MY-SETUP-HELM-OR-IVY."
  (interactive)
  (progn
    (pcase my-use-helm-or-ivy
      ("helm" (my-setup-helm))
      ("ivy" (my-setup-ivy))
      (_ (message "Please set MY-USE-HELM-OR-IVY to 'helm' or 'ivy'")))))

(defun my-setup-helm ()
  "Set up Emacs to use Helm."
  (progn
    (message "Setting up helm")
    (require 'helm-config)
    (helm-mode 1)
    ;; Override default M-x with helm's replacement
    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key (kbd "C-x C-m") 'helm-M-x)
    (global-set-key (kbd "C-c C-m") 'helm-M-x)
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
    ))

(defun my-setup-ivy ()
  "Set up Emacs to use Ivy."
  (progn
    (message "Setting up ivy")
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    ;; enable this if you want `swiper' to use it
    ;; (setq search-default-mode #'char-fold-to-regexp)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "C-c v") 'ivy-push-view)
    (global-set-key (kbd "C-c V") 'ivy-pop-view)
    ;; (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-m") 'execute-extended-command)
    (global-set-key (kbd "C-c C-m") 'counsel-M-x)
    (global-set-key (kbd "C-c b") 'counsel-bookmark)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f12> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f12> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (global-set-key (kbd "M-i") 'counsel-semantic-or-imenu)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    ;; enable counsel-projectile
    (counsel-projectile-mode 1)
    ))

(my-setup-helm-or-ivy)

;; auto pair brackets
(setq electric-pair-mode 1)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c M-g") 'global-magit-file-mode)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)

;; expand-region - expand selection out to semantic "container" (e.g. content inside quotes)
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; change-inner - change inner text, like ci in vim
(require 'change-inner)
(global-set-key (kbd "C-c c i") 'change-inner)
(global-set-key (kbd "C-c c o") 'change-outer)

;; enable which-key (show available commands in temporary buffer)
(which-key-mode 1)

;; ace-jump-mode (jump to words or characters easily)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; delete extra witespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; enable winner mode
(winner-mode 1)
;; alternate winner commands (default are C-c <left> and C-c <right>)
(global-set-key (kbd "C-(") 'winner-undo)
(global-set-key (kbd "C-)") 'winner-redo)

;; set default ruby version with chruby
(chruby-use "2.6.6")

;; use enhanced ruby mode (enh-ruby-mode) for all ruby files
(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))


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
(add-hook 'inf-ruby-mode-hook
          (lambda() (let ((p "\\|\\(^chef \\(([\\.[:digit:]]+)>\\)? *\\)"))
                       (setq inf-ruby-first-prompt-pattern (concat inf-ruby-first-prompt-pattern p))
                       (setq inf-ruby-prompt-pattern (concat inf-ruby-prompt-pattern p)))))


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

;; toggle company quickhelp (show documentation along with company auto completion candidates)
(company-quickhelp-mode 0)

(eval-after-load 'company
  '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin))

;; Add extra info directory
(add-to-list 'Info-default-directory-list "~/Info")

;; treat sub-words (ThisIsFiveSubWords) as words
(global-subword-mode +1)

;; prettier-js config
;; (setq prettier-js-args '(
;;   "--single-quote" "true"
;;   ))

;; add prettier-js-mode minor mode, runs prettier-js on save
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'tide-mode-hook 'prettier-js-mode)
(add-hook 'ng2-html-mode-hook 'prettier-js-mode)

;; set up nov mode (nov.el) for reading .epub documents
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(setq nov-text-width 90)

;; set up pdf-tools for reading and working with PDF documents
(pdf-loader-install)

;; maybe make high definition pdfs look better
(setq pdf-view-use-scaling t)

;; enable which-func mode which tells you which function
;; (or semantic context, like a class, e.g.) point is currently in
(which-function-mode 1)

;; give ng2-html mode some like sgml mode keybindings
(add-hook 'ng2-html-mode-hook
          (lambda ()
            (progn
              (local-set-key (kbd "C-c C-f") 'sgml-skip-tag-forward)
              (local-set-key (kbd "C-c C-b") 'sgml-skip-tag-backward))))

;; set the indent level for json mode
(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

;; Shortcut alias for query-replace-regexp, run M-x qrr
(defalias 'qrr 'query-replace-regexp)

(provide '.emacs)
;;; .emacs ends here
