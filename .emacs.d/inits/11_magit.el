;; magit

;; ページャをEmacs用にカスタマイズ
(setenv "GIT_PAGER" "cat")

(use-package magit
  :ensure t
  :defer t
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup)))

;; M-x magit-status -> y でブランチ切り替えをEnterでできるようにする
(setq magit-visit-ref-behavior '(checkout-any focus-on-ref))
