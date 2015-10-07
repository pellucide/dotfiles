(add-to-list 'load-path "/usr/share/emacs24/site-lisp/doxymacs")

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; Add emacs folder
(add-to-list 'load-path "~/.emacs.d")

;; prompts are y or n instead of yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;; get rid of stupid new file/buffer confirmation
(setq confirm-nonexistent-file-or-buffer nil)

;; make killing buffers slightly easier
(global-set-key (kbd "C-x C-k") 'kill-buffer)

;; increase garbage collection threshhold across all buffers
(setq gc-cons-threshold 100000000)

;; get rid of startup buffer
(setq inhibit-startup-message t)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; set PATH so global is up
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; get rid of windows sounds
(setq ring-bell-function 'ignore)

;; for macs
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;; Editing
(setq-default indent-tabs-mode nil)
(delete-selection-mode)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Commenting
(defun comment-sublime ()
  (interactive)
  (let ((start (line-beginning-position))
        (end (line-end-position)))
    (when (or (not transient-mark-mode) (region-active-p))
      (setq start (save-excursion
                    (goto-char (region-beginning))
                    (beginning-of-line)
                    (point))
            end (save-excursion
                  (goto-char (region-end))
                  (end-of-line)
                  (point))))
    (comment-or-uncomment-region start end)))
(global-set-key (kbd "M-;") 'comment-sublime)

;; will add two new lines and indent if a closing brace "}" is under point
;; otherwise regular newline-and-indent behavior
(defun new-line-dwim ()
  (interactive)
  (if (looking-at-p "}")
      (progn
        (newline-and-indent)
        (newline-and-indent)
        (previous-line)
        (indent-for-tab-command)
        )
    (newline-and-indent)
    )
  )

(global-set-key (kbd "RET") 'new-line-dwim)

;; Replicate Sublime's newline functionality
(defun new-line-arbitrary ()
  "Inserts a new line after the line at point."
  (interactive)
  (progn
    (end-of-line)
    (newline)
    )
  )

(global-set-key (kbd "M-RET") 'new-line-arbitrary)
(global-set-key (kbd "<C-return>") 'new-line-arbitrary)

;; enable for all programming modes
(add-hook 'prog-mode-hook 'subword-mode)

;; Evaluate region or buffer
(defun eval-region-or-buffer ()
  (interactive)
  (let ((debug-on-error t))
    (cond
     (mark-active
      (call-interactively 'eval-region)
      (message "Region evaluated!")
      (setq deactivate-mark t))
     (t
      (eval-buffer)
      (message "Buffer evaluated!")))))

;; Eval region or buffer
(global-set-key (kbd "C-c C-e") 'eval-region-or-buffer)

;; A lovely manifest
(defconst package-list
  '(
    ;; Text manipulation
    drag-stuff                          ; Line transposition
    smartparens                         ; Better parens support
    yasnippet                           ; Snippet support
    ws-butler                           ; Trim whitespace
    duplicate-thing                     ; M-c to duplicate
    multiple-cursors                    ; Multiple cursors

    ;; Themes
    monokai-theme                       ; Preferred theme
    nyan-mode                           ; Nyan-Mode

    ;; Navigation
    helm                                ; Finding-things framework
    helm-projectile                     ; Helm Projectile support
    helm-gtags                          ; Helm gtags support
    helm-swoop                          ; Helm swoop support

    ;; Coding
    function-args                       ; C: show inline arguments for function
    company                             ; Code completion
    projectile                          ; Project management

    ;; Source control
    magit                               ; Git frontend

    ggtags

    sr-speedbar
    
;     clean-aindent-mode                  ; Cleanup double-RET whitespace
;     comment-dwim-2                      ; Comment-dwim with cycline
    ;; anzu                                ; displays current/total matches on isearch
;     dtrt-indent                         ; Guess indentation offset from minor mode
;     exec-path-from-shell                ; Get executable path from shell

;     ;; JavasScript packages
;     ac-js2                              ; AutoComplete for js2-mode 
;     js2-mode                            ; JavaScript mode
    
;     volatile-highlights                 ; Highlight last changes
;     undo-tree                           ; Tree-based undo
;     zygospore                           ; C-x 1 now toggles
    ))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package package-list)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

;; Themes
(load-theme 'monokai 1)
(nyan-mode )

;; Package: magit
(global-set-key (kbd "C-c g") 'magit-status)

;; Package: projejctile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; Package: smartparens
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)

(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

; ;; Swap the smartparens keybindings around
; (defvar  sp-custom-bindings '(
;                               ("C-M-n" . sp-forward-sexp) ;; navigation
;                               ("C-M-p" . sp-backward-sexp)
;                               ("C-M-b" . sp-backward-down-sexp)
;                               ("C-M-f" . sp-up-sexp)
;                               )
;   )
; (--each sp-custom-bindings
;   (define-key sp-keymap (read-kbd-macro (car it)) (cdr it)))


; ;; Package: js2-mode
; (add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
; (add-hook 'js-mode-hook 'js2-minor-mode)
; (add-hook 'js2-mode-hook 'ac-js2-mode)
; (setq js2-highlight-level 3)

;; Package: yasnippet
(require 'yasnippet)
(yas-global-mode 1)

; ;;; Package: auto-complete-config
; ;;; should be loaded after yasnippet so that they can work together
; (require 'auto-complete-config)
; (ac-config-default)
; ;;; set the trigger key so that it can work together with yasnippet on tab key,
; ;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
; ;;; activate, otherwise, auto-complete will
; (ac-set-trigger-key "TAB")
; (ac-set-trigger-key "<tab>")

;; Package: multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-,") 'mc/mark-all-like-this)

; ;; Environment variables from shell
; (when is-mac
;   (require 'exec-path-from-shell)
;   (exec-path-from-shell-initialize))

;; ;; Set up window navigation
;; (global-set-key (kbd "s-+") 'windmove-up)
;; (global-set-key (kbd "s-\"") 'windmove-down)
;; (global-set-key (kbd "s-{") 'windmove-left)
;; (global-set-key (kbd "s-}") 'windmove-right)

;; Package: drag-stuff
(require 'drag-stuff)
(drag-stuff-global-mode)
(global-set-key (kbd "M-N") 'drag-stuff-down)
(global-set-key (kbd "M-P") 'drag-stuff-up)

; (require 'google-c-style)
; (add-hook 'c-mode-common-hook 'google-set-c-style)
; (add-hook 'c-mode-common-hook 'google-make-newline-indent)
; (put 'upcase-region 'disabled nil)

;; Package: helm
(require 'helm-config)
(require 'helm-grep)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq
 helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
 helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.
 helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
 helm-candidate-number-limit 500 ; limit the number of displayed canidates
 helm-ff-file-name-history-use-recentf t
 helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
 helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non-nil
                                        ; useful in helm-mini that lists buffers

 )

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c h o") 'helm-occur)

(global-set-key (kbd "C-c h C-c w") 'helm-wikipedia-suggest)

(global-set-key (kbd "C-c h x") 'helm-register)
;; (global-set-key (kbd "C-x r j") 'jump-to-register)

(define-key 'help-command (kbd "C-f") 'helm-apropos)
(define-key 'help-command (kbd "r") 'helm-info-emacs)
(define-key 'help-command (kbd "C-l") 'helm-locate-library)

;; use helm to list eshell history
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))

;;; Save current position to mark ring
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

;; show minibuffer history with Helm
(define-key minibuffer-local-map (kbd "M-p") 'helm-minibuffer-history)
(define-key minibuffer-local-map (kbd "M-n") 'helm-minibuffer-history)

(define-key global-map [remap find-tag] 'helm-etags-select)

(define-key global-map [remap list-buffers] 'helm-buffers-list)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: helm-swoop                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Locate the helm-swoop folder to your path
(require 'helm-swoop)

;; Change the keybinds to whatever you like :)
(global-set-key (kbd "C-c h o") 'helm-swoop)
(global-set-key (kbd "C-c s") 'helm-multi-swoop-all)

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)

;; From helm-swoop to helm-multi-swoop-all
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)

;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows t)

;; Split direcion. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)

;; If nil, you can slightly boost invoke speed in exchange for text color
(setq helm-swoop-speed-or-color t)

(helm-mode 1)

;; Package: helm-gtags
(require 'helm-gtags)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

;; Enable helm-gtags-mode in Dired so you can jump to any tag
;; when navigate project tree with Dired
(add-hook 'dired-mode-hook 'helm-gtags-mode)

;; Enable helm-gtags-mode in Eshell for the same reason as above
(add-hook 'eshell-mode-hook 'helm-gtags-mode)

;; Enable helm-gtags-mode in languages that GNU Global supports
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'java-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;; key bindings
(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

;; Package: prelude
(defun prelude-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.
If ARG is not nil or 1, move forward ARG - 1 lines first. If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(global-set-key (kbd "C-a") 'prelude-move-beginning-of-line)

;; Package: semantic
(require 'cc-mode)
(require 'semantic)

;; Package: company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)
(add-to-list 'company-backends 'company-c-headers)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)

;; Package: function-args
(require 'function-args)
(fa-config-default)
(define-key c-mode-map  [(control tab)] 'moo-complete)
(define-key c++-mode-map  [(control tab)] 'moo-complete)
(define-key c-mode-map (kbd "M-o")  'fa-show)
(define-key c++-mode-map (kbd "M-o")  'fa-show)

;; Package: ws-butler
(require 'ws-butler)
(add-hook 'c-mode-common-hook 'ws-butler-mode)

(require 'sr-speedbar)

(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)

;; activate whitespace-mode to view all whitespace characters
;; (global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
;; (add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 2)

(require 'doxymacs)
(add-hook 'c-mode-common-hook'doxymacs-mode)
