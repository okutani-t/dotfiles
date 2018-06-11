;;; dired

;; diredをdiredxに切り替える
(add-hook 'dired-load-hook (lambda () (load "dired-x")))

;; diredバッファでC-sした時にファイル名だけにマッチするように
(setq dired-isearch-filenames t)

;; wdired の設定　rを押すとリネームできる
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; diredで出てくる書き込み権限等を非表示
(define-key dired-mode-map (kbd "(") 'dired-hide-details-mode)
(define-key dired-mode-map (kbd ")") 'dired-hide-details-mode)
