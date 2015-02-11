(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

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

;; Editing
(setq-default indent-tabs-mode nil)
(delete-selection-mode)
(global-set-key (kbd "RET") 'newline-and-indent)

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

;; A lovely manifest
(defconst package-list
  '(
    anzu                                ; displays current/total matches on isearch
    company                             ; autocomplete framework
    duplicate-thing                     ; M-c to duplicate
    drag-stuff                          ; Line transposition

    ;; Themes
    monokai-theme                       ; Preferred theme
    nyan-mode                           ; Nyan-Mode
    
    helm                                ; Finding-things framework
    helm-projectile                     ; Helm Projectile support
    helm-gtags                          ; Helm gtags support
    helm-swoop                          ; Helm swoop support
    function-args                       ; C: show inline arguments for function
    clean-aindent-mode                  ; Cleanup double-RET whitespace
    comment-dwim-2                      ; Comment-dwim with cycline
    dtrt-indent                         ; Guess indentation offset from minor mode
    ws-butler                           ; Trim whitespace
    exec-path-from-shell                ; Get executable path from shell
    yasnippet                           ; Snippet support
    smartparens                         ; Better parens support
    projectile                          ; Project management

    ;; JavasScript packages
    ac-js2                              ; AutoComplete for js2-mode 
    js2-mode                            ; JavaScript mode
    
    ;; Snippets    
    yasnippet                           ; Snippets for JavaScript
    auto-complete                       ; AutoComplete; TODO: investigate vs company
    
    volatile-highlights                 ; Highlight last changes
    undo-tree                           ; Tree-based undo
    magit                               ; Git frontend
    zygospore                           ; C-x 1 now toggles
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

;; Package: smartparens
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)

;; Swap the smartparens keybindings around
(defvar  sp-custom-bindings '(
                              ("C-M-n" . sp-forward-sexp) ;; navigation
                              ("C-M-p" . sp-backward-sexp)
                              ("C-M-b" . sp-backward-down-sexp)
                              ("C-M-f" . sp-up-sexp)
                              )
  )
(--each sp-custom-bindings
  (define-key sp-keymap (read-kbd-macro (car it)) (cdr it)))

(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

;; Package: js2-mode
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)

;; Package: yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;;; Package: auto-complete-config
;;; should be loaded after yasnippet so that they can work together
(require 'auto-complete-config)
(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;; Environment variables from shell
(when is-mac
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

;; Set up window navigation
(global-set-key (kbd "s-+") 'windmove-up)
(global-set-key (kbd "s-\"") 'windmove-down)
(global-set-key (kbd "s-{") 'windmove-left)
(global-set-key (kbd "s-}") 'windmove-right)
