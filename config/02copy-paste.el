;; mark whole line

(defun mark-line ()
  "Select the current line."
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position)))

(define-key global-map (kbd "C-l") 'mark-line)

(defun copy-to-clipboard ()
  (interactive)
  (shell-command-on-region (region-beginning) (region-end) "pbcopy"))

(define-key global-map (kbd "M-c") 'copy-to-clipboard)
