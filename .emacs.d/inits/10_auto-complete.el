;; auto-complete

(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)
(ac-set-trigger-key "TAB")

;; mode
(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'fundamental-mode)
(add-to-list 'ac-modes 'org-mode)

;; 補完メニュー表示時にC-n/C-pで補完候補選択
(setq ac-use-menu-map t)
;; 曖昧マッチ
;; fuzzy.elが必要
;; (setq ac-use-fuzzy t)
