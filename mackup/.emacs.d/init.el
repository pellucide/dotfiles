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

;; A lovely manifest
(defconst package-list
  '(anzu                                ; displays current/total matches on isearch
    company                             ; autocomplete framework
    duplicate-thing                     ; M-c to duplicate
    drag-stuff                          ; Line transposition
    monokai-theme                       ; Preferred theme
    helm                                ; Finding-things framework
    helm-projectile                     ; Helm Projectile support
    helm-gtags                          ; Helm gtags support
    helm-swoop                          ; Helm swoop support
    function-args                       ; C: show inline arguments for function
    clean-aindent-mode                  ; Cleanup double-RET whitespace
;;    comment-dwim-2                    ; (FORKED IN custom/) Comment-dwim with cycline
    dtrt-indent                         ; Guess indentation offset from minor mode
    ws-butler                           ; Trim whitespace
    exec-path-from-shell                ; Get executable path from shell
    yasnippet                           ; Snippet support
    smartparens                         ; Better parens support
    projectile                          ; Project management
    volatile-highlights                 ; Highlight last changes
    undo-tree                           ; Tree-based undo
    magit                               ; Git frontend
    zygospore))                         ; C-x 1 now toggles

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package package-list)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

(load-theme 'monokai 1)

;; Package: magit
(global-set-key (kbd "C-c g") 'magit-status)

;; Package: projejctile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

;; Environment variables from shell
(when is-mac
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize))
