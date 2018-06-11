;; cua-mode

(cua-mode t)

;; デフォルトのCUAキーバインドを無効にする
(setq cua-enable-cua-keys nil)
;; cua設定
(define-key global-map (kbd "C-x SPC") 'cua-set-rectangle-mark)
