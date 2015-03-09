;; paragraph jumping
(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])

;; launch magit-status
(define-key global-map (kbd "C-c m") 'magit-status)

;; toggle ruby hash syntax
;; (define-key global-map (kbd "C-c h") 'ruby-toggle-hash-syntax)

;; home end
(define-key global-map (kbd "M-p") 'beginning-of-buffer)
(define-key global-map (kbd "M-n") 'end-of-buffer)
