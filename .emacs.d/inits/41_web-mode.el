;;; web-mode

(use-package web-mode)

;;; 適用する拡張子
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig$"      . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js[x]?$" . web-mode))

;; 拡張子 .js でもJSX編集モードに
(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))

;;; インデント数
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-php-indent-offset 4)
  )
(add-hook 'web-mode-hook 'web-mode-hook)

;;色の設定
(custom-set-faces
 '(web-mode-doctype-face
   ((t (:foreground "#82AE46"))))                          ; doctype
 '(web-mode-html-tag-face
   ((t (:foreground "#FF0040" :weight bold))))             ; 要素名
 '(web-mode-html-attr-name-face
   ((t (:foreground "#267DFF"))))                          ; 属性名など
 '(web-mode-html-attr-value-face
   ((t (:foreground "#FA58D0"))))                          ; 属性値
 '(web-mode-comment-face
   ((t (:foreground "#00BAB4"))))                          ; コメント
 '(web-mode-server-comment-face
   ((t (:foreground "#FF7F50"))))                          ; コメント
 '(web-mode-css-rule-face
   ((t (:foreground "#A0D8EF"))))                          ; cssのタグ
 '(web-mode-css-pseudo-class-face
   ((t (:foreground "#FF7F00"))))                          ; css 疑似クラス
 '(web-mode-css-at-rule-face
   ((t (:foreground "#FF7F00"))))                          ; cssのタグ
 )

;; コメントアウト
(define-key web-mode-map (kbd "M-;") 'web-mode-comment-or-uncomment)

;; 対応するタグのハイライト
(setq web-mode-enable-current-element-highlight t)
;; 対応するカラムのハイライト
(setq web-mode-enable-current-column-highlight t)

;; 自動{}補完を停止
(setq web-mode-enable-auto-pairing nil)
(setq web-mode-auto-close-style nil)
