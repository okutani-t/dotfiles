;; whitespace

;; 行末の空白をハイライト
(setq-default show-trailing-whitespace t)

;; 行末の空白を削除(保存時)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
