;; disable menubar
(menu-bar-mode -1)

(setq-default indent-tabs-mode nil)

(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

;; disable annoying auto indent mode
(electric-indent-mode -1)
(global-aggressive-indent-mode -1)
(add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1)))

;; reduce annoying prompts
(fset 'yes-or-no-p 'y-or-n-p)
(setq ido-create-new-buffer 'always)

(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; store all backup and autosave files in the tmp dir
;; Save all tempfiles in $TMPDIR/emacs$UID/
(defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist
  `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
  `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
  emacs-tmp-dir)
(setq backup-by-copying t)
(setq create-lockfiles nil)

;; shut up
;;(let (output)
;;  (shut-up
;;    (message "Foo")
;;    (setq output (shut-up-current-output)))
;;  (message "This was the last message: %s" output))

;; projectile
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(projectile-global-mode)
(setq projectile-enable-caching nil)
(setq projectile-require-project-root nil)
;; (setq projectile-file-exists-remote-cache-expire nil)
;; (setq projectile-completion-system 'grizzl)

(require 'helm-projectile)
(helm-projectile-on)
(define-key global-map (kbd "C-x C-f") 'helm-projectile)

(setq ido-everywhere t)

;; yasnippet
(setq yas-snippet-dirs
      '("~/.emacs.d/yasnippet-snippets"))                 ;; personal snippets
(yas-global-mode 1)


;; undo
(global-undo-tree-mode)

;; theme
(load-theme 'lush t)

;;js2
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; set javascript indentation level
(setq js2-mode-hook
      '(lambda () (progn
                    (set-variable 'js-indent-level 4)
                    (set-variable 'js2-basic-offset 4))))


;; load whitespace
(require 'whitespace)
(global-whitespace-cleanup-mode)

;; highlight columns wider than eighty characters
(setq whitespace-line-column 100)
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)
(global-whitespace-mode +1)

                                        ; make carriage returns blue and tabs green
(custom-set-faces
 '(my-carriage-return-face ((((class color)) (:background "firebrick4"))) t)
 '(my-tab-face ((((class color)) (:background "firebrick4"))) t)
 )
                                        ; add custom font locks to all buffers and all files
(add-hook
 'font-lock-mode-hook
 (function
  (lambda ()
    (setq
     font-lock-keywords
     (append
      font-lock-keywords
      '(
        ("\r" (0 'my-carriage-return-face t))
        ("\t" (0 'my-tab-face t))
        ))))))

                                        ; make characters after column 80 purple
(setq whitespace-style
      (quote (face trailing tab-mark lines-tail)))
(add-hook 'find-file-hook 'whitespace-mode)

                                        ; transform literal tabs into a right-pointing triangle
(setq
 whitespace-display-mappings ;http://ergoemacs.org/emacs/whitespace-mode.html
 '(
   (tab-mark 9 [9654 9] [92 9])
                                        ;others substitutions...
      ))

;; Toggle comment line
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
      (next-line)))
(define-key global-map (kbd "M-#") 'comment-or-uncomment-region-or-line)

;; autocomplete
(global-auto-complete-mode)

;; ace jump
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-c C-SPC") 'ace-jump-line-mode)

;; rspec
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))


;; smart-mode-line
(require 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
(sml/setup)

(add-hook 'after-init-hook (lambda ()
  (when (fboundp 'auto-dim-other-buffers-mode)
    (auto-dim-other-buffers-mode t))))

;; visual regexp
(add-to-list 'load-path "folder-in-which-visual-regexp-files-are-in/") ;; if the files are not already in the load path
(require 'visual-regexp)
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
;; if you use multiple-cursors, this is for you:
(define-key global-map (kbd "C-c m") 'vr/mc-mark)
