;;; flycheck
;; シンタックスチェック

(use-package flycheck)

(global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(add-hook 'ruby-mode-hook 'flycheck-mode)
