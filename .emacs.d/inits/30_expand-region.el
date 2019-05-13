;;; expand-region

(use-package expand-region)

(global-set-key (kbd "M-@") 'er/expand-region)

;; transient-mark-modeが nilでは動作しないので注意
(transient-mark-mode t)
