;;; ruby-mode
(require 'ruby-mode)

;; マジックコメント（# coding: utf-8）停止
(custom-set-variables
 '(ruby-insert-encoding-magic-comment nil))

;; ruby rdefs
(add-hook 'ruby-mode-hook
  (lambda ()
    (define-key ruby-mode-map (kbd "C-c @") 'helm-rdefs)))
