;; yasnippet

(require 'yasnippet)

;; 自分用・追加用テンプレート -> mysnippetに作成したテンプレートが格納される
;; yasnippets -> https://github.com/AndreaCrotti/yasnippet-snippets
(setq yas-snippet-dirs
      '("~/.emacs.d/mysnippet"
        "~/.emacs.d/yasnippets"
        ))

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

(yas-global-mode 1)
