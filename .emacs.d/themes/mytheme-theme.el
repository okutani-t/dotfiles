;;; theme
;; http://syohex.hatenablog.com/entry/20121211/1355231365

(deftheme mytheme
  "my color theme")

(custom-theme-set-faces
 'mytheme
 ;; 背景・文字・カーソル
 '(cursor ((t (:background "#F8F8F2" :foreground "#F8F8F2"))))
 '(default ((t (:background "#0a0a0a" :foreground "#09D26D"))))

 ;; 選択範囲
 '(region ((t (:background "#505050"))))

 ;; モードライン
 '(mode-line ((t (:foreground "#F8F8F2" :background "#000000"
                  :box (:line-width 1 :color "#000000" :style released-button)))))
 '(mode-line-buffer-id ((t (:foreground nil :background nil))))
 '(mode-line-inactive ((t (:foreground "#BCBCBC" :background "#333333"
                           :box (:line-width 1 :color "#333333")))))

 ;; ハイライト
 '(highlight ((t (:foreground "#333" :background "#333"))))
 '(hl-line ((t (:background "#222"))))

 ;; 関数名
 '(font-lock-function-name-face ((t (:foreground "#c2007b"))))

 ;; 変数名・変数の内容
 '(font-lock-variable-name-face ((t (:foreground "#E20000"))))
 '(font-lock-string-face ((t (:foreground "#2C87E9"))))

 ;; 特定キーワード
 '(font-lock-keyword-face ((t (:foreground "#F92672"))))

 ;; Boolean
 '(font-lock-constant-face((t (:foreground "#AE81BC"))))

 ;; 括弧
 '(show-paren-match-face ((t (:foreground "#ccc" :background "#DF1F82"))))
 '(paren-face ((t (:foreground "#DF1F82" :background nil))))

 ;; コメント
 '(font-lock-comment-face ((t (:foreground "#DF1F82"))))

 ;; CS
 '(css-selector ((t (:foreground "#890000"))))
 '(css-property ((t (:foreground "#D10243"))))

 ;; nXML-mode
 ;; タグ名
 '(nxml-element-local-name ((t (:foreground "#F92672"))))
 ;; 属性
 '(nxml-attribute-local-name ((t (:foreground "#D10243"))))
 ;; 括弧
 '(nxml-tag-delimiter ((t (:foreground "#A6E22A"))))
 ;; DOCTYPE宣言
 '(nxml-markup-declaration-delimiter ((t (:foreground "#74715D"))))

 ;; dired
 '(dired-directory ((t (:foreground "#dc9610"))))
 '(dired-symlink ((t (:foreground "#c2007b")))))

;;;###autoload
