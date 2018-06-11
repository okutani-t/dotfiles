;; emmet

(require 'emmet-mode)

;; hooks
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'scss-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)

;; indent
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))

(eval-after-load "emmet-mode"
   ;; C-j は newline のままにしておく
  '(define-key emmet-mode-keymap (kbd "C-j") nil))
;;C-i と Tabの被りを回避
(keyboard-translate ?\C-i ?\H-i)
 ;; C-i で展開
(define-key emmet-mode-keymap (kbd "H-i") 'emmet-expand-line)
(define-key emmet-mode-keymap (kbd "C-i") 'emmet-expand-line)
