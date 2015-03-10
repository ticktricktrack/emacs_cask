;; paragraph jumping
(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])

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
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
;; if you use multiple-cursors, this is for you:
(define-key global-map (kbd "C-c m") 'vr/mc-mark)
