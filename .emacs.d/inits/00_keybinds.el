;; keybinds

;; C-hをbackspaceに
(bind-key "C-h" 'delete-backward-char)

;; C-mで改行を含める
(bind-key "C-m" 'newline-and-indent)

;;C-x C-fで開ける種類を増やす
(ffap-bindings)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; 画面縦分割と移動をM-t一つで行う(C-x 3 C-x o --> C-t)
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)

;; 行移動をM-gに割り当て
(bind-key "M-g" 'goto-line)

;; インデントを揃える
(bind-key "C-c C-i" 'indent-region)
;; なぜかmac版emacsはC-c H-iになってしまうので応急処置
(bind-key "C-c H-i" 'indent-region)

;; yank設定→なぜかたまに無効になるため
(bind-key "C-y" 'yank)

;; 1行コピーをおこなうコマンド
(defun copy-line (&optional arg)
  (interactive "p")
  (copy-region-as-kill
   (line-beginning-position)
   (line-beginning-position (1+ (or arg 1))))
  (message "Line copied"))
(bind-key "M-k" 'copy-line)

;; 単語ごとの削除をコピーなしに変更
;; M-hに前の単語を削除を割り当て
(defun delete-word (arg)
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun backward-delete-word (arg)
  (interactive "p")
  (delete-word (- arg)))

(bind-key "M-d" 'delete-word)
(bind-key "M-h" 'backward-delete-word)

;; C-aにインデントを含まない設定→連打で行き来する
(defun my-move-beginning-of-line ()
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))

(bind-key "C-a" 'my-move-beginning-of-line)

;; htmlをchromeで素早く開く
(bind-key "C-c C-o" 'browse-url-of-file)

;; 現在開いているファイルのディレクトリを開く
(defun open-current-dir-with-finder ()
  (interactive)
  (shell-command (concat "open .")))
(bind-key "C-c o d" 'open-current-dir-with-finder)

;; M-;でコメントアウト
(defun one-line-comment ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (set-mark (point))
    (end-of-line)
    (comment-or-uncomment-region (region-beginning) (region-end))))

(bind-key "M-;" 'one-line-comment)

;; ファイル名をバッファ上で変更
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(bind-key "C-c C-n" 'rename-file-and-buffer)
