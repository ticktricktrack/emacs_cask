;; paragraph jumping
;;(define-key input-decode-map "\e\eOA" [(meta up)])
;;(define-key input-decode-map "\e\eOB" [(meta down)])

;; launch magit-status
(define-key global-map (kbd "C-c m") 'magit-status)

;; toggle ruby hash syntax
;; (define-key global-map (kbd "C-c h") 'ruby-toggle-hash-syntax)

;; home end
(define-key global-map (kbd "M-p") 'backward-paragraph)
(define-key global-map (kbd "M-n") 'forward-paragraph)

;; next window
(define-key global-map (kbd "C-o") 'previous-multiframe-window)

;; visual regexp
(define-key global-map (kbd "C-r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
;; if you use multiple-cursors, this is for you:
(define-key global-map (kbd "C-c m") 'vr/mc-mark)

;; resize windows
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)


;; (require 'mouse)
;; (xterm-mouse-mode t)
;; (global-set-key [mouse-5] 'previous-line)
;; (global-set-key [mouse-4] 'next-line)
;; (defun track-mouse (e))
;; (setq mouse-sel-mode t)

;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
