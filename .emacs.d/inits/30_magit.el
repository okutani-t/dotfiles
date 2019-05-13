;;; magit

(use-package magit)

;; ページャをEmacs用にカスタマイズ
(setenv "GIT_PAGER" "cat")

(use-package magit
  :defer t
  :init
  :bind (("C-x g"   . magit-status)
         ("C-x C-g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup))
  :config
  (setq magit-refs-show-commit-count 'all
        magit-log-buffer-file-locked t
        magit-revision-show-gravatars nil
        ;; M-x magit-status -> y 時のブランチ切り替えをEnterでできるようにする
        magit-visit-ref-behavior '(checkout-any focus-on-ref)))
